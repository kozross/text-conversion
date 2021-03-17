# `text-conversion` 

## What is this thing?

A library for handling text encoding and conversions.

## What are the goals of this project?

### Totality by default

Partial functions (and type classes which provide them) will not be included:
everything is total. When we include anything unsafe, it will be explicitly
firewalled into its own module, behind a newtype.

### No boolean blindness

[Boolean blindness](http://dev.stephendiehl.com/hask/#boolean-blindness) is not
a good thing, for all the reasons listed in the link. Whenever possible, we'll
try and give more useful information than a `Bool`.

### No lawless type classes

Type classes should have laws; this allows us to have reasonable expectations of
how instances should behave, both when using them, and when defining them. All
of our type classes are bound by laws, which we state clearly.

### Discoverability, documentation and user-friendliness

We aim to clarify _every_ corner case, and care strongly about making the API
easy to follow, learn and understand. We also ensure that type inference is as
strong as possible; that way, anyone using this package, beginner or expert, can
be confident that GHC can assist them when using this package.

## What's with all the cat stuff?

[I am a Haskell catboy.](https://twitter.com/KozRoss)

## What does this run on?

Currently, our CI checks the following versions of GHC:

* 8.6.5
* 8.8.4
* 8.10.4
* 9.0.1

We check on the following platforms:

* Windows
* Linux
* MacOS

## What can I do with this?

The project is licensed Apache 2.0 (SPDX code
[`Apache-2.0`](https://spdx.org/licenses/Apache-2.0.html)). For more details,
please see the `LICENSE.md` file.
