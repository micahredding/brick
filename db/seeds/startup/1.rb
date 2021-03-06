@s1 = Episode.create(
"title" => "Ep 1: Platforms vs Custom Development",
"number" => 1,
"published_at" => "2015-01-25 00:00:01",
"media" => "http://resources.brickcaster.com/startup/001_platform_vs_dev.mp3",
"media_length" => 1474,
"media_size" => 58970244,
"summary" => "You've got deadlines, budget constraints, and incredible ambitions. Do you build your software on a platform that's already out there? Or do you develop everything from scratch? In this episode, we provide a framework to help you make your decision.",

"body" => %Q[

You've got deadlines, budget constraints, and incredible ambitions. Do you build your software on a platform that's already out there? Or do you develop everything from scratch? In this episode, we provide a framework to help you visualize your decision, as well as a list of questions to consider as you go through the process. [Read our detailed notes here](http://brickcaster.com/startup/1).

---

You've got deadlines, budget constraints, and incredible ambitions. Do you build your software on a platform that's already out there? Or do you develop everything from scratch?

Well, it depends...

This decision is complex, and it helps to have a developer weigh in. We've learned a lot over the years, having seen many software products go through the lifecycle.

In this episode, we provide a framework to help you visualize your decision, as well as a list of questions to consider as you're going through the process.

**PHILOSOPHY/BACKGROUND**

Our overarching philosophy is to avoid reinventing the wheel:  it's always worthwhile to explore what exists to see if there's anything you can use. Open source tools typically offer more flexibility.

But unless you need an incredibly simple solution (like a blog), there will likely be a need to customize and "bend" the solution to suit your purpose.

Typically, those needs change over the development process, and over the longer life of the software. At a certain point, developers are spending more time fighting the framework than they are building what you need.  That point is where adding investment ceases to create value.

> "At some point, it's like trying to make a Mars rover out of a SeaDoo. We can probably do it, but man, it's gonna be a nightmare." - Jeremy Holland

The name of the game is to be able to approximate that point in advance, before path dependency develops. Meaning, once you start down one path, it becomes harder and harder to change course.

**FRAMEWORK**

This graph is a tool to help you visualize the decision.  The area under the curve represents your total cost of development.

> ...

(You may be thinking: what about a "hybrid" model, like adding custom components to a CMS?  We've tried that a few times too. In our experience, sometimes it works and sometimes it doesn't.  It doesn't work well when the custom component is expected to grow and do more and more.)


**CONSIDERATIONS**

- Is this piece of software genuinely the core of your business?  If yes, you're more likely to need a custom solution.

- How much do you want to (or are you realistically able to) maintain the software?  Are you expecting to invest on a continuous basis? Pre-built solutions typically offer more intrinsic support.

- In terms of making the software product fit your dreams, how much are you willing to bend?  (You will probably have to, unless you have infinite time and infinite budget...)

-  We typically know the most about what the software does today.  What about tomorrow and the next day?  You can't (and probably shouldn't) plan too far ahead, but you do need to decide how much flexibility you want to have in the future. Be as aware as possible of changes down the road.  (A strong need for flexibility makes the case for custom development.)

-  It's cheaper and faster to start with a pre-built solution.  Are you willing to abandon your first prototype/MVP? It's often stated by founders, but not often done. Killing your MVP requires intestinal fortitude.





])