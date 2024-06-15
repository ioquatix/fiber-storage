# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022-2023, by Samuel Williams.

require 'fiber'

class Fiber
	module Storage
		def initialize(*arguments, storage: true, **options, &block)
			case storage
			when true
				@storage = Fiber.current.storage
			else
				raise TypeError, "Storage must be a hash!" unless storage.is_a?(Hash)
				
				@storage = storage
			end
			
			super(*arguments, **options, &block)
		end

		# Set the storage associated with this fiber, clearing any previous storage.
		def storage=(hash)
			@storage = hash.dup
		end
		
		# The storage associated with this fiber.
		def storage
			@storage.dup
		end
		
		def __storage__
			@storage ||= {}
		end
	end
	
	unless Fiber.current.respond_to?(:storage)
		prepend Storage
		
		# Get a value from the current fiber's storage.
		def self.[] key
			raise TypeError, "Key must be symbol!" unless key.is_a?(Symbol)
			
			self.current.__storage__[key]
		end
		
		# Set a value in the current fiber's storage.
		def self.[]= key, value
			raise TypeError, "Key must be symbol!" unless key.is_a?(Symbol)
			
			self.current.__storage__[key] = value
		end
	else
		def self.__borked_keys__
			!Fiber.new do
				key = :"#{self.object_id}.key"
				Fiber[key] = true
				Fiber[key]
			end.resume
		end
		
		if __borked_keys__
			module FixBorkedKeys
				def [](key)
					raise TypeError, "Key must be symbol!" unless key.is_a?(Symbol)
					
					super(eval(key.inspect))
				end
				
				def []=(key, value)
					raise TypeError, "Key must be symbol!" unless key.is_a?(Symbol)
					
					super(eval(key.inspect), value)
				end
			end
			
			singleton_class.prepend FixBorkedKeys
		end
	end
end
