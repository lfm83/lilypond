\version "1.7.10"
% the Gm7sus4/D chord prints as Gm/4/7/D
% it took me quite a while by experiment to work out how to enter it -- PC

% perhaps the current modifier approach is too simplistic



gmsus=\notes\relative c \chords{ 
	g1
	% Gm7sus4: the hard way
	g1:3-.4.7

	% another hard way:
	\notes { << g' bes c d f >>1 }

	% bit easier:
	g1:m.4.7

	g1:m7.sus
	g1:m7.sus4

	% and finally:
	g1:m7.sus/d
}

\score{
	<
		\context ChordNames \gmsus
		\context Staff \gmsus
	>
}
%% new-chords-done %%
