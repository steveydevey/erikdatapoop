#!/usr/bin/env ruby

#print ARGV[0]

# loop across this to append to csv to get all the nback files, but for now, one file
workingfile = ARGV[0]

# only if this is a real file, do the needful
if File.file?(workingfile) 

  # Search the files for 'subject or session' then grab the first result, then split that result down the last word (the number)
  subject = File.open(workingfile).grep(/Subject:/).first.split.last
  session = File.open(workingfile).grep(/Session:/).first.split.last
  
  # set the subject/session info at the beginning of the row
  datarecord = "#{subject},#{session},"

  # search through the file for any possible values we may want and create an array of all of it
  bigpull = File.open(workingfile).grep(/Trials:|Score:|Image.RT:/)
  
  # loop to clean whitespace from ALL the strings in the array (even strings we don't want)
  bigpull.each do  |x| 
  	x = x.strip!  # the ! permanently writes back to the array instead of the temporary values
  end 
  
  bigpull.each do |x| 
  # skip the entries that say "TrialProc" etc, because they don't actually contain data
    unless x =~ /Trials/ 
      # append data to the end of this record, separated by commas
      datarecord += "#{x.split.last},"
    end
  end 

  # add a newline at the end of this record, so the next won't have to know to do it
  datarecord += "\n"
  
  #puts datarecord
  File.open('nback_ruby_out.csv', 'a') {|f| f.write(datarecord) }

end
