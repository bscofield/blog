---
layout: post
title: "On Ansible"
date: 2013-09-08
comments: true
categories:
---

In my post on [flexible infrastructures](http://benscofield.com/on-a-flexible-infrastructure/), I mentioned in passing that I was managing my ops work with [Ansible](https://github.com/ansible/ansible) rather than the more traditional [Chef](http://www.opscode.com/) or [Puppet](https://puppetlabs.com/). Several factors guided me towards this choice:

* The overarching goal for the new infrastructure was to have disposable servers in every role, instead of maintaining long-running servers over time. As a result, I focused on the initial provisioning much more than the ongoing configuration management experience.
* I wanted the servers to be as similar as possible, but not more than they needed to be. If two distinct roles needed Ruby, I wanted them to use the same version.
* I was (am) new to this level of operations involvement, so the quicker and easier the learning curve, the better.
* Less importantly, I was experimenting with the idea of using [Packer](http://www.packer.io/) to create AMIs that we could launch on-demand to fire up new servers. For this, I found local provisioning more intuitive than something centralized.

### Starting from Chef
Our existing infrastructure was managed with a standard Chef setup; I spent a full week trying to wrap my head around what we had and adapt it to the new vision. I felt that I had to replace our existing cookbooks because they'd gotten far out of date, but when I pulled in community cookbooks for the software I wanted to install I kept running into conflicts. One would require the [redis](http://community.opscode.com/cookbooks/redis) cookbook, but another would need [redisio](http://community.opscode.com/cookbooks/redisio); one would install Ruby 1.9.3, while another would use 2.0.0. Sure. I could've (and did, at first) fork them to get them inline with each other, but then I'd just be setting us up to fall out of date again in the future.

Chef also fell short on the learning curve principle; I felt lost from the start looking through the existing repo we had, and the [documentation](http://docs.opscode.com/) never quite seemed to answer my questions. I was never clear when something applied to normal Chef vs. chef-solo, for instance -- and all the examples I saw started with the full, relatively complicated hierarchical file structure that's great for when you know what's going on but rough when you see it unexplained.

Finally, Chef just seemed overly powerful for what I wanted -- it's very obviously Configuration Management, when I just needed a little provisioning tool. This also kept me from digging into Puppet too deeply, especially once I ran across Ansible.

### Finding Ansible
I was looking for simpler alternatives to Chef and saw a link to Ansible's [documentation](http://www.ansibleworks.com/docs/). Within a few minutes, I knew how to do the local provisioning I wanted (by making 127.0.0.1 the only entry in the hosts file) and saw how to start, *simply*, with a single [playbook file](http://www.ansibleworks.com/docs/playbooks.html). YAML, as much as I hate it as a serialization format (seriously, I hate it for that with a fiery passion) seemed perfectly suited to directives like this:
```
- name: Generate the Nginx configuration file
  copy: src=nginx.conf
        dest=/etc/nginx/nginx.conf
```

As I grew more comfortable with how Ansible worked, I started looking at more complicated directory structures and setups using [roles](http://www.ansibleworks.com/docs/playbooks.html#roles), but the key was the ease with which I moved into it -- every step was easy and made sense at the time, as opposed to just being dropped in the deep end.

The simplicity of the playbooks (and their direct correlation to the shell commands I'd run to set up the server manually) made it incredibly easy to write my own roles and reuse them for different server types, which made it trivial to keep the dependencies identical wherever possible.

### Wrapping up
I hope no one reads this and comes away thinking that I'm saying Ansible is objectively superior to Chef or Puppet. They're all powerful tools -- it's just that I found Ansible to be the best fit for me, given my objectives and experience. Honestly, the more automation we can get in operations, the better, regardless of the tools used!

That said, if you're looking to get started with all of this, I think Ansible is well worth a look.
