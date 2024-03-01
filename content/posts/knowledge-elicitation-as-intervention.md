---
title: "Knowledge elicitation as intervention"
date: 2024-03-01T14:13:00-05:00
---

If you're not reading Cedric Chin's [Commoncog essays](https://commoncog.com/), you're missing out. The most recent one ([Tacit Expertise Extraction, Software Engineering Edition](https://commoncog.com/tacit-expertise-extraction-software-engineer/)) in particular hit at just the right time, but for a potentially-unexpected reason.

The post is an interview with Stephan Zerfas, who took Cedric's past writings about [recognition-primed decision making (RPD)](https://en.wikipedia.org/wiki/Recognition-primed_decision) as a guide to design an interview structure; he was then able to use that structure when working with more senior engineers on his team, and was able to make explicit components of their expertise.

This was fresh in my mind during a recent conversation with a friend; they've been having issues with a peer engineer on their team who seems to misunderstand problems or propose unworkable solutions more often than not.

That got me thinking: what if you flipped the RPD-inspired interview around? It's intended to elicit expertise, but more specifically it's making concrete the mental model that the interviewee has of the situation under discussion (what aspects of it are they paying attention to, what options are available to them, what the overall goals are). You should be able to use the exact same technique to get a clearer picture of the mental model a non-expert has -- and then, maybe, you'll be able to intervene more effectively.

So let's say my friend did this sort of interview with their peer. Ideally, they'd come away with a much better idea of how to help the peer get onto the same page as the rest of the team. My intuition is that every major disagreement on a team will come down to opposed views on (at least) one of the four outcomes from the interview -- the cues, expectations, goals, and alternative options -- and by making those disagreements visible, you're in an infinitely better position to resolve them.

Two quick further notes:

This idea (that getting clear on the unstated aspects of the disagreement) is related to Daniel Dennett's observation in [Intuition Pumps and Other Tools for Thinking](https://bookshop.org/p/books/intuition-pumps-and-other-tools-for-thinking-daniel-c-dennett/7333126?ean=9780393348781):

![As a general rule, when a long-standing controversy seems to be getting nowhere, with both “sides” stubbornly insisting they are right, as often as not the trouble is that there is something they both agree on that is just not so. Both sides consider it so obvious, in fact, that it goes without saying. Finding these invisible problem-poisoners is not an easy task, because whatever seems obvious to these warring experts is apt to seem obvious, on reflection, to just about everybody.](/img/dennett-quote.png)

And: as I've interviewed staff+ engineers at various companies, I've gradually developed a favorite question:

> If I ask you and another engineer to build a system, you're going to do what I've asked -- but every very-senior-engineer also has some defaults that they fall back on; they make the system more secure, or more scalable, or more flexible, or something else, based on their past experience and preferences. What -ilities (non-functional requirements, etc.) do you default towards?

Knowing what the people you're working on default to -- some bit of how they see the world -- is a _very_ powerful tool in helping you get to the best outcome you can.
