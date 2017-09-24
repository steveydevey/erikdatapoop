#!/usr/bin/env ruby

#print ARGV[0]

# loop across this to append to csv to get all the forward files, but for now, one file
workingfile = ARGV[0]

# only if this is a real file, do the needful
if File.file?(workingfile) 

  # Search the files for 'subject or session' then grab the first result, then split that result down the last word (the number)
  subject = File.open(workingfile).grep(/Subject:/).first.split.last
  session = File.open(workingfile).grep(/Session:/).first.split.last
  
  # set the subject/session info at the beginning of the row
  datarecord = "#{subject},#{session},"

  # search through the file for any possible values we may want and create an array of all of it
  #bigpull = File.open(workingfile).grep(/Trials.Sample:|Score:|Image.RT:/)
  
  # loop to clean whitespace from ALL the strings in the array (even strings we don't want)
  #bigpull.each do  |x| 
  #	x = x.strip!  # the ! permanently writes back to the array instead of the temporary values
  #end 
  #
  #bigpull.each do |x| 
  ## skip the entries that say "TrialProc" etc, because they don't actually contain data
  #  unless x =~ /Trials/ 
  #    # append data to the end of this record, separated by commas
  #    datarecord += "#{x.split.last},"
  #  end
  #end 

  # loop through file and make an array for all of the things we want
  responses = Hash.new
  responses['First'] = []
  responses['Second'] = []
  responses['Third'] = []
  responses['Fourth'] = []
  responses['Fifth'] = []
  responses['Sixth'] = []
  responses['Seventh'] = []
  responses['Eight'] = []
  responses['KeyPress1RT'] = []
  responses['KeyPress1RESP'] = []
  responses['KeyPress2RT'] = []
  responses['KeyPress2RESP'] = []
  responses['KeyPress3RT'] = []
  responses['KeyPress3RESP'] = []
  responses['KeyPress4RT'] = []
  responses['KeyPress4RESP'] = []
  responses['KeyPress5RT'] = []
  responses['KeyPress5RESP'] = []
  responses['KeyPress6RT'] = []
  responses['KeyPress6RESP'] = []
  responses['KeyPress7RT'] = []
  responses['KeyPress7RESP'] = []
  responses['KeyPress8RT'] = []
  responses['KeyPress8RESP'] = []

   responses.each do |item|
	#useritems[item] = File.open(workingfile).grep(/#{item}/)
	   type = item.first
	print "#{item}\n"
	print "#{type}\n"
	responses[type] = File.open(workingfile).grep(/#{type}/)
	#print responses[type]
	for 
	responses[item].each do |x|
		x = x.split.last
		print "#{x}\n"
	end
	#print File.open(workingfile).grep(/#{item}/).first.split.last
	print "\n"
   end

   print "#{first}\n"
      
  # add a newline at the end of this record, so the next won't have to know to do it
  #datarecord += "\n"
  
  #puts datarecord
  #File.open('forward_ruby_out.csv', 'a') {|f| f.write(datarecord) }

end
