\version "2.18.2"
% or whatever version you are using

% This function takes a voice in C major and
%  transposes it if required into the key of
%  the transposing instrument playing it.
% The utility is that scores tend to be written by
%  the composers with all instruments in the same
%  key, but operational conductors need to know
%  what each instrument thinks it's playing, e.g. :
%  "Clarinet 2 - You should have been playing C# in bar 63!"

maybeTranspose =
#(define-music-function
     (parser location key voice)
     (ly:pitch? ly:music?)
     
   (if ( eq? transposeThis #t )
       ; then
       #{ % transpose for MIDI
            \transposition $key
           % transpose for print and return
            \transpose $key c' $voice #}
       ; else return untransposed
       #{ $voice #}))
