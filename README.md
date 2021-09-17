# podcast-rss-useragents
This is a list of useragents used by apps and services to query RSS data for podcasts.

It can be used to tag audio files to get better statistics from podcast consumption, since some audio useragents are not able to be changed from the default (AppleCoreMedia, I'm looking at you). This data has been used to [discover Tunein's actual download figures](https://podnews.net/article/eight-times-bigger-podcast-user-agents), but are usable for correctly identifying podcast apps in more circumstances than using the audio useragent by itself: particularly for browser-based plays.

It can also be used to feed AAC files to those that accept AAC without issues, thus saving podcast hosts and listeners significant bandwidth.

## Example usage

If you produce your RSS feed dynamically, you could use this list to add `?_from=[rss-ua-slug]` at the end of your audio requests.

This enables logfile analysis to not only use the audio useragent, but also the RSS useragent. In many cases, this allows for significantly better statistics.

Here's [an example of some data](https://podnews.net/about/podcast-stats) using this list; and [an example set of RSS feed requests](https://podnews.net/about/rss-stats). Notice that for podcast downloads, the number of 'unknown' clients is less than 1%.

_Caution_: there is an `iTMS` and an `itms` useragent which appear different. You are advised to use _case-sensitive_ comparisons. We use `SELECT slug FROM `podcasts-rss-ua` WHERE 'iTMS' LIKE BINARY CONCAT('%',pattern,'%') LIMIT 1` - the BINARY portion here makes this query case-sensitive.

**Apple Podcasts - directory** is Apple's RSS scraper. This leads to any download from Apple Podcasts on iOS v14.6+, or the Apple Podcasts app on macOS v11.5+.

**Apple Podcasts - via app** is from earlier versions of Apple Podcasts on iOS or macOS. These older versions consumed the RSS feed directly.

## Best practice for RSS useragents

Podfollow uses: `Mozilla/5.0 +https://podfollow.com/crawling podfollowbot/1.0`

It follows the [best practice for useragents](https://developers.whatismybrowser.com/learn/user-agent-best-practices/) and contains [a clear URL](https://podfollow.com/crawling) to find out more information, and a useragent that includes the phrase "bot" since it is.

Podnews uses: `Mozilla/5.0 +https://podnews.net/bot PodnewsBot/1.0` and links [to this article](https://podnews.net/article/podnews-bot).

In case you're worried about being blocked, don't be: Podnews has no evidence that its bot has been blocked from any service. The presence of `Mozilla/5.0` appears to calm nervous sysadmins, too.

[More details and best practices here](https://podinfra.net/app-developers/rss-scrapers.html).

## The files

There's only one - `/src/rss-ua.json`

## Contributing to the list

Each entry _must_ contain the following properties:

* `pattern` (string): a simple unique string to search for.
* `name` (string): a humanly-readable name of this service
* `slug` (string): a domain-like short identifier for this service
* `acceptsacc` (boolean): this is set to `1` if the podcast player definitely accepts AAC files; `0` otherwise.

Each entry _can_ contain one of the following properties:

* `url` (string): a website to discover more about this particular service.

This list is automatically generated from a MySQL database; pull requests will be accepted though.

## AAC file acceptance

AAC files are accepted by almost every podcast player. The `acceptsaac` field is an opinionated one, reflecting the major >1% podcast players and their support for AAC files. Spotify and Deezer specifically do not support AAC. We've had some compatibility issues with Castro. The field is set to `1` only if it's a major podcast player that has been tested specifically for AAC playback.

## Alternatives

If you use a service like Podcast Index which does the RSS scraping for you, consider stamping your audio requests by adding a `_from` variable at the end of the URL.

As an example, if you run a web service and are unable to change the RSS useragent, amend a call for `https://example.com/audio/episode5.mp3` to `https://example.com/audio/episode5.mp3?_from=podinfra.net` where `podinfra.net` is your domain.

As another example, if the URL is `https://example.com/audio/episode5.mp3?format=35` then change it to `https://example.com/audio/episode5.mp3?format=35&_from=podinfra.net`

