# Getting Started

This guide explains how to use this gem and provides a brief overview of the features.

## Installation

Add the gem to your project:

~~~bash
$ bundle add fiber-storage
~~~

## Usage

Fiber storage is similar to thread local storage and fiber local storage. It is a hash-like object that is associated with a fiber. It is used to store per-fiber state. However, unlike thread and fiber local storage, fiber storage is inherited across fibers, including across threads which have a main fiber.

Fiber storage is useful for storing per-request or per-operation state. For example, you might store the current user or the current operation. This allows you to access this state from anywhere in the call stack, including nested fibers and threads.

```ruby
require 'fiber/storage'

Fiber[:x] = 10

Fiber.new do
	Fiber[:x] # => 10
end.resume

Thread.new do
	Fiber[:x] # => 10
end.join
```
