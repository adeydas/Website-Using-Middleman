---
title: My take on tech interview preparation
date: 2017-01-02 03:35 UTC
tags: Interviews, Tech
category: Technology
---

Happy New Year! One of my resolutions this year is to write more. This is not my first blog, but I feel this will be a blog revamped. I want to write more verbose, meaningful and original posts. With that in mind, for my first post, I wanted to write on a topic that is very close to my heart: tech interviews. They are fun to both take and give, and there are rewards to reap as well. What more can one ask for, right! 


So what to expect from this blog post:

* We will delve into some of the not so well known facets of a tech interview.
* We will talk about the different directions an interview question may take and discuss that.

Let’s start with a question:

> A pet shelter near you houses orphaned cats and dogs. People may adopt either a cat, a dog or leave the choice to the pet shelter. Design an algorithm to make this a self-service.

People experienced with interviews will immediately see the trick in this question: it’s incomplete and thus, ambiguous. One may ask, what’s the point of asking an incomplete question. And therein lies the first facet of a tech interview: it’s more than just a technical interview. That’s right, a tech interview does not only judge your technical (algorithm or programming) skills, it also judges your problem solving and people skills. Seldom would one get problems in a real work environment that are concretely defined. It lies with an engineer to make a problem concrete and find a solution to it.

Several questions might help in making this question concrete. It lies with the interviewee to ask questions that will shape the problem. For this problem, some questions we could have asked are:

* Can a person choose which pet, which cat or which dog to adopt?
* Is it localized to one shelter or can a person choose across shelters? Think to go to a local shelter v/s choosing from an array of shelters using (say) a mobile app.

Let’s say the interviewer says the algorithm should choose the pet to vend based on FIFO aka if a pet has arrived first;, it should be adopted first. A follow-up question could be what if two pets came at the same instant and so on.

To maintain brevity of this post, let’s say after several rounds of questions, this is the final concrete problem:

> A pet shelter near you houses orphaned cats and dogs. People may adopt either a cat, a dog or leave the choice to the pet shelter. Design an algorithm to make this a self-service. The algorithm will choose how to vend a pet in an increasing order of the time the pet arrived at the shelter aka if a pet had come early, it should be vended sooner than another that has come after it. If two (or more)pets had arrived at the same instant, the algorithm would randomly choose one. A person may choose either a cat, a dog or leave it upon the algorithm to choose any pet. The self-service is only for one shelter.

Armed with a concrete definition of the problem, let’s move on to the next section: solving the problem.

More often than not, an interview question is not one problem but a collection of problems. The interviewee’s job is to parse the individual problems and solve them systematically. I feel this is a very valuable skill since real world problems are seldom unary and an engineer’s job is to parse these into more understandable and actionable chunks.

This problem has some very distinguishable and actionable chunks like:

* The UI of the self service for customers.
* The UI of the self service for employees of the shelter.
* Implementation details of the core algorithm.
* A random number generator.

These are significant problems in themselves, and we can further break them down into more understandable and actionable chunks. A question I often ask myself is when are the right time to stop breaking down a problem, and the answer almost always is when I know exactly what lines of code I need to write to accomplish the task.

So a very useful tip to remember when giving interviews is to break down the problem into smaller and more actionable chunks.

Now that we have more understandable and somewhat more actionable items, let’s break them down further and implement a solution to the problem. Note, we still don’t know the solution to the problem, we merely understand the problem a little better.

To keep this post concise, let’s choose item #3 and talk more about it. We need to implement the core algorithm for all these.

There can (and almost always will) be more than one way to solve a problem. While providing the best possible solution is always a good idea, how you reached that solution is far more important.

The reason behind it is simple: when implementing a system with thousands of lines of code to be used and modified over the years and be touched by tens of engineers, it makes sense to be declarative and write as much clean code as possible. Think about this, the first day of your job; you touch a system that has been working as a wall since the last ten years but has a spaghetti code base, would it be easy for you to work on it. Would you call it a good, well-designed system? Comparatively, if you have a system that has clean, declarative (albeit a lot more) code than the previous one, wouldn’t it be easier to work on it.

As we discussed before, a problem could (and probably does) have multiple solutions. Even our small actionable item have multiple solutions. To get to one or more solution, it usually helps if we start with a basic one and an essential solution is almost always a brute force one using the simplest data structures. Note, it’s okay to start with a brute force solution since that is what comes to the mind of a person if he/she hasn’t seen the problem before. However, it’s not okay to stop at a brute force solution. Almost always, an interview question will have a better solution that a brute force one.

So how do we get to a better solution? A problem is like a puzzle, and a puzzle has breadcrumbs. Let’s take our example problem. It says the pets should be vended in a chronological fashion from the first arrival to the last. That statement might make us think of stacks as the most appropriate data structure that may be used for this problem. So a good tip to remember while designing a better solution is to look for clues in the problem statement.

Now that we have a clue, how do we go on to designing the algorithm? For me, it usually helps if I simplify the problem into a base case. For instance, taking our question, what if we had only one type of pet: say cats. Then our solution would have been to put the cats on a stack and pop whenever a customer wanted to adopt one. Same for dogs.

Now that we have both cats and dogs, we can keep two stacks. But what if a customer has no preference. For the algorithm to decide whether to pick a cat or a dog, it needs to know which came first to the shelter. And here comes your technical prowess. We can use the peek() method in stacks to look at the timestamp of the top most element of both stacks and vend the one with the older timestamp.

I will leave the code and implementation details out of this blog post. What we can take away from this is: arrive at a solution to the problem in a structured and logical way.

Hope these interview tips were of some help to you. Feel free to leave your interview tips in the comments.