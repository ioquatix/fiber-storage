# frozen_string_literal: true

require_relative "lib/fiber/storage/version"

Gem::Specification.new do |spec|
	spec.name = "fiber-storage"
	spec.version = Storage::VERSION
	
	spec.summary = "Provides a compatibility shim for fiber storage."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.cert_chain  = ['release.cert']
	spec.signing_key = File.expand_path('~/.gem/release.pem')
	
	spec.homepage = "https://github.com/socketry/fiber-storage"
	
	spec.files = Dir.glob(['{lib}/**/*', '*.md'], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 2.7.0"
	
	spec.add_development_dependency "bundler"
	spec.add_development_dependency "covered"
	spec.add_development_dependency "sus"
end
