# frozen_string_literal: true

require_relative "lib/errbit_github_plugin/version"

Gem::Specification.new do |spec|
  spec.name = "errbit-ng-github-plugin"
  spec.version = ErrbitGithubPlugin::VERSION
  spec.authors = ["Ihor Zubkov"]
  spec.email = ["igor.zubkov@gmail.com"]

  spec.summary = "GitHub integration for Errbit-NG"
  spec.description = "GitHub integration for Errbit-NG"
  spec.homepage = "https://github.com/errbit-ng/errbit-ng-github-plugin"
  spec.license = "MIT"

  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "#{spec.homepage}/blob/main/README.md"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "errbit-ng-plugin"
  spec.add_dependency "octokit"

  spec.add_development_dependency "activesupport"
end
