+++
date = "2025-12-27T13:16:25-05:00"
title = "Why I'm Learning How Compilers Work"
+++

I'm a programmer with a problem. I'm addicted to figuring out how things work.

This usually slows me down. When everyone else is shipping, I'm layers deep in some abstraction trying to understand what's actually happening underneath. It's not efficient. I'll spend an afternoon reading source code for a library I could just *use*. I'll dig into a framework's internals when I could just follow the tutorial. It's a compulsion, and it costs me time.

But it *usually* pays off. Once I understand something, I really understand it. And when things break (they always do), I'm not stuck waiting for Stack Overflow to save me.

I've also learned that I work best slowly and incrementally. A little better each day, no big leaps. After two or three months of consistent effort, I'm usually pretty solid at whatever I set out to learn.

This blog series is me doing that process in public.

## The LLM context problem

If you've been anywhere near a computer in the last few years, you've heard that LLMs are going to change everything. Software engineering will never be the same. We're all going to be obsolete, or ten times more productive, or both somehow.

I work with these tools constantly, so I've had time to form some opinions. Here's what I've landed on: LLMs are useful, but the usefulness depends entirely on context. Give the model the right context and it's genuinely helpful. Give it the wrong context, and you're worse off than if you'd just figured it out yourself.

The industry is still in the early stages of understanding this. There's a lot of experimentation happening around context windows, retrieval augmented generation, system prompts, and all the rest. Some approaches work better than others. If you've spent real time with these tools, you've probably developed your own preferred workflow.

For me, I use a simple chat interface. No agents. I pass in relevant context manually—classes, functions, whatever snippet is actually relevant to my problem—and I ask for help with something specific.

I hear the hype about agents constantly. Let the AI write the code, run the tests, fix the errors, iterate until it's done. I've tried it. I don't get it.

For me, the bottleneck was never writing the code. When I know what I need to build and how to build it, writing the code is the easy part. I can just put my head down and go. I don't need an agent for that. I also don't need to worry about an agent doing something dumb like commenting out a failing test to make the suite pass. I know better than to do that. I'm not confident the agent does.

Where I actually get stuck is the thinking part. When I have writer's block on a problem—when I can't figure out the right design, or I'm not sure how two systems should talk to each other—that's when LLMs help me most. Talking through an idea with a coding assistant is often the fastest way to get unstuck. It's like [rubber duck debugging](https://rubberduckdebugging.com/), except the duck has good suggestions.

A back-and-forth conversation gets me to clarity faster than any amount of steering docs or elaborate system prompts. It's just fewer tokens and less friction to reach the same place.

## What I think is missing

I love LSPs.

I realize that's a strange thing to say. Language Server Protocol doesn't exactly inspire passion in most people.

LSPs are quietly brilliant. They're the reason your editor knows where a function is defined, what's calling it, and whether you've made a typo. They power autocomplete, go-to-definition, find-all-references—all the features that make a code editor actually useful instead of just a text editor with syntax highlighting.

What I find compelling is how they work. An LSP has to understand your code well enough to answer questions about it in real time. It's parsing, analyzing, and building up a model of your codebase so it can tell your editor useful things. It's doing a version of what a compiler does, but interactively.

Now, back to the LLM problem.

What I want is something like an LSP for context gathering. When I'm working on a feature and I need to ask an LLM for help, I want an automated way to pull in all the relevant code. Not just the file I'm looking at, but the definitions, the references, the related types, the stuff the model actually needs to understand my problem.

Right now I do this manually. I copy and paste snippets, I include class definitions, I try to give the model enough to work with. It's tedious and in all honesty I'm probably not great at it. I either include too much (and blow through the useful context window) or too little (and get useless suggestions).

This is not a novel idea, plenty of people are thinking about this problem. But I need to explore it myself. Maybe the answer is an MCP server for symbols, definitions, and references. Maybe it's something else. I don't know yet.

## Why I'm writing this publicly

I hate writing.

I'm not being modest. I genuinely think I'm bad at it, and it definitely does not come naturally to me. When I sit down to write, I feel slow and clumsy. The words don't flow. I stare at the cursor blinking and wonder why.

The one upside I find to writing is that when I force myself to write about a topic, I uncover all the gaps in my understanding. Writing forces me to dig deeper. It exposes what I don't know in a way that just *thinking* about something doesn't.

Here's a test if you don't believe me. Write a one-page explanation of something you understand well. It'll take a little effort, but you'll get through it. Now write one page about the relationship between quantum gravity and string theory. This would be next to impossible unless you specialize in theoretical physics. You'll stare at that blinking cursor for ages because you *literally* can't form sentences about something you don't know.

That discomfort, for me, is where the learning happens. When I can't write a clear sentence about something, I know I've found the edge of my understanding. Then I go read or experiment until I can come back and put something coherent on the page.

So this blog series is mostly for me. It's a tool to force myself to actually learn this stuff instead of just skimming it.

## The hypothesis

Here's what I'm betting on:

- Building a language and interpreter will help me understand ASTs and parsers at a level I currently don't. Right now they're abstractions I've used but haven't truly understood.

- Understanding how interpreters and compilers work will show me where and how to extract context from code. If I know how a compiler breaks down a program, I'll know the best places to hook in and pull out meaningful information.

- Better context extraction will make LLMs more useful for the kind of work I actually do. That's the end goal—not to build a compiler for its own sake, but to understand compilers well enough to build better tools.

I'm probably wrong about this but learning more about compilers will likely do very little harm to my career.

## What's next

I'm starting with [Crafting Interpreters](https://craftinginterpreters.com/introduction.html) by Robert Nystrom. It's highly recommended AND it's freely available online as I wait for my paperback version (support authors who put in the work!)

After that, I'll try building my own interpreter or compiler. Partly because it sounds fun. Partly because I learn best by building things, not just reading about them.

Eventually, I want to experiment with tools that gather context automatically, the LSP-for-LLMs idea I mentioned earlier. But that's a ways off.

Throughout all of this, I'll write about what I find. These goals are intentionally loose. I fully expect this project to take me somewhere different than where I think I'm headed. Locking in rigid plans at the start seems like the best way to miss something important. Or worse, get bored and give up.

If any of that sounds interesting, feel free to follow along!

