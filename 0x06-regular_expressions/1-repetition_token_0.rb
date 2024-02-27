#!/usr/bin/env ruby
require 'oniguruma'

def find_matches(text, regex)
  engine = Oniguruma::Engine.new(regex, options: Oniguruma::OPTION_MULTILINE)
  matches = []
  while match = engine.match(text)
    matches << match.to_s
    text = text[match.end..text.length]
  end
  if matches.empty?
    puts "No matches found."
  else
    puts "Matches found:"
    puts matches.join(" ")
  end
end

regex = ARGV[0]

text = "hbn hbtn hbttn hbtttn hbttttn hbtttttn hbttttttn"

find_matches(text, regex)
