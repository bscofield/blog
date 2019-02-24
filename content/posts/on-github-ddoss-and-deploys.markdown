---
layout: post
title: "On GitHub, DDOSs, and deploys"
date: 2013-09-02
comments: true
categories:
---
When GitHub goes down, you can almost hear the wailing in the streets. GitHub has cemented itself as a central part of many development workflows, and while much of that is unaffected by the occasional DDOS, one element in particular has the potential to cause a lot of trouble: deploys.

Standard practice for many deployment tools (e.g., Capistrano) critically relies on the GitHub repository being available -- checking out the latest code either on the remote server itself or locally before pushing it to the remote box. If GitHub's unavailable, all of that comes to a screeching halt.

Enter: [deus_ex](http://rubygems.org/gems/deus_ex) ([github](https://github.com/bscofield/deus_ex)). It's a simple RubyGem meant to work around this exact problem.

Say GitHub is being DDOSed and you need to deploy -- just install the gem, ensure your AWS credentials are correct in `~/.fog`, and:
```
$ deus_ex
[DEUS EX] connection established
[DEUS EX] creating server (this may take a couple of minutes)
[DEUS EX] server created
[DEUS EX] initializing git repo
[DEUS EX] git repo initialized
[DEUS EX] adding local git remote
[DEUS EX] pushing to remote
The authenticity of host 'ec2-xx-xx-xx-xx.compute-1.amazonaws.com (xx.xx.xx.xx)' can't be established.
RSA key fingerprint is xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'ec2-xx-xx-xx-xx.compute-1.amazonaws.com,xx.xx.xx.xx' (RSA) to the list of known hosts.
Counting objects: 126, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (78/78), done.
Writing objects: 100% (126/126), 13.70 KiB, done.
Total 126 (delta 51), reused 104 (delta 42)
To ubuntu@ec2-xx-xx-xx-xx.compute-1.amazonaws.com:deus_ex_project.git
 * [new branch]      master -> master
[DEUS EX] removing local git remote
[DEUS EX]
[DEUS EX] you can now deploy from ubuntu@ec2-xx-xx-xx-xx.compute-1.amazonaws.com:deus_ex_project.git
```
Then, jump over to your deploy tool, set it to look at your new repository instead of GitHub, and deploy away!

Once you're done, you'll need to clean up the instance:
```
$ deus_ex cleanup
[DEUS EX] connection established
[DEUS EX] server destroyed
```
And be sure to set your deploy tool to look at GitHub again for future deploys!
