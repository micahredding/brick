@s3 = Episode.create(
"title" => "Ep 3: Why Open Source?",
"number" => 3,
"published_at" => "2015-03-25 00:00:01",
"media" => "http://resources.brickcaster.com/startup/003_open_source.mp3",
"media_length" => 1428,
"media_size" => 34830525,
"summary" => "Is open source dangerous? Insecure? Unsafe? Or is it the best platform to build your next product on? What does 'open source' even mean? Why do software developers love it so much? Learn all this and more, on our newest episode!",

"body" => %Q[

Is open source dangerous? Insecure? Unsafe? Or is it the best platform to build your next product on? What does 'open source' even mean? Why do software developers love it so much? Learn all this and more, on our newest episode! [Read our detailed notes here](http://brickcaster.com/startup/3).

---

**What is the Open in open source?**

Open means that the source code of the software can be viewed by everybody. Which means it's available for us to inspect.

Which means that when we use open source tools, we don't have to build on a "black box", but can build on something that is knowable and transparent.

In addition, open source tools are built by hundreds and thousands of contributors, and is constantly being tested and reviewed by them. This means we have confidence.

**Is Open Source worth less because it is free?**

No! :) This is a common bias based on the psychology of pricing, but it's very much not the case.

**How do we get support for open source software?**

Your developers! Rather than waiting for someone in an ivory tower at Microsoft (or somewhere else) to support your tools, something built on an open source platform can be supported by anyone who works in that platform.

And if you are having custom software built, then the best people to support that software are the people who built it. Don't needlessly cut ties with the people who build your software -- expect them to be able to maintain it and support it over time.

**The Speed of Trust: Trusting relationships is where the efficiency of business is found.**

The advantage of Ruby on Rails is that it maximizes developer happiness and productivity.

It allows you to rapidly get working software into production. Way faster than building in many other systems.

**Happy cows make better cheese: happy developers make better code.**

**KLOCs (1000 lines of code) - the worst metric ever!**

You don't want to optimize for the amount of code written. You want to optimize for working features that model your problems and solve them elegantly.

**When you scale to be as big as Twitter, you might need to refactor some of your early tools. That's good news!**

Don't prematurely optimize. At a certain scale, Twitter needed to remake some of its core pieces to operate faster. But they did this at the right time.

Early on, they prioritized getting a working product out the door.

There's a tradeoff between creating something that will scale to 10 million users, and creating something that will be able to be in production in a reasonable amount of time.

At no point in that transition will open source present a bottleneck. In fact, open source allows for that transition to happen more smoothly.

**Q. What's the alternative to open source? A: Propriety.**

**Is propriety more secure? No!**

**There is no security through obscurity.** Just because the source code is kept secret does not mean it is invulnerable to attacks. It's actually the opposite: when the source code is secret, it means developers don't know the vulnerabilities that are there, and so can't see the attacks coming.

In contrast, open source is available for developers to inspect and discover problems. And that means that when doing something particularly significant (logins, secure transactions, etc) we can all use code that has been verified to work, and stress-tested by thousands of developers.

**Don't recreate the history of software development!**

Build on the layers of software that have been built and proven before. Much of that is open source.

**An open source software project can't just be unilaterally shut down. But proprietary software can.**

We don't want to build a house on someone else's property. We want to build a house on a piece of land we can hold on to!


])