#!@PYTHON@

import sys
import os

lilypath =''
try:
    lilypath = os.environ['LILYPOND_SOURCEDIR'] + '/'
except IndexError:
    lilypath = os.environ['HOME'] + 'musix/current'
lilypath = lilypath + '/bin/'
sys.path.append(lilypath)


from lilypython import *
import getopt
import pipes


mp_version = '0.3'

class Options:
    def __init__(self):
	self.to_version = lilydirs.version_tuple()
	self.from_version = prev_version(self.to_version)

options = Options()
	

def help():
    sys.stdout.write(
	'Generate a patch to go to this version.\n'
	'  --from=FROM, -f FROM    old is FROM\n'
	'  --to=TO, -t TO          to version TO\n'  
	
	)



def untar(fn):
    # os.system('pwd');
    sys.stderr.write('untarring ' + fn)
# can't seem to fix errors:
# gzip: stdout: Broken pipe
# tar: Child returned status 1
#   os.system ('tar xzf ' + fn)
#   sys.stderr.write('\n')
# ugh, even this does not work, but one error message less :-)
    os.system ('gzip --quiet -dc ' + fn + '| tar xf - ')
# so print soothing message:
    sys.stderr.write('make-patch:ugh: Please ignore error: gzip: stdout: Broken pipe\n');
    sys.stderr.flush()


header = 'Generated by make-patch, old = %s, new = %s\n\
\n\
usage \n\
\n\
	cd lilypond-source-dir; patch -E -p0 < %s\n\
\n\
Patches do not contain automatically generated files, \n\
i.e. you should rerun configure\n\n'

pats = ['*.lsm', 'configure', '*.txt', 'lilypond.spec']
def remove_automatic(dirnames):
    files = []
    files = files + multiple_find(pats, dirnames)

    for f in files:
	os.remove(f)

def makepatch(fv, tv, patfile_nm):
    import tempfile
    prev_cwd = os.getcwd();
    os.chdir ('/tmp')
    untar(released_tarball(fv))
    untar(released_tarball(tv))
    remove_automatic([dirname(fv), dirname(tv)])

    os.chdir(dirname(tv))
    
    if not patfile_nm:
	patfile_nm = '../patch-%s' % version_tuple_to_str(tv)

    f = open(patfile_nm, 'w')
    f.write(header %\
	    (version_tuple_to_str(fv), version_tuple_to_str(tv), \
	     os.path.basename(patfile_nm)))
    f.close()
	    
    sys.stderr.write('diffing to %s... ' % patfile_nm)
    os.system('diff -urN ../%s . >> %s' % (dirname(fv), patfile_nm))
    #os.system('gzip -9f %s' % patfile_nm)
    os.chdir('/tmp')

    sys.stderr.write('cleaning ... ')
    os.system('rm -fr %s %s' % (dirname(tv), dirname(fv)))
    sys.stderr.write('\n')
    os.chdir(prev_cwd)
    
def main():
    sys.stderr.write('This is make-patch version %s\n' % mp_version)
    (cl_options, files) = getopt.getopt(sys.argv[1:], 
					'hf:o:t:', ['output=', 'help', 'from=', 'to='])
    outfn = ''
    for opt in cl_options:
	o = opt[0]
	a = opt[1]
	if o == '--from' or o == '-f':
	     options.from_version = version_str_to_tuple(a)
	elif o == '--to' or o == '-t':
	    options.to_version = version_str_to_tuple(a)
	elif o== '--help' or o == '-h':
	    help()
	    return 0;
	elif o == '--output' or o == '-o':
	    outfn = os.path.join(os.getcwd(), a)
	else:
	    raise getopt.error

    if not outfn:
	pn = 'patch-%s' % version_tuple_to_str(options.to_version)
	outfn =  os.path.join(os.getcwd(), pn)

    makepatch(options.from_version, options.to_version, outfn)

if __name__ == '__main__':
    main()
