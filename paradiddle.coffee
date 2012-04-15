class Note
  constructor: (@length) ->
  inspect: () -> "#<Note @length=#{@length}>"

class Pattern
  constructor: (@notes) ->
  length: () -> (@notes.map (x) -> x.length).reduce (x, y) -> x + y

class Song
  constructor: (@patterns) ->

WholeNote = new Note 1.0
HalfNote = new Note 0.5
QuarterNote = new Note 0.25
EighthNote = new Note 0.125
SixteenthNote = new Note 0.0625

Accented = 2
Ghosted = 1

Paradiddle = new Pattern [
  [SixteenthNote, Accented],
  [SixteenthNote, Ghosted],
  [SixteenthNote, Accented],
  [SixteenthNote, Accented]
]
