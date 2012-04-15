// Generated by CoffeeScript 1.3.1
var Accented, DefaultNoteLengths, DefaultPatterns, Ghosted, HalfNote, Note, NoteLength, ParadiddlePattern, Pattern, QuarterNote, RandomSong, SixteenthNote, Song, WholeNote,
  __slice = [].slice,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

Array.prototype.sum = function() {
  return this.reduce(function(a, e) {
    return a + e;
  });
};

Array.prototype.shuffle = function() {
  return this.sort(function() {
    return Math.round(Math.random());
  });
};

Array.prototype.sample = function(n) {
  if (n == null) {
    n = 1;
  }
  return this.shuffle().slice(0, (n - 1) + 1 || 9e9);
};

String.prototype.htmlEscape = function() {
  return this.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
};

NoteLength = (function() {

  NoteLength.name = 'NoteLength';

  function NoteLength(length, name) {
    this.length = length;
    this.name = name != null ? name : "note";
  }

  NoteLength.prototype.inspect = function() {
    return "(length " + this.name + ")";
  };

  return NoteLength;

})();

Note = (function() {

  Note.name = 'Note';

  function Note(noteLength, weight) {
    this.noteLength = noteLength;
    this.weight = weight;
  }

  Note.prototype.inspect = function() {
    return "<Note " + (this.noteLength.inspect()) + " (weight " + this.weight + ")>";
  };

  return Note;

})();

Pattern = (function() {

  Pattern.name = 'Pattern';

  function Pattern(name, notes) {
    this.name = name;
    this.notes = notes;
  }

  Pattern.prototype.length = function() {
    return (this.notes.map(function(x) {
      return x[0].length;
    })).sum();
  };

  Pattern.prototype.inspect = function() {
    return "" + this.name + ": " + ((this.notes.map(function(note) {
      return "\n  " + (note.inspect());
    })).join(" "));
  };

  return Pattern;

})();

Song = (function() {

  Song.name = 'Song';

  function Song() {
    patterns = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    this.patterns = patterns;
  }

  return Song;

})();

RandomSong = (function(_super) {

  __extends(RandomSong, _super);

  RandomSong.name = 'RandomSong';

  function RandomSong() {
    RandomSong.__super__.constructor.call(this, ParadiddlePattern);
  }

  RandomSong.prototype.pp = function() {
    return (this.patterns.map(function(pattern) {
      return pattern.inspect();
    })).join("\n\n").htmlEscape();
  };

  return RandomSong;

})(Song);

/* Defaults
*/


WholeNote = new NoteLength(1 / 1, "whole note");

HalfNote = new NoteLength(1 / 2, "half note");

QuarterNote = new NoteLength(1 / 4, "quarter note");

SixteenthNote = new NoteLength(1 / 16, "sixteenth note");

DefaultNoteLengths = [WholeNote, HalfNote, QuarterNote, SixteenthNote];

Accented = 2;

Ghosted = 1;

ParadiddlePattern = new Pattern("Paradiddle", [new Note(SixteenthNote, Accented), new Note(SixteenthNote, Ghosted), new Note(SixteenthNote, Accented), new Note(SixteenthNote, Accented)]);

DefaultPatterns = [ParadiddlePattern];

console.log((new RandomSong).pp());
