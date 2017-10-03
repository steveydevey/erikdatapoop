#!/usr/bin/env ruby

#don't do this if the file exists
unless File.file?('forward_ruby_out.csv') 
  
  header = "Session:,Subject:,Trials.Sample:,DigitSpan:,First:,Second:,Third:,Fourth:,Fifth:,Sixth:,Seventh:,Eighth:,KeyPress1RT:,KeyPress1RESP:,KeyPress2RT:,KeyPress2RESP:,KeyPress3RT:,KeyPress3RESP:,KeyPress4RT:,KeyPress4RESP:,KeyPress5RT:,KeyPress5RESP:,KeyPress6RT:,KeyPress6RESP:,KeyPress7RT:,KeyPress7RESP:,KeyPress8RT:,KeyPress8RESP:"

  File.open('forward_ruby_out.csv','a') { |f| f.write( header ) }
end

