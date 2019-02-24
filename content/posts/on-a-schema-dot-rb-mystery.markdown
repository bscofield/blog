---
layout: post
title: "On a schema.rb mystery"
date: 2013-08-08
comments: true
categories:
---
Imagine, if you will, a database table with your average, everyday foreign key. It's an INTEGER column.

Now, imagine a coworker opens a pull request that, among other changes, has a line in schema.rb changing that column to a VARCHAR. There's no associated migration, and when she manually rewrites her schema.rb (THIS IS A BAD PRACTICE AND YOU SHOULD NEVER DO IT), a simple db:migrate allows the offending line to reappear.

What could be going on?

-----

Stumped? So were we. After a lengthy investigation, however, we discovered the problem. The foreign key started as an VARCHAR long ago, which was probably just an oversight. The original developers updated the column type to an INTEGER out of the migration workflow, with the result that their schema.rb files showed it as an INTEGER. Whenever a new employee started and migrated the DB from scratch, however, they got the VARCHAR version -- so any schema.rb *they* generated would try to reset the column to a VARCHAR.

The end solution? Add a migration to properly set the datatype of the field, and everybody's happy.