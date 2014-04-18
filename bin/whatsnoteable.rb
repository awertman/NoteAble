#!/usr/bin/env ruby

require_relative '../lib/noteable'

$pattern = /(.*)(##note##)(.+)(##note##.*)/

NoteAble.find_all_and_print
