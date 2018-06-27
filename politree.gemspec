
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'politree/version'

Gem::Specification.new do |spec|
  spec.name          = 'politree'
  spec.version       = Politree::VERSION
  spec.authors       = ['Clement Hussenot', 'Adrien Nouvel']
  spec.email         = ['chussenota@gmail.com']

  spec.summary       = 'A Ruby gem to generate a tree view of your HCL Vault policies files.'
  spec.description   = 'A Ruby gem to generate a tree view of your HCL Vault policies files.'
  spec.homepage      = 'https://github.com/anouvel/vault_tree_generator'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org/'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'rgl'
  spec.add_dependency 'rhcl'
  spec.add_dependency 'thor'
end
