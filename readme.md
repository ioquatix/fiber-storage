# Fiber::Storage

This gem provides a shim for `Fiber.[]`, `Fiber.[]=`, `Fiber#storage`, `Fiber#storage=`.

## Motivation

Ruby 3.2 introduces inheritable fiber storage for per-request or per-operation state. This gem provides a shim for Ruby 3.1 and earlier to make adoption easier. It isn't able to provide the full range of features, but it should be sufficient for most use cases.

Notably, it does not support inheritance across threads or lazy Enumerator. This is a limitation of the shim implementation.

## Installation

Add the gem to your project:

```shell
$ bundle add fiber-storage
```

## Usage

```ruby
require 'fiber/storage'

Fiber[:x] = 10
Fiber.new do
	Fiber[:x] # => 10
end.resume
```