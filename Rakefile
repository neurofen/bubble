require 'rake'
require 'rspec/core/rake_task'


begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)


task :default => :spec
task 'gem:release' => ':spec'

Bones {
  name     'bubble'
  authors  'James Pott'
  email    'james_pott@hotmail.com'
  url      'http://gotojavascript.com'
}

