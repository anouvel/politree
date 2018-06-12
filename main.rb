#!/usr/bin/env ruby

require 'bundler/inline'

gemfile true do
  source 'https://rubygems.org'
  gem 'pry', require: true
  gem 'pry-nav', require: true
end

def main
  puts "Hello world !"
end

main
