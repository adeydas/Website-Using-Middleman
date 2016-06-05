---
title: Welcome @biryanilvr
date: 2016-06-05 05:54 UTC
tags: biryani, food, twitter
category: Technology
---
![Biryani 1](images/2016-06-05/152.jpg)
I am a fan till death when it comes to Biryani. Not only do I love eating it, I love watching photos of it as well. So when I came to know of Twitter's Streaming API, I decided to make a [@biryanilvr](https://twitter.com/biryanilvr) twitter handle that retweeets photos (and videos) of Biryani. Here's the story behind it.

The pattern used in most API's is the request-reply pattern. Infact, as one would expect, Twitter started that way as well. Simple request-reply with a bunch of setters and getters. However, for async use cases like listen to tweets on a certain hashtag, that fell short.

Welcome Twitter's streaming API. Twitter's streaming API can listen to three sources: sample, firehose and site. The interesting one, as the name suggests, is site. The site source can be lexically filtered. The implementation detail is fairly simple. All one need to do is assign a listener to the stream. Add a filter based on what is required. When a Status aka Tweet is received, process it. In case of [@biryanilvr](https://twitter.com/biryanilvr), it does some additional checks and retweets it.

Link to Twitter dev docs: [https://dev.twitter.com/streaming/overview](https://dev.twitter.com/streaming/overview).