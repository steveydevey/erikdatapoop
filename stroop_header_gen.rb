#!/usr/bin/env ruby

#don't do this if the file exists
unless File.file?('stroop_ruby_out.csv') 
  headr = ''
  subj = "subject"
  sess = "session"
  
  headr += "#{subj},#{sess},"
  
  192.times do |x|
    ['rtt','acc','cycle'].each do |type|
  	  headr += "#{type.strip} #{x+1},"
    end
  end
  
  headr += "\n"
  
  File.open('stroop_ruby_out.csv','a') { |f| f.write( headr ) }
end

