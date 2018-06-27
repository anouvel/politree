#!/usr/bin/env ruby

require 'bundler/inline'

gemfile true do
  source 'https://rubygems.org'
  gem 'pry', require: true
  gem 'pry-nav', require: true
  gem 'rhcl', require: true
  gem 'rgl', require: false
end

require 'rgl/adjacency'
require 'rgl/dot'

def build_graph(filename)
  result = RGL::DirectedAdjacencyGraph.new
  src_hcl = Rhcl.parse(open(filename).read)
  for policy in src_hcl do
    all_path = policy[1]
    for path in all_path do
      tmp_path = ''
      s_path = path[0].split('/')
      s_path.each_with_index do |_item, index|
        tmp_path = tmp_path + '/' + s_path[index]
        result.add_vertex tmp_path
        result.add_edge tmp_path.rpartition('/')[0], tmp_path if index > 0
      end
    end
  end
  result.write_to_graphic_file(fmt = 'jpeg', dotfile = filename)
end

def main
  src = ARGV[0]
  if src.nil?
    puts 'Please provide a filename with policies.'
    exit 1
  else
    build_graph(src)
  end
end

main
