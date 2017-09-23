#!/usr/bin/env ruby

# loop across this to append to csv to get all the stroop files, but for now, one file
workingfile = 'Stroop.txt'

# get the first instance of the subject and sessions, then split down to the last word (the number)
subject = File.open(workingfile).grep(/Subject:/).first.split.last
session = File.open(workingfile).grep(/Session:/).first.split.last

bigpull = File.open(workingfile).grep(/TrialProc|RTTime|ACC|DesignList.Cycle/)

#print "#{subject},#{session},"
bigpull.each do  |x| 
	print x.strip + ","
end 
print "\n"
print "\n"

