---
layout: post
title: "On contact management"
date: "2013-09-13"
comments: true
categories:
---
I have a problem: every time I open up an application that has a contact list, I find something confusing or frustrating. With Skype, it's people I talked to once, years ago, and no longer remember who they are. With Messages, it's duplicate accounts that I know map to the same person. With Google Contacts, it's outdated email addresses that I never got around to changing. With Contacts.app, it's crazy merge artifacts. With … I could go on.

This could be better, and I'm going to tell you how.

Imagine there was an application; call it **Spheres**. In this application, you keep track of your own contact information -- email addresses, phone numbers, links to Twitter, Facebook, LinkedIn, GitHub, and whatever else you like. (Yes, I know sites like this exist now. Bear with me.)

Once your information is in, you can package bits of it together into **identities**. You might have a public identity that includes your name, blog URL, and Twitter handle. A coder identity might build on that by adding your PGP key and your GitHub username. A work identity might start with name, work email address, work phone number, and your LinkedIn profile page. Some of these identities could be predefined, but you'd always be able to modify or remove existing identities and add new ones.

Now, you meet someone. Through some mechanism, you communicate your Spheres username to them -- maybe you bump phones or whatever. Here's where it gets interesting: your new acquaintance is now added to a **sphere**. Maybe it's a default sphere (like "public" or "acquaintance"), or maybe you choose it before connecting with them. Regardless, that sphere is tied to one or more of the identities that you've already defined, and the acquaintance can immediately go in and see any of your information exposed in those identities, without having to add you to their address book, enter a phone number, or keep track of a business card.

You can then go in that night and tweak the spheres (and thus the identities, and thus the information) to which they belong -- you could even override access on an individual level, if you wanted to grant your phone number or something.

When your acquaintance wants to call you, her phone makes an API call to Spheres asking if she can access your phone number; if she can, Spheres returns the number and the call goes through -- similarly, if she wants to email, IM, send you snail mail, etc.

How does all of this make things better? From the sharer's point of view:

1. I don't have to notify people when my address changes -- I change it in one place and anyone who looks for it gets the correct info.
2. I've got fine-grained control over who can see what about me, but can easily make large-scale changes by modifying identities and spheres.
3. Pseudonymity can be managed right next to IRL identity.

And from the point of view of your contact:

1. I don't have to worry about outdated information; people update their own info and I have access to it immediately.
2. I don't have to store my contacts' information locally -- I can always just grab it when I need to (though there could be local caching if connectivity is spotty)
3. Centralizing contact information and making sure all contact requests hit that central store means that I can see my complete history of connecting with a person -- all my calls to them right next to texts, IMs, and emails.

So, what do you think? Will you share my vision with me?
