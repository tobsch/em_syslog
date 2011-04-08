# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name    = 'em_syslog'
  s.version = File.read('VERSION').chomp
  s.authors = ['Tobias Schlottke']
  s.homepage = 'https://github.com/tobsch/em_syslog'
  s.description = 'A syslog client for EventMachine. Very useful if you want efficient logging to a flume server.'
  s.files      = Dir['lib/**/*']
  s.test_files = Dir['test/**/*']
  s.require_paths = ["lib"]
  s.summary = 'A syslog client for EventMachine'

  s.add_dependency(%q<eventmachine>, ['>= 0.12'])
end
