#!/usr/bin/env ruby

#######################################################################
# Google Code Jam 2012                                                #
# Problem B. Dancing With the Googlers                                #
# http://code.google.com/codejam/contest/1460488/dashboard#s=p1&a=0   #
#######################################################################

def write_to_output(filename,output)
  File.open(filename, 'w') {|f| f.write(output) }
end
t=0
File.open('B-small-attempt1.in' , 'r') do |file|
  t = file.gets.to_i
  outputs = Array.new(t){0}
  (0..t-1).each do |i|
    n , s , p , *ts = file.gets.split(" ").map(&:to_i)
    counter = 0
    ts.each do |t|
      if t/3 >= p
        counter += 1
      elsif (d = p-t/3) <= t%3
        if d ==2 && s !=0
          counter += 1
          s -= 1
        else
          counter +=1
        end
      elsif (p-t/3) == 1 && t%3 == 0 && s!= 0 && t>2
        counter +=1
        s -= 1
      end
      outputs[i] = counter
    end
  end
string_output = ''
(1..t).each do |i|
  string_output << "Case ##{i}: "+outputs[i-1].to_s + "\n"
end
write_to_output('output-B-small1.txt',string_output)
end