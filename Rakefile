require 'rake'
require 'rspec/core/rake_task'


begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)

#desc "Generate code coverage"
#RSpec::Core::RakeTask.new(:coverage) do |t|
#  t.rcov = true
#  t.rcov_opts = ['--exclude', 'spec']
#end

task :default => :spec
#task 'cov' => :coverage
task 'gem:release' => 'test:run'

Bones {
  name     'bubble'
  authors  'James Pott'
  email    'james_pott@hotmail.com'
  url      'http://gotojavascript.com'
}

