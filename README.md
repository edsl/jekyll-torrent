# A torrent plugin for jekyll

A simple plugin that uses [transmission-create][1] to create a .torrent
file with your whole site after it's generated by jekyll. It
monkeypatches `Jekyll::Site.process`.

It's used on [En Defensa del Software Libre][0] and [Utopía Pirata][2]

[0]: https://endefensadelsl.org/
[1]: https://transmissionbt.com/
[2]: https://utopia.partidopirata.com.ar/

## Configuration

Default configuration (change it by superseding in `_config.yml`):

    torrent:
      announce: 'udp://9.rarbg.to:2710/announce'
      file:     'site.torrent'
      flags:    ''
      bin:      'transmission-create'

* `announce` is the URL of the tracker.  It can also be an array.  Use
  the special value `'random'` if you want to use 3 random trackers from
  <https://torrents.me/tracker-list/>

* `file` is the torrent filename.

* `flags` is a string with the flags you will normally pass to
  `transmission-create` on cli, besides `--outfile` and `--tracker`

* `bin` is the `transmission-create` binary path

## How to run

Execute `jekyll` like always, just make sure you have
`transmission-create` installed and it's binary is accessible.
