# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

source "https://rubygems.org"

group :maintenance, optional: true do
	gem "bake-modernize"
	gem "bake-gem"
	
	gem "utopia-project"
end

group :test do
	gem "sus"
	gem "covered"
	
	gem "bake-test"
	gem "bake-test-external"
end
