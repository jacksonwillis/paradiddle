#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-
# This file is part of paradiddle <http://github.com/jacksonwillis/paradiddle/>.

require "bundler"
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require "jeweler"
Jeweler::Tasks.new do |gem|
  gem.name = "paradiddle"
  gem.homepage = "http://github.com/jacksonwillis/paradiddle"
  gem.license = "Tiny"
  gem.summary = %Q{TODO: one-line summary of your gem}
  gem.description = %Q{TODO: longer description of your gem}
  gem.authors = ["Jackson Willis"]
end
Jeweler::RubygemsDotOrgTasks.new

$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))
require "paradiddle"

require "rspec/core"
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) { |spec| spec.pattern = FileList["spec/**/*_spec.rb"] }

task :default => :spec
