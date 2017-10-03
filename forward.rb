#!/usr/bin/env ruby

#print ARGV[0]

# loop across this to append to csv to get all the stroop files, but for now, one file
workingfile = ARGV[0]

trial = 0

# only if this is a real file, do the needful
if File.file?(workingfile) 

  # Search the files for 'subject or session' then grab the first result, then split that result down the last word (the number)
  subject = File.open(workingfile).grep(/Subject:/).first.split.last
  session = File.open(workingfile).grep(/Session:/).first.split.last
  
  # set the subject/session info at the beginning of the row
  datarecord = "#{subject},#{session},"

  # search through the file for any possible values we may want and create an array of all of it
  bigpull = File.open(workingfile).grep(/Procedure|DigitSpan|First|Second|Third|Fourth|Fifth|Sixth|Seventh|Eigth|KeyPress1RT|KeyPress|KeyPress1RT|KeyPress1RESP|KeyPress2RT|KeyPress2RESP|KeyPress3RT|KeyPress3RESP|KeyPress4RT|KeyPress4RESP|KeyPress5RT|KeyPress5RESP|KeyPress6RT|KeyPress6RESP|KeyPress7RT|KeyPress7RESP|KeyPress8RT|KeyPress8RESP/)
  
  # loop to clean whitespace from ALL the strings in the array (even strings we don't want)
  bigpull.each do  |x| 
  	x = x.strip!  # the ! permanently writes back to the array instead of the temporary values
  end 
  
  # grab the first instance of the TrialProcMain line, which is the start of the REAL data
  first_idx = bigpull.index('Procedure: Length4')
  puts bigpull
  
  # remove the first chunk of the array before the pieces of info that matter -- this drops all the test data
  bigpull.shift(first_idx)
  
  bigpull.each do |x| 
  # skip the entries that say "Procedure" etc, because they don't actually contain data
    if x =~ /Procedure/ 
      datarecord += "\n" unless trial == 0
      trial = trial + 1
      datarecord += "#{subject},"
      datarecord += "#{session},"
      datarecord += "#{trial},"
    else
      # if it's the sample number we insert a newline to start a new row
      datarecord += "#{x.split.last},"
    end
  end 

  #puts datarecord
  File.open('stroop_ruby_out.csv', 'a') {|f| f.write(datarecord) }

end
