---
layout: post
title: "Two problems with antifragility"
date: 2014-01-04
comments: true
categories: 
---
I'm no fan of Nassim Taleb (of black swan, antifragility, and needing-an-editor fame), but I forced myself to finish his last book [*Antifragile*](http://www.amazon.com/Antifragile-Things-That-Gain-Disorder-ebook/dp/B0083DJWGO) in spite of all the problems I had with his presentation and writing. If you haven't heard of it, the gist is: fragile systems suffer harm when stressed, but there are systems that instead benefit when stressed. Taleb calls these systems “antifragile.”

Near as I can tell, Taleb thinks his identification of this concept is hugely revolutionary, and he goes out of his way to name all of his favorite things antifragile and all of his least favorite things fragile. Leaving aside his questionable expertise in many areas, I want to talk about two related problems with the general phenomenon.

First: antifragile systems may improve when stressed, but this is often at the cost of increasing fragility to other types of stress. Take a muscle: subject it to a load (stress it) and it gets stronger, easy peasy. What you don't see, however, is that it strengthens in a way that makes it *more* vulnerable to other stresses — it becomes less flexible, for instance. Sure, you can override this by stretching, but that's a different, opposed antifragile process. 

Or take an autoscaling application hosted on EC2. When traffic increases (stress), the system spins up more instances (becoming better able to handle the traffic). The system is stronger with respect to traffic — but it's weaker with respect to, say, cash flow stresses. It costs more, so financial stresses will produce more harm because of the strengthened ability to handle traffic.

Second: the very process of antifragility *generates fragility*. By definition, antifragile systems gain more benefit than harm when stressed, and fragile systems do the opposite. But: in almost all cases, there's a limit to the strength a system can display. As antifragile systems improve and get closer to this limit, they gain less and less of a benefit from the same stresses. More severe stresses are required to produce progressively smaller improvements. A direct consequence of this is that the systems are, in fact, *becoming more fragile*.


Thought experiment time! Imagine a system that, via its antifragile properties, has reached the peak of its strength. Further stresses have no beneficial effect (since we're assuming that there's a maximum cap on improvement). *There's nowhere to go but down* — stresses can't help, so they can only hurt, so the system has strengthened itself into (Taleb's definition of) fragility.

All of this is just to point out that the concept of antifragility is a bit more complicated than it might appear at first blush. I do think it's worth considering as we build systems, but it should not be treated as a pure good without further thought.
