#!/usr/bin/env ruby

# take in desired message
#
# What date should this start from?

# make sure it's within some limits. Length, check characters

# check the repo this will generate commits on
# -> you should copy this script to a test repo you don't care about

# check the darkest square (possible through github API?) and use that as the
# desired contribution limit per square

# parse those characters from the array set

# work out co-ordinates to date (also taking into account offset)

# "this is what your message will look like, is this OK?"

# commit the shift out of that date

# inputs:
# - message
# - date to take as "top left"
# - github credentials (optional, use API to make sure dates with contributions
#   are accounted for, and to get max contribution count)

# are Sundays always on top for the contribution summary?

# character constants
load 'characters.rb'

width = 10
lines = 5

# if Array.new uses (lines, Array.new...) then same object is used for each line
# which means a change to one line = a change to them all. Instead use block
# variant so different objects are used
output = Array.new(lines) { Array.new(width, 0) }

# TODO wrap this in function and add offset to output
# for every line of the character
for n in (0..A.size-1) do
    # for every block in the line
    for m in (0..A[0].size-1)
        # add to output
        output[n][m] = A[n][m]
    end
end

output.each do |line|
    line.each do |val|
        #TODO make print actually representative (maybe HTML?)
        print val == 1 ? "■" : "□"
    end
    print "\n"
end
