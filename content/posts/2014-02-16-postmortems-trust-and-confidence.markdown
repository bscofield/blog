---
layout: post
title: "Postmortems: trust and confidence"
date: 2014-02-16
comments: true
categories:
---
I am a strong believer in the value of a good postmortem after a customer-affecting incident — and after internal incidents, and after unusual projects and efforts, and pretty much all the time. I really want to talk about one of the purposes of a postmortem, however: building trust and confidence.

## Trust and confidence
I've been thinking about trust and confidence in the context of software development since early November:

<blockquote class="twitter-tweet" lang="en"><p>trust and confidence. trust and confidence. trust and confidence. trust and confidence. trust and confidence. trust and confidence.</p>&mdash; Ben Scofield (@bscofield) <a href="https://twitter.com/bscofield/statuses/399559084107509761">November 10, 2013</a></blockquote>

Much of my thinking has been around the distinction between the two, and what I've come up with is this: trust is given, confidence is earned.

Say you hire a new developer for your team. Assuming you've never worked with her before, you don't have real evidence that she can do the job, but you *trust* that she can. Over time, as she solves problems and demonstrates her expertise, you acquire *confidence* that she can do the job.

Similarly, when you start working with a new code base, you *trust* that the tests validate the code's behavior. As you make changes to the code and find them caught by the tests, you gain *confidence* in the suite as a whole — or, conversely, when you find that the tests don't cover some complicated functionality, you lose some of the trust or confidence that you had for the suite.

## Postmortems
I could go on and on with examples of trust and confidence in people, in companies, in tests, in code, and more, but I want to shift back to postmortems now. The way I see it, when you have an incident, you've damaged the trust and confidence that someone has in your system by some number of people. When you lose all of that scarce resource, you fail — so a prime goal coming out of an incident is to rebuild as much of the confidence as you can.

(I'm being very careful with my choice of “trust” and “confidence” here. Incidents damage both, but the damage is worse to confidence; the incident itself is evidence against your system working properly. The goal afterwards, then, is to build back as much confidence as you can so that the normal cycle of gaining both can restart.)

So, let's think about some postmorteming. One thing that should be clear is that the way you rebuild trust depends on both what happened and on who was affected. For a security breach at Mint, for instance, you'd need to rebuild trust in your security measures, so you'd talk about external reviews, fraud detection processes, and the like — but low-level details won't help less technical customers that much.

Contrast that with a performance issue on an internal service at Heroku; with deeply technical coworkers, you need to produce a deeply technical review of the incident to have any hope of rebuilding confidence.

## So what?
I've seen a lot of postmortems that miss the mark, and all too often that's because they're focused too much on the wrong thing. Some get bogged down in minute-by-minute recreations of the incident; others skimp on remediation. Keeping the goal of rebuilding confidence in mind, however, shows why those two paths are mistaken.

Historical transcripts of incidents are great, but if they get too fine-grained it's very easy to lose the larger sense of progress towards a resolution. The timeline of a postmortem should include blind alleys and golden paths, because knowing how the solution was achieved is vital to rebuilding confidence in the company or team — without it, you're saying “just trust us” at the worst possible time.

Similarly, skipping remediation drops the ball on (collective, not individual) accountability. Publicly committing to (and following through on) steps to reduce the chance of recurrence and minimize the impact of future events is the least you can do to help those affected by a problem.

So: if you're writing a postmortem, *please* remember this: your system has lost a portion of the confidence that people have in it. Take this opportunity to repair that as best you can.

<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
