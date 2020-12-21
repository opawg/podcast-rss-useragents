# podcast-rss-useragents
This is a list of useragents used by apps and services to query RSS data for podcasts.

You might use this to tag audio files to get better statistics from podcast consumption, since some audio useragents are not able to be changed from the default (AppleCoreMedia, I'm looking at you).

This data has been used to [discover Tunein's actual download figures](https://podnews.net/article/eight-times-bigger-podcast-user-agents), but are usable for correctly identifying podcast apps in more circumstances than using the audio useragent by itself: particularly for browser-based plays.

Here's [an example of some data](https://podnews.net/article/podnews-podcast-stats) using this list.

You can also use this as a method to block apps you don't like from consuming your podcast; or to feed audio in a specific format to a podcast app (perhaps they don't like M4A files, for example).

## Best practice for RSS useragents

Podfollow uses: `Mozilla/5.0 +https://podfollow.com/crawling podfollowbot/1.0`

It follows the [best practice for useragents](https://developers.whatismybrowser.com/learn/user-agent-best-practices/) and contains [a clear URL](https://podfollow.com/crawling) to find out more information, and a useragent that includes the phrase "bot" since it is.

Podnews uses: `Mozilla/5.0 +https://podnews.net/bot PodnewsBot/1.0` and links [to this article](https://podnews.net/article/podnews-bot).

In case you're worried about being blocked, don't be: Podnews has no evidence that its bot has been blocked from any service. The presence of `Mozilla/5.0` appears to calm nervous sysadmins, too.

## The files

There's only one - `/src/rss-ua.json`

## Contributing to the list

Each entry _must_ contain the following properties:

* `pattern` (string): a simple unique string to search for.
* `name` (string): a humanly-readable name of this service
* `slug` (string): a domain-like short identifier for this service

Each entry _can_ contain one of the following properties:

* `url` (string): a website to discover more about this particular service.

This list is automatically generated from a MySQL database; pull requests will be accepted though.

## Alternatives

If you use a service like Podcast Index which does the RSS scraping for you, I'd encourage you to consider stamping your audio requests by adding a `_from` variable at the end of the URL.

As an example, if you run a web service and are unable to change the RSS useragent, amend a call for `https://example.com/audio/episode5.mp3` to `https://example.com/audio/episode5.mp3?_from=podinfra.net` where `podinfra.net` is your domain.

As another example, if the URL is `https://example.com/audio/episode5.mp3?format=35` then change it to `https://example.com/audio/episode5.mp3?format=35&_from=podinfra.net`

