---
layout: post
title: "On interview coding"
date: 2013-09-11
comments: true
categories:
---
Oh hey, I'm unemployed again (this time was, sadly, involuntary -- [my company shut down](http://johnpoisson.com/post/60467938116/some-news-about-wantful)). That means I'm doing a lot of talking, to hiring companies and to people about the hiring process. One topic that I find myself feeling surprisingly strongly about: interview coding questions.

One company (I won't name them) asked me to write code to reverse an array. In Ruby. Which has [Array#reverse](http://www.ruby-doc.org/core-2.0.0/Array.html#method-i-reverse). I understand the abstract point here, but… really? Is this the best we can do -- ask people in mild-to-major (depending on the candidate's personality) stress to implement objectively-useless code? If you're falling back on seeing "how people problem-solve under stress," then why limit yourself to code? And if you want to see how they'd do their actual job under stress, why not ask them to do something like they would if the stress arose in the new job?

For example, if I'm applying to build web software, ask me to debug a slow page, find and resolve contributing causes to an outage, or work through a vague product vision to determine what to build. The first two of these could be made as directly-technical as a standard coding question. The last one would be trickier, but is infinitely flexible. Heck, you could even reuse the array reversal question: put on your biz-person hat and say "I need the contents of this file in a different order ASAP for a presentation to the board!" Let me figure out by drilling in that you need it reversed -- and if I write anything other than `array.reverse!` go ahead and move on to the next candidate.
