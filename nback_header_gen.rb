#!/usr/bin/env ruby

#don't do this if the file exists
unless File.file?('nback_ruby_out.csv') 
  headr = ''
  subj = "subject"
  sess = "session"
  
  headr += "#{subj},#{sess},"
  
  60.times do 
    ['score','imagert'].each do |type|
  	  headr += "#{type.strip},"
    end
  end
  
  headr += "\n"
  
  File.open('nback_ruby_out.csv','a') { |f| f.write( headr ) }
end

