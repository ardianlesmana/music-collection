Music (version 0.1.0)
=====================
Music is a friendly English-like interface for managing your music collection via command line.

Set Up
------
1. First, git clone this repo with `git clone https://github.com/ardianlesmana/music-collection`
2. Run `./bin/music` 

Documentation
-------------

The following is a non-exhaustive list of things you can do:
* `add "$title" "$artist"`: adds an album to the collection with the given title and artist. All albums are unplayed by default.
* `play "$title"`: marks a given album as played.
* `show all`: displays all of the albums in the collection
* `show unplayed`: display all of the albums that are unplayed
* `show all by "$artist"`: shows all of the albums in the collection by the given artist
* `show unplayed by "$artist"`: shows the unplayed albums in the collection by the given artist
* `quit`: quits the program

Versioning
----------

Releases will follow a semantic versioning format:

`<major>.<minor>.<patch>`

For more information on SemVer, visit [http://semver.org/](http://semver.org/).
