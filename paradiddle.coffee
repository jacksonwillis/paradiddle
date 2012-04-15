Array::sum = () -> @.reduce (x, y) -> x + y
Array::sample = (n = 1) -> (@.sort (a,b) -> Math.round Math.random())[0..n-1]
String::htmlEscape = () -> @.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;")

class NoteLength
  constructor: (@length, @name = "note") ->
  inspect: () -> "(length #{@name})"

class Note
  constructor: (@noteLength, @weight) ->
  inspect: () -> "<Note #{@noteLength.inspect()} (weight #{@weight})>"

class Pattern
  constructor: (@name, @notes) ->
  length: () -> (@notes.map (x) -> x[0].length).sum()
  inspect: () -> "#{@name}: #{(@notes.map (note) -> "\n  #{note.inspect()}").join(" ")}"

class Song
  constructor: (@patterns...) ->
  #pp: () -> (@patterns.map (pattern) -> pattern.inspect()).join("\n")

class RandomSong extends Song
  constructor: () ->
    super ParadiddlePattern
  pp: () -> (@patterns.map (pattern) -> pattern.inspect()).join("\n\n").htmlEscape()

### Defaults ###

WholeNote     = new NoteLength 1/1,  "whole note"
HalfNote      = new NoteLength 1/2,  "half note"
QuarterNote   = new NoteLength 1/4,  "quarter note"
SixteenthNote = new NoteLength 1/16, "sixteenth note"

DefaultNoteLengths = [WholeNote, HalfNote, QuarterNote, SixteenthNote]

Accented = 2
Ghosted  = 1

ParadiddlePattern = new Pattern "Paradiddle", [
  new Note(SixteenthNote, Accented),
  new Note(SixteenthNote, Ghosted),
  new Note(SixteenthNote, Accented),
  new Note(SixteenthNote, Accented)
]

DefaultPatterns = [ParadiddlePattern]

console.log (new RandomSong).pp()
