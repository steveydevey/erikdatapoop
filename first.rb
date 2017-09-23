#!/usr/bin/env ruby

# loop across this to append to csv to get all the stroop files, but for now, one file
workingfile = 'Stroop.txt'

# Search the files for 'subject or session' then grab the first result, then split that result down the last word (the number)
subject = File.open(workingfile).grep(/Subject:/).first.split.last
session = File.open(workingfile).grep(/Session:/).first.split.last

# search through the file for any possible values we may want and create an array of all of it
bigpull = File.open(workingfile).grep(/TrialProc|RTTime|ACC|DesignList.Cycle/)

# loop to clean whitespace from ALL the strings in the array (even strings we don't want)
bigpull.each do  |x| 
	x = x.strip!  # the ! permanently writes back to the array instead of the temporary values
end 

# grab the first instance of the TrialProcMain line, which is the start of the REAL data
first_idx = bigpull.index('Procedure: TrialProcMain')

# debug statement for testing the first index value -- should be removed later
print "FI: #{first_idx} \n\n"

# remove the first chunk of the array before the pieces of info that matter -- this drops all the test data
bigpull.shift(first_idx)

#print "#{subject},#{session},"

bigpull.each_with_index do  |y,idx| 
	print "#{idx} - #{y}\n"
end 
print "\n"
print "\n"

