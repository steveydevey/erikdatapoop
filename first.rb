#!/usr/bin/env ruby

# loop across this to append to csv to get all the stroop files, but for now, one file
workingfile = 'Stroop.txt'

# get the first instance of the subject and sessions, then split down to the last word (the number)
subject = File.open(workingfile).grep(/Subject:/).first.split.last
session = File.open(workingfile).grep(/Session:/).first.split.last

bigpull = File.open(workingfile).grep(/TrialProc|RTTime|ACC|DesignList.Cycle/)

# loop to clean all the strings
bigpull.each do  |x| 
	x = x.strip!
end 

first_idx = bigpull.index('Procedure: TrialProcMain')
print "FI: #{first_idx} \n\n"
print "at: #{bigpull.at(40)}\n"

print "begin loop to print\n"
#print "#{subject},#{session},"
bigpull.each_with_index do  |y,idx| 
	print "#{idx} - #{y}\n"
end 
print "\n"
print "\n"

