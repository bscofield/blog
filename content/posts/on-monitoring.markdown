---
layout: post
title: 'On "monitoring"'
date: 2013-03-29
comments: true
categories:
---
I'm at [Monitorama](http://monitorama.com) this week; it's been a great conference, but a weird one for me. This is the first conference I've been to in years where I don't know a significant minority of the attendees, and it's the first non-Ruby/Rails conference I've been to in even longer. I'm enjoying the feeling of not-quite-knowing what's going on, since I'm not deeply embedded in the DevOps / monitoring movements.

One thing that struck me yesterday during the talks was an issue of vocabulary: many of the speakers seemed to use "monitoring" and "alerting" *almost* interchangeably -- it's almost as if the purpose of monitoring was just to enable alerting, which is all that matters. (I don't think that anyone actually holds that opinion, but that's the way it came across at times).

Later in the day, I had a chat with [Mark Imbriaco](http://twitter.com/markimbriaco) about just this, and he pointed out that there's a third term that we need to care about as well: trending.

So, here's my naïve attempt to clarify the definitions involved here:

**Monitoring** is the process of gathering data. It provides the foundation for both alerting and trending, but on its own just fills up hard drives and makes pretty graphs.

**Alerting** is the process of detecting anomalies in monitored data and announcing them to interested parties. This is what most of the DevOps movement appears to care about at the moment, because 1) alerts are what wake people up at 1am when the server's on fire, 2) alerts are by definition exceptional and require a response (even if that response is "meh, it'll clear"), and 3) current alerting technology is woefully inadequate, lacking context and even basic intelligence in many cases. Alerts inspire *reactive* action.

**Trending** is the process of looking at monitored data for patterns. This is the concept that I think is underemphasized in many current discussions, because alerting is so top-of-mind for everyone, but trending has one huge benefit: it allows you to be *proactive*. Looking at disk space usage trends may allow you to find and fix a log rotation problem days before it generates a wee-hours alert. Watching page load times may help you optimize code and generate an immediate bump in the number of people who complete a registration process.

I'd love to see trending attacked with the same focus that alerting is currently getting.

(Of course, it might be, and I'm just too far on the outside to see it. If so, I'll happily accept pointers to that work.)