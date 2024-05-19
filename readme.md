# Fiber::Storage

This gem provides a shim for `Fiber.[]`, `Fiber.[]=`, `Fiber#storage`, `Fiber#storage=`, which was introduced in Ruby 3.2.

[![Development Status](https://github.com/ioquatix/fiber-storage/workflows/Test/badge.svg)](https://github.com/ioquatix/fiber-storage/actions?workflow=Test)

## Motivation

Ruby 3.2 introduces inheritable fiber storage for per-request or per-operation state. This gem provides a shim for Ruby 3.1 and earlier to make adoption easier. It isn't able to provide the full range of features, but it should be sufficient for most use cases.

Notably, it does not support inheritance across threads or lazy Enumerator. This is a limitation of the shim implementation.

## Usage

See the [project documentation](https://ioquatix.github.io/fiber-storage).
