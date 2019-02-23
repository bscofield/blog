---
title: A future without linters
date: '2018-11-18T15:52:56.842Z'
categories: ''
keywords: ''

---

I have a vision of a wonderful future.

A future without arguments about camelCase and snake\_case.

A future without debates over tabs and spaces.

A future without _forcing people to write code in a style they dislike_.

A future without **linters**.

“Impossible!” I hear from the balcony, and to which I respond: it isn’t.

I spent last week in LA at [RubyConf](http://rubyconf.org/) (which was great! The talks will all be posted in the next few weeks, and you should check them out), and there was a surprising amount of talk about linters — prompted in large part by the release of [Standard](https://github.com/testdouble/standard), a gem that provides a recommended set of rules for the [RuboCop](https://github.com/rubocop-hq/rubocop) linter.

The thing is, we’re very close to the point (if not at or past it) where our tools will allow us to reformat code _on the fly_; there’s a lot of research on this in the #MLonCode community (machine learning on code). This would let developers write code in whatever style they liked; the code would then be saved — probably in a more generic form — and when it is pulled up for reading or editing, it could be automatically reformatted to conform to the reader’s preferred style.

So, I write my Ruby with two-space soft tabs for indentations, but someone who prefers Python would see it with hard tabs. I write my JavaScript with only those terminal semicolons that are required for the functionality, but someone who is more cautious will see every full statement ended with a semicolon.

See, the reason we have debates about how we write code is that it _doesn’t matter_ when the code runs. The interpreter or compiler doesn’t care about tabs vs. spaces or whether we include a comma on the last element of a hash. Style choices that _do_ matter to how the code runs aren’t subject to debate; you just do the thing that makes the code work the right way.

A world in which everyone can write code in their own idiomatic style, and in which all the code they see is written in that same idiomatic style, then, simply _avoids_ the problem that linters are set up to solve.

How do we realize this utopian vision? We’ll need a few things:

*   First, editors will have to be able to do the reformatting on the fly (from idiomatic to generic and back)
*   Second, applications where we can view code (GitHub, Bitbucket) will have to be able to accept idiomatic preferences and apply them when people are viewing code
*   And third, we’ll have to _automate_ the generation of those preferences — and that’s where the ML comes in. It should be possible to determine personal coding style from past code you’ve written, so you could point an algorithm at your old code and have it generate the file that would guide editors and online applications in how to display your code (and with this algorithm integrated into your editor, it could learn how your preferences change over time, as well)

So, editor developers and #MLonCode researchers, let’s make it happen! Let’s kill the linters, end the style debates that have consumed uncountable hours, prevent trivial, unhelpful, and gatekeeping code review comments, and journey to this future, together!
