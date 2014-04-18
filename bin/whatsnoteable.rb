#!/usr/bin/env ruby

require_relative '../lib/noteable'

$pattern = /(.*)(<\$\$)(.+)(\$\$>.*)/

NoteAble.find_all_and_print
