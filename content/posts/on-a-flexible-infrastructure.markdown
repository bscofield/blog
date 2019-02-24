---
layout: post
title: "On a flexible infrastructure"
date: 2013-09-05
comments: true
categories:
---
I've been having a lot of fun over the past couple of weeks shading into the ops side of things -- I've been experimenting with an alternative to the existing infrastructure at my day job, and have been learning a ton. There's a long way to go, but I think I've got the start of an interesting, flexible setup.

### Configuration
At the heart of this cluster is a configuration server; I wanted to have new instances easily register themselves and discover existing instances and services. After looking at a few alternatives, I ended up going with [etcd](https://github.com/bscofield/wetcd), in large part because of its curl-friendly interface (which also powers my experimental [Ember.js](http://emberjs.com/) web UI for etcd, [wetcd](https://github.com/bscofield/wetcd)).

### Monitoring
For monitoring, I wanted something that'd easily adjust to instances spinning up and down. [Sensu](http://sensuapp.org/) looked like a good fit, so I've been giving that a go. It introduces dependencies that might scare some people off (Ruby on every client, for instance), but it's incredibly flexible.

### Analytics
The old standbys of [StatsD](https://github.com/etsy/statsd/) and [Graphite](http://graphite.wikidot.com/) are great; the only outstanding question for me here is what dashboard to use, since Composer is … not the best.

### Logs
The piece that I think gets overlooked most frequently in infrastructure setups is log aggregation -- when you're adding and removing instances willy-nilly, you really need a solid, central place to view and analyze logs (especially if you want to keep people away from direct access to the servers). I'm loving [Logstash](http://logstash.net/) for this, especially since it just added some great features as it hit 1.2. For getting the logs to Logstash, I'm relying on good ol' [rsyslog](http://www.rsyslog.com/). Finally, I'm using [Kibana 3](http://three.kibana.org/) to view and analyze the logs.

### In Action
So here's what happens: when a new instance comes up, it first pings the configuration server to find out where monitoring, logging, and the like live so they can be set correctly. Once provisioning is complete, the instance then notifies the configuration server that it is available for whatever role it's playing.

All boxes get a standard set of monitoring checks by default, in addition to checks specific to whatever they're running (nginx, Redis, etc.); some of these checks get forwarded on to the analytics server. Finally, all logs get shipped to the log server via rsyslog. It all works together shockingly (from my naive, developer-oriented background) well.

There's more to talk about (for instance, why I prefer managing all of this with [Ansible](https://github.com/ansible/ansible) instead of [Chef](http://www.opscode.com/) or [Puppet](https://puppetlabs.com/)), but I'd love to hear what you all think. Hit me up on [Twitter](https://twitter.com/bscofield) with comments and questions!