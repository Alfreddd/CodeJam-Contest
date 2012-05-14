#!/usr/bin/env ruby

#######################################################################
# Google Code Jam 2012                                                #
# Problem A. Speaking in Tongues                                      #
# http://code.google.com/codejam/contest/1460488/dashboard#s=p0&a=0   #
#######################################################################

LETTERS_MAP = {"e"=>"o", "j"=>"u", "p"=>"r", " "=>" ", "m"=>"l", "y"=>"a", "s"=>"n", "l"=>"g", "c"=>"e", "k"=>"i", "d"=>"s", "x"=>"m", "v"=>"p", "n"=>"b", "r"=>"t", "i"=>"d", "b"=>"h", "t"=>"w", "a"=>"y", "h"=>"x", "w"=>"f", "f"=>"c", "o"=>"k", "u"=>"j", "g"=>"v", "q"=>"z", "z"=>"q"}

def write_to_output(filename,output)
  File.open(filename, 'w') {|f| f.write(output) }
end
t=0
inputs = []
outputs = []
File.open('A-small-attempt0.in' , 'r') do |file|
  t = file.gets.to_i
  (0..t-1).each{|i| inputs[i] = file.gets}
end
inputs.each do |g|
  s = ''
  g.chomp.split(//).each do |char|
      s << LETTERS_MAP[char]
  end
  outputs << s
end
string_output = ''
(1..t).each do |i|
  string_output << "Case ##{i}: "+outputs[i-1] + "\n"
end
write_to_output('output-A-small.txt',string_output)
