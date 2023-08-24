# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022-2023, by Samuel Williams.

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
	
	it "can inherit storage by copy" do
		storage = {foo: :bar}
		
		Fiber.new(storage: storage) do
			Fiber.new(storage: true) do
				expect(Fiber[:foo]).to be == :bar
				Fiber[:foo] = :baz
			end.resume
			expect(Fiber[:foo]).to be == :bar
		end.resume
	end
	
	it "can assign to storage" do
		Fiber.new do
			Fiber.current.storage = {foo: :bar}
			expect(Fiber[:foo]).to be == :bar
		end.resume
	end
	
	it "can set fiber storage" do
		value = Fiber.new do
			Fiber[:key] = :value
			Fiber[:key]
		end.resume
		
		expect(value).to be == :value
	end
	
	it "can't use non-symbol keys" do
		expect do
			Fiber["key"] = :value
		end.to raise_exception(TypeError)
	end
	
	it "can use dynamic keys" do
		key = :"#{self.object_id}.key"
		value = Fiber.new do
			Fiber[key] = :value
			Fiber[key]
		end.resume
		
		expect(value).to be == :value
	end
end
