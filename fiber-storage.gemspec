# frozen_string_literal: true

require_relative "lib/fiber/storage/version"

Gem::Specification.new do |spec|
	spec.name = "fiber-storage"
	spec.version = Fiber::Storage::VERSION
	
	spec.summary = "Provides a compatibility shim for fiber storage."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.cert_chain  = ["release.cert"]
	spec.signing_key = File.expand_path("~/.gem/release.pem")
	
	spec.homepage = "https://github.com/ioquatix/fiber-storage"
	
	spec.metadata = {
		"homepage_uri" => spec.homepage,
		"documentation_uri" => "https://ioquatix.github.io/fiber-storage/",
		"funding_uri" => "https://github.com/sponsors/ioquatix/",
		"source_code_uri" => "https://github.com/ioquatix/fiber-storage.git",
	}
	
	spec.files = Dir.glob(["{lib}/**/*", "*.md"], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 3.1"
end
