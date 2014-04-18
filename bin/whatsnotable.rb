#!/usr/bin/env ruby

require_relative '../lib/notable'
# p Dir.getwd USE THIS LATEE WHEN ITERATING
Notable.find_all_and_print Dir["**/*"] #'./test_files/ruby.rb
# p Dir["**/*"]