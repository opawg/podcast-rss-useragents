# podcast-rss-useragents
This is a list of useragents used by apps and services to query RSS data for podcasts.

You might use this to tag audio files to get better statistics from podcast consumption, since some audio useragents are not able to be changed from the default (AppleCoreMedia, I'm looking at you).

This data has been used to [discover Tunein's actual download figures](https://podnews.net/article/eight-times-bigger-podcast-user-agents), but should be usable for more correctly identifying podcast apps in some circumstances.

## The files

There's only one - `/src/rss-ua.json`

## Contributing to the list

Each entry _must_ contain the following properties:

* `pattern` (string): a simple unique string to search for.
* `name` (string): a humanly-readable name of this service
* `slug` (string): a short name for tagging audio, or other reasons

Each entry _can_ contain one of the following properties:

* `url` (string): a website to discover more about this particular service.

This list is automatically generated from a MySQL database.
