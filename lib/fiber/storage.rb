# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

require 'fiber'

class Fiber
	module Storage
		def initialize(*arguments, storage: true, **options, &block)
			case storage
			when true
				@storage = Fiber.current.storage
			when false
				@storage = Fiber.current.__storage__
			else
				@storage = storage
			end
			
			super(*arguments, **options, &block)
		end

		def storage=(hash)
			@storage = hash.dup
		end
		
		def storage
			@storage.dup
		end
		
		def __storage__
			@storage
		end
	end
	
	unless Fiber.current.respond_to?(:storage)
		warn "Fiber#storage is running in compatibility mode."
		prepend Storage
		
		def self.[] key
			self.current.__storage__[key]
		end
		
		def self.[]= key, value
			self.current.__storage__[key] = value
		end
	end
end
