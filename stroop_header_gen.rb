#!/usr/bin/env ruby

headr = ''
subj = "subject"
sess = "subject"

headr += "#{subj},#{sess},"

192.times do 
  ['rtt','acc','cycle'].each do |type|
	  headr += "#{type.strip},"
  end
end

headr += "\n"

File.open('stroop_ruby_out.csv','a') { |f| f.write( headr ) }
