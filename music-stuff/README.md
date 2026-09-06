# music-stuff

Personal scripts for dealing with my music library and music-related stuff.

The main purpose is to make it easy to get music into `~/music` from Bandcamp
and YouTube Music without manually finding every release, copying metadata, or
organizing the resulting files.

## Downloads

### `bandscrape`

Scrapes an artist's Bandcamp `/music` page and passes each album/EP to
`albscrape`.

### `albscrape`

Scrapes a single Bandcamp album/EP page and turns its artist, title, release
year, and URL into a `musicdl` command.

Together, `bandscrape` and `albscrape` turn a Bandcamp discography into a list
of commands for downloading the releases.

### `musicdl`

Downloads an album/EP/playlist from YouTube Music using `yt-dlp`.

It handles the release-level organization and metadata, putting music under:

```text
~/music/<artist>/<album>/
```

It is primarily used by `bandscrape`/`albscrape` and `ytmscrape`.

### `ytmscrape`

Scrapes an artist's YouTube Music channel for albums and EPs and generates a
shell script containing `musicdl` commands for them.

This is essentially the YouTube Music counterpart to `bandscrape`.

### `ym`

Downloads an individual song from YouTube Music into a playlist directory.

Unlike `musicdl`, which is concerned with complete releases, `ym` is concerned
with maintaining numbered collections of individual songs. It assigns available
track numbers, reuses gaps, normalizes zero-padding, prevents duplicates and
concurrent downloads, and writes the ID3 tags.

Without an explicit playlist, songs go into:

```text
~/music/Various Artists/General/
```

This is my catch-all playlist for individual favorite songs.

### `getsong`

A convenience wrapper around `ym`.

It takes a text search such as `artist - song`, searches YouTube Music, finds
the first result identified as an actual song, and passes it to `ym`.

## Other stuff

### `ymtop`

Gets the list of "top songs" that YouTube Music exposes for an artist and
prints their video IDs and titles.

### `skick`

A personal Songkick scraper.

It has a hardcoded list of artists I want to follow, finds their nearest
upcoming shows, and prints them chronologically. Czechia and Slovakia are
highlighted, followed by nearby countries.
