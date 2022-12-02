# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

require 'fiber/storage'

describe Fiber do
	it "should be able to store data" do
		Fiber.new(storage: {foo: :bar}) do
			expect(Fiber[:foo]).to be == :bar
		end.resume
	end
	
	it "can inherit storage into child fibers" do
		Fiber.new(storage: {foo: :bar}) do
			Fiber.new do
				expect(Fiber[:foo]).to be == :bar
			end.resume
		end.resume
	end
	
	it "can override storage in child fibers" do
		Fiber.new(storage: {foo: :bar}) do
			Fiber.new(storage: {foo: :baz}) do
				expect(Fiber[:foo]).to be == :baz
			end.resume
		end.resume
	end
	
	it "can inherit storage by reference" do
		storage = {foo: :bar}
		
		Fiber.new(storage: storage) do
			Fiber.new(storage: false) do
				expect(Fiber[:foo]).to be == :bar
				Fiber[:foo] = :baz
			end.resume
			expect(Fiber[:foo]).to be == :baz
		end.resume
	end
end
