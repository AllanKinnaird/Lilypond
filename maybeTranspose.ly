% maybeTranspose.ly v0.2, Allan Kinnaird 19 Aug 2016
% Note that I am not sure this works correctly for MIDI generation
% I'll make sure it does before we get to v1.0 !

% This function takes a voice in C major and
%  transposes it if required into the key of
%  the transposing instrument playing it.
% The utility is that scores tend to be written by
%  the composers with all instruments in the same
%  key, but operational conductors need to know
%  what each instrument thinks it's playing, e.g. :
%  "Clarinet 2 - You should have been playing C# in bar 63!"

% Usage:
%  Probably set a boolean variable at the start of the Lilypond code:
%%% Do I want this as concert pitch or transposed to the nominal keys of the instruments?
%%  transposeThis = ##t
% and then call the function in the appropriate Staff block - e.g. for an E flat Alto Sax:
%   \maybeTranspose ees \altoSaxMusic \transposeThis

\version "2.18.2"
% or whatever Lilypond version you are using

maybeTranspose =
#(define-music-function
     (parser location key voice transp)
     (ly:pitch? ly:music? boolean?)
     
   (if ( eq? transp #t )
       ; then
       #{ % transpose for MIDI
            \transposition $key
           % transpose for print and return
            \transpose $key c' $voice #}
       ; else return untransposed
       #{ $voice #}))

