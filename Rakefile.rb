#!/usr/bin/env ruby
# encoding: utf-8

task(:coffee) { sh "coffee --bare --lint --compile paradiddle.coffee" }
task(:compile) { sh "closure-compiler --js paradiddle.js --js_output_file paradiddle.min.js" }
task :default => [:coffee, :compile]
