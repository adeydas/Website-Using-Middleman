---
title: Going serverless
date: 2017-03-04 PST
tags: AWS, Serverless architecture
category: Technology
---

Serverless is the new kid on the block, and for a static site like mine, I feel it's the best way to go. So what is serverless computing and how does it relate to my website? Per [Wikipedia](https://en.wikipedia.org/wiki/Serverless_computing), the definition of serverless computing is:

> Serverless Computing, also known as function as a service (FaaS), is a cloud computing code execution model in which the cloud provider fully manages starting and stopping of a function's container platform as a service (PaaS) as necessary to serve requests, and requests are billed by an abstract measure of the resources required to satisfy the request, rather than per virtual machine, per hour.

As the definition might have suggested, for a personal website like mine, a serverless architecture would mean I don't have to worry about Apache or SSL certificates or CDN's or Ubuntu upgrades or *fill in any infrastructure related pain*. In short, all I need to worry about is the content of my website. Exactly how I like it.

My serverless stack
-------------------

It feels kind of weird to say serverless and stack in the same sentence, but this is how my stack looks:

![Serverless architecture](https://abhishekdeydas.com/images/serverless_architecture.jpg)

Delving a little deeper into each of these components:

### Middleman website
I use the awesome [Middleman](https://middlemanapp.com/) framework to build both my static website and blog. I usually write my blog posts on Sublime, run the *serve* target to test locally and build using the *build* target.

### The Git repository
Once I am done modifying my website, I push it to a private Git repository. I use [Gitlab](https://about.gitlab.com/products/) for all my private repositories, and I find it easier to use and cheaper as well compared to hosted solutions like Github.

### The continuous integration (Jenkins) system
Once pushed to a master branch, I use a webhook to bind the push event to a remote API call to my Jenkins server. The Jenkins server runs a rake build and uploads all the generated website files to S3.

### The S3 bucket
The S3 bucket, since is public viewable has public read-only permissions. S3 can serve a static website on its own. However, I needed my website to run on a secured port in favor of a non-secured one. For that, I chose to use CloudFront.

### The CloudFront distribution
Cloudfront is primarily a CDN. And thus, one may define CNAME's attached to the CDN URL. A Cloudfront distribution may deliver files from an S3 bucket or use a pull model to deliver static content from a website. Cloudfront also allows a custom SSL certificate to be attached to the public URL. One may either request one from AWS or upload one purchased elsewhere. I went with the former.

I feel I have gained a lot from going serverless. To name a few:

* No infrastructure maintenance - although I never really had to maintain much, I can say in all honesty that I hated even the occasional OS patch.

* Better scalability - I never did follow the best practices when it came to scalability, and I probably didn't need to since this is, after all, my personal website. For instance, my website was on a single server with 512 MB of RAM (yes, they still exist) with no load balancers. Thus, the only way to scale for me was veritically. With this architecture, all of those (and more) comes for free (well not exactly but close enough).

* I feel frugal - My static website really didn't need 512 MB of RAM or Apache or Nginx for that matter. For a website like mine, with a TPS that low, I'd say all of these were an overkill. Now that I don't need all that anymore, I feel frugal!

* Uptime - Previously my uptime was dependent on a small and not so well maintained virt with zero monitoring. Now it's the same as that of S3. Do I really need to compare here :-)