---
layout: post
title: TypeScript - project setup
comments: true
description: Typescript basic project setup
---

<a target="_blank" href="/assets/img/types_dance.png"><img alt="type dance" src="/assets/img/types_dance.png" width="400px"/></a>

Hi, recently I discovered TypeScript. It’s very important for me to have types protection since it removes a lot of common errors/bugs from the project written in dynamically typed language.

Today I want to describe how to setup a basic TypeScript project.

Let’s start.
===============

First of all you need to install TypeScript.

```bash
npm install -g typescript
```


You need NPM of course but I don’t think it’s an issue for you.
Next step is this command:

```bash
tsc --init
```

This command will create **tsconfig.json** file for you. This file is basically configuration for your TypeScript compiler and kind of indicator where your project’s root is.

Here is the content:

```json
{
  "compilerOptions": {
	"module": "commonjs",
	"target": "es5",
	"noImplicitAny": false,
	"sourceMap": false
  },
  "exclude": [
	"node_modules"
  ]
}
```

And, let’s forget about it for a while.

Project structure
======================


This one is pretty personal and I just want to show you how I do it.

```
├── out
├── src
│   ├── classes
│   │   ├── another_namespace_folder
│   │   ├── reports
│   │   │   ├── CoolReport.ts
│   │   │   └── NotCoolReport.ts
│   │   └── users
│   │       ├── Admin.ts
│   │       └── User.ts
│   ├── interfaces
│   │   └── users
│   │       └── BillableInterface.ts
│   └── main.js
└── tsconfig.json
```
<br/>

* **out**  - this directory is for output javascript file(s)
* **src** - this directory contains all the TypeScript files

If you need an **assets** directory you can create it in root of project also.

**main.js** is absolutely not important here. You can give any name to such file or you can even remove it.
I just use it as starting point of the project.

Ok, let’s back to our tsconfig.json
Let’s update it to look like this.

```json
{
  "compilerOptions": {
	"module": "commonjs",
	"target": "es5",
	"noImplicitAny": false,
	"sourceMap": false,
	"outFile": "./out/include.js",
	"sourceRoot": "./src/",
	"rootDir": "./src/",
	"removeComments": true
  },
  "exclude": [
	"node_modules"
  ]
}
```
<br>
What was changed there:

* **outFile** - path to the JavaScript file that will be generated after compilation of \*.ts files
* **sourceRoot** - directory that contains all \*.ts files. Compiler will take all the files from here and compile them
* **removeComments** - we no need comments in generated JS file

So, now we ask TSC to search all **\*.ts** files inside **src** directory and compile all of them into one include.js file.

At the moment if you run TSC command in the root of project

```bash
tsc
```

it will check the **tsconfig.json** and will compile all **\*.ts** files inside src directory.

After this you can see **include.js** file inside your **out** directory. Awesome!

Checkout [tsconfig.json documentation](https://www.typescriptlang.org/docs/handbook/tsconfig.json.html) for more info.

Why I actually prefer TypeScript over any other supersets of JS
===================================================================================

Here is some points:

* Type secure

As I said at top of this post it's very important for me since I think it reduce amount of bugs
that produced by dynamically typed langauges. Honestly it is not a language's fault but developer's one. But anyway dynamicly typed languages are encourage this.
I usually write in PHP and it also have type hints but TypeScript different for the better since it is really compileable
and all miss-types can be found when at the same time PHP's type issues will be found only when bad code will be executed

* Looks good in OOP terms

Don't get me wrong, JavaScript's prototype-based system is pretty interesting
but in daily work it's hard to switch from usual OOP way to JS one, at least for me.
I don't think it is an issue for people that use Node.JS for backends and JS for front. But it's not about me.
I like TypeScript because it looks like usual OOP langauge with constructors, public/private/protected methods and usual inheritance and interfaces.

* You can use it as usual Javascript.

Since TypeScript is superset of JS it means we can actually write JS with no issues.
It's awesome if you use third-party lib or testign framework that was not planned to use for TypeScript.

* types types types

YES! Again. I really love it! :D

<br>
So, if you want to be types protected in your JS give it a try. You will not be disappointed.
