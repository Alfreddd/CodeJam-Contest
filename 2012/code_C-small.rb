#!/usr/bin/env ruby

#######################################################################
# Google Code Jam 2012                                                #
# Problem C. Recycled Numbers                                         #
# http://code.google.com/codejam/contest/1460488/dashboard#s=p2&a=0   #
#######################################################################

def write_to_output(filename,output)
  File.open(filename, 'w') {|f| f.write(output) }
end
t=0
File.open('C-large.in' , 'r') do |file|
  t = file.gets.to_i
  outputs = Array.new(t){0}
  (0..t-1).each do |i|
    line = file.gets
    a,b = line.split(" ")
    next if a.length < 2
    a_i = a.to_i
    b_i = b.to_i
    counter = 0
    hash = {}
    (a_i .. b_i).each do |n_i|
      n = n_i.to_s
      next if n.count("0") == a.length - 1
      
      (0..n.length-2).each do |i|
        x = n[0..i]
        y = n[i+1 .. n.length-1]
        next if x == y || y[0]=="0" || y[0].to_i > b[0].to_i || y[0].to_i < x[0].to_i
        m = y + x
        next if m.to_i > b_i
        next if n == m
        next unless n_i < m.to_i && n_i >= a_i && m.to_i <= b_i  
        next if hash[n] && hash[n].include?(m)
        counter  = counter + 1
        hash[n] = (hash[n] || []) << m
      end
      outputs[i] = counter
    end

  end
  string_output = ''
(1..t).each do |i|
  string_output << "Case ##{i}: "+outputs[i-1].to_s + "\n"
end
write_to_output('output-C-large.txt',string_output)

end