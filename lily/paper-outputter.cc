/*
  paper-outputter.cc -- implement Paper_outputter

  source file of the GNU LilyPond music typesetter

  (c)  1997--2003 Han-Wen Nienhuys <hanwen@cs.uu.nl>
  Jan Nieuwenhuizen <janneke@gnu.org>
*/

#include <time.h>
#include <math.h>

#include "dimensions.hh"
#include "virtual-methods.hh"
#include "paper-outputter.hh"
#include "molecule.hh"
#include "array.hh"
#include "string-convert.hh"
#include "warn.hh"
#include "font-metric.hh"
#include "main.hh"
#include "scm-hash.hh"
#include "lily-version.hh"
#include "paper-def.hh"
#include "input-file-results.hh"
#include "ly-modules.hh"



/*
  TODO: this entire class should be implemented at Scheme level.


  
 */
Paper_outputter::Paper_outputter (String name)
{
  if (safe_global_b)
    {
      gh_define ("security-paranoia", SCM_BOOL_T);      
    }
  
  file_ = scm_open_file (scm_makfrom0str (name.to_str0 ()),
			    scm_makfrom0str ("w"));

  /*
    ugh.
   */
  SCM exp = scm_list_n (ly_symbol2scm ("find-dumper"),
			scm_makfrom0str (output_format_global.to_str0 ()),
			SCM_UNDEFINED);

  output_func_  = scm_primitive_eval (exp);
}

Paper_outputter::~Paper_outputter ()
{
  scm_close_port (file_);
  file_ = SCM_EOL;
}


void
Paper_outputter::output_header ()
{
  time_t t (time (0));
  String generate = ctime (&t);
  generate = generate.left_string (generate.length () - 1) + " " + *tzname;
  
  /* Fixed length time stamp */
  generate = generate + to_string (' ', (50 - generate.length ()) >? 0);
  
  /* Fixed length creator string */
  String creator = gnu_lilypond_version_string ();
  creator += " (http://lilypond.org)";
  creator = creator + to_string (' ', (50 - creator.length ()) >? 0);
  
  SCM args_scm = scm_list_n (scm_makfrom0str (creator.to_str0 ()),
			     scm_makfrom0str (generate.to_str0 ()),
			     SCM_UNDEFINED);


  SCM scm = gh_cons (ly_symbol2scm ("header"), args_scm);

  output_scheme (scm);
}



void
Paper_outputter::output_comment (String str)
{
  output_scheme (scm_list_n (ly_symbol2scm ("comment"),
			  scm_makfrom0str ((char*)str.to_str0 ()),
			  SCM_UNDEFINED)
		 );
}

void
Paper_outputter::output_scheme (SCM scm)
{
  gh_call2 (output_func_, scm, file_);
}

void
Paper_outputter::output_scope (SCM mod, String prefix)
{
  if (!SCM_MODULEP (mod))
    return ;
  
  SCM al = ly_module_to_alist (mod);
  for (SCM s = al ; gh_pair_p (s); s = ly_cdr (s))
    {
      SCM k = ly_caar (s);
      SCM v = ly_cdar (s);
      String s = ly_symbol2string (k);
      
      if (gh_string_p (v))
	{
	  output_String_def (prefix + s, ly_scm2string (v));
	}
      else if (scm_number_p (v) == SCM_BOOL_T && scm_exact_p (v) == SCM_BOOL_T)
	{
	  output_int_def (prefix + s, gh_scm2int (v));	  
	}
      else if (gh_number_p (v))
	{
	  output_Real_def (prefix + s, gh_scm2double (v));
	}
    }
}

void
Paper_outputter::output_version ()
{
  String id_string = "Engraved by LilyPond";
  id_string += String_convert::pad_to (String (", ") + version_string (), 40);

  output_String_def ("lilypondtagline", id_string);
  output_String_def ("LilyPondVersion", version_string ());
  output_String_def ("lilypondpaperunit", String (INTERNAL_UNIT));  
}


void
Paper_outputter::output_Real_def (String k, Real v)
{
  
  SCM scm = scm_list_n (ly_symbol2scm ("lily-def"),
			scm_makfrom0str (k.get_str0 ()),
			scm_makfrom0str (to_string (v).get_str0 ()),
			SCM_UNDEFINED);
  output_scheme (scm);
}

void
Paper_outputter::output_String_def (String k, String v)
{
  
  SCM scm = scm_list_n (ly_symbol2scm ("lily-def"),
		     scm_makfrom0str (k.get_str0 ()),
		     scm_makfrom0str (v.get_str0 ()),
		     SCM_UNDEFINED);
  output_scheme (scm);
}

void
Paper_outputter::output_int_def (String k, int v)
{
  SCM scm = scm_list_n (ly_symbol2scm ("lily-def"),
		     scm_makfrom0str (k.get_str0 ()),
		     scm_makfrom0str (to_string (v).get_str0 ()),
		     SCM_UNDEFINED);
  output_scheme (scm);
}

void
Paper_outputter::write_header_field_to_file (String filename, SCM key, SCM value)
{
  output_scheme (scm_list_n (ly_symbol2scm ("header-to-file"),
			     scm_makfrom0str (filename.to_str0 ()),
			     ly_quote_scm (key), value,
			     SCM_UNDEFINED));
}

void
Paper_outputter::write_header_fields_to_file (SCM mod)
{
  if (ly_module_p (mod)&&
      dump_header_fieldnames_global.size ())
    {
      SCM fields = ly_module_to_alist (mod);
      for (int i = 0; i < dump_header_fieldnames_global.size (); i++)
	{
	  String key = dump_header_fieldnames_global[i];
	  SCM val = gh_assoc (ly_symbol2scm (key.to_str0 ()), fields);
	  String s;
	  /* Only write header field to file if it exists */
	  if (gh_pair_p (val) && gh_string_p (ly_cdr (val)))
	    {
	      s = ly_scm2string (ly_cdr (val));
	      /* Always write header field file, even if string is empty ... */
	      write_header_field_to_file (basename_ , ly_car (val), ly_cdr (val));
	    }
	}
    }
}
