# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

source "https://rubygems.org"

group :maintenance, optional: true do
	gem "bake-modernize"
	gem "bake-gem"
end

group :test do
	gem "bake-test"
	gem "sus"
	gem "covered"
end
