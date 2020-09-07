# podcast-rss-useragents
This is a list of useragents used by apps and services to query RSS data for podcasts.

You might use this to tag audio files to get better statistics from podcast consumption, since some audio useragents are not able to be changed from the default (AppleCoreMedia, I'm looking at you).

This data has been used to [discover Tunein's actual download figures](https://podnews.net/article/eight-times-bigger-podcast-user-agents), but should be usable for more correctly identifying podcast apps in some circumstances.

You can also use this as a method to block apps you don't like from consuming your podcast; or to feed audio in a specific format to a podcast app (perhaps they don't like M4A files, for example).

## Best practice for RSS useragents

Podfollow uses: `Mozilla/5.0 +https://podfollow.com/crawling podfollowbot/1.0`

It follows the [best practice for useragents](https://developers.whatismybrowser.com/learn/user-agent-best-practices/) and contains [a clear URL](https://podfollow.com/crawling) to find out more information, and a useragent that includes the phrase "bot" since it is.

Podnews uses: `Mozilla/5.0 +https://podnews.net/bot PodnewsBot/1.0` and links [to this article](https://podnews.net/article/podnews-bot).

In case you're worried about being blocked, don't be: Podnews has no evidence that its bot has been blocked from any service.

## The files

There's only one - `/src/rss-ua.json`

## Contributing to the list

Each entry _must_ contain the following properties:

* `pattern` (string): a simple unique string to search for.
* `name` (string): a humanly-readable name of this service
* `slug` (string): a short name for tagging audio, or other reasons

Each entry _can_ contain one of the following properties:

* `url` (string): a website to discover more about this particular service.

This list is automatically generated from a MySQL database; pull requests will be accepted though.

