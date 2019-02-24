---
title: Building Reg Watch
description: Ragtag partners with Insightus to protect North Carolina voters
date: '2018-04-26T21:22:55.750Z'
categories: ''
keywords: ''
---

North Carolina has a complicated history with voter rights. In 2016 alone, some [60,000 voters were denied a regular ballot](//www.newsobserver.com/news/politics-government/state-politics/article115400748.html) because of problems with the voter rolls — and as political engagement and enthusiasm to vote is increasing around the country, we’re going to need tools to help make sure that everyone who is eligible and wants to vote, can.

Several months ago, [Ragtag](https://ragtag.org/) was approached by [Insightus](//insight-us.org/), a NC-based nonprofit, to help build such a tool — and as of this week, [Reg Watch](https://ncgovote.org/) is live.

![](https://cdn-images-1.medium.com/max/800/1*Y4FgvXyklu6sfM2BjYTAqA.png)

The concept is similar to a credit monitoring service. You sign up to watch your voter registration record, and if it changes, you get an email alert. That alert includes guidance on how to follow up with your local Board of Elections and resolve the problem, all (importantly) before you show up on Election Day.

### The data

North Carolina by law provides public access to records on millions of registered voters, and those records update fairly frequently. So data was available to support Reg Watch — though the files provided by the state can be difficult to work with, given that the schema can change without notice and there are frequent formatting errors. Luckily, the data scientists at Insightus were able to whip the data into shape, and we were left with the challenge of making the data useful to ordinary North Carolina voters.

First, Ragtag volunteers worked with Insightus to develop a web application for current voters to check their registration records. Insightus built a frontend on top of an API created by Ragtag, allowing voters to search for their current registration information by their name and address.

### The infrastructure

That, however, was only half the battle. Alerting voters when their registrations change is what allows North Carolinians to be sure their information is up-to-date before Election Day. The heart of Reg Watch is the comparison engine, code that pulls in millions of public voter registration records, scans them for changes, and notifies the affected voters.

Unlike the API, which is designed for relatively constant use (as people enroll in the service and use it to check their current records), the comparison engine runs only when it sees that there have been updates to the records. This meant that the Reg Watch backend needed a small number of relatively-low-powered servers all the time, with major spikes in usage each time new data was published. After a few experiments we ended up with a simple but unusual setup running on AWS Elastic Beanstalk, which provided a great balance of ease of use and flexibility for our different use cases. Most helpfully, it’s easy to keep a small set of API servers running all the time, and to spin up more powerful instances to run the comparison engine as required.

### The comparison engine

When new data is published, we spin up servers for the full comparison engine and download the full dataset so that we can import the records into our database. At the point of import, we also hash the most critical voter information fields (name, address, birth year, etc.). After the import, we’ve got two tables of registration records in the database: one with the newest data, and one that contains the previous import’s data.

The next step is to compare those two tables to find new, changed, and removed records. We join the tables on an internal identifier from the voter records and compare the hashes that we created during the import; this allows us to detect changes across a range of fields by comparing a single value, which simplifies and speeds up the process immensely. Records with differences are pulled out for further processing, as are any records that only appear in one of the tables.

At this point, we look at all the records we’ve set aside to see if enrolled Reg Watch users are watching them. If there’s an unexpected change to someone’s street address or other field, or their record has disappeared entirely, we alert them. If we’ve been told by a user that they submitted an update to their existing registration, we can let them know when it has been processed (or, the change hasn’t appeared after several weeks, tell them that they should follow up with their local Board of Elections). And, if we’ve been told that an enrolled user has submitted their voter registration for the first time, we can let them know when it was processed and we can start watching it for unexpected changes.

The system we’ve built also increases visibility into the frequency and scope of voter registration changes statewide, which over time will provide a valuable resource for the data scientists at Insightus — and will allow us to observe unusual, potentially malicious patterns of changes that might otherwise go undetected.

Ragtag’s mission is to connect volunteers with technology experience to progressive organizations and causes, and Reg Watch is one more example of how well that can work. We’re very happy to have had a hand in creating a tool that may help protect the voting rights of North Carolinians in the elections ahead.

If you’re a North Carolina voter and would like to enroll in Reg Watch, visit [https://ncgovote.org/](https://ncgovote.org/) and follow the instructions to sign up. And, if you’re a technologist of any sort and want to volunteer in efforts like this, you can learn more about joining Ragtag at [https://ragtag.org/join](https://ragtag.org/join).
