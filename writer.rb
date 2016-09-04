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

# github contribution summary is 54ish wide
# each character is 4x5 (with 1px gap at right) so 13 character max depending
# on starting offset
width = 52
lines = 7
# where to start the message in the array in for form [y,x]
offset = [1,5]

message = "YO! :o) 123"
# if Array.new uses (lines, Array.new...) then same object is used for each line
# which means a change to one line = a change to them all. Instead use block
# variant so different objects are used
output = Array.new(lines) { Array.new(width, 0) }

def add_character(character, output, offset)
    # output = output array
    # character = character array
    # offset = offset in form [ y offset, x offset ] e.g. [1,2]
    # TODO can this be done with a map + reduce instead?
    for n in (0..character.size-1) do
        # for every block in the line
        for m in (0..character[0].size-1)
            # add to output
            output[n + offset[0]][m + offset[1]] = character[n][m]
        end
    end
    return output
end

def output_to_dates(output)
    # this would've been easier had I done arrays of columns rather than lines,
    # but here's goes nothing...

    # assume top left of output = last occurring Sunday - 1 year
    # so that date is...
    date = Date.today
    while ! date.sunday?
        date -= 1
    end
    date -= 364

    y = output.size
    x = output[0].size

    dates = Hash.new

    for n in (0..x-1)
        for m in (0..y-1)
            val = output[m][n]
            if val > 0
                dates[date] = val
            end
            date += 1
        end
    end

    return dates
end

message.scan(/./).each do |character|
    case character
    when /[A-Z]/
        character_array = eval(character)
    when /[0-9]/
        character_array = eval("N_#{character}")
    when ':'
        character_array = COL
    when ';'
        character_array = SCOL
    when '!'
        character_array = BANG
    when '('
        character_array = LBRA
    when ')'
        character_array = RBRA
    when '|'
        character_array = BAR
    when '='
        character_array = EQL
    when '+'
        character_array = PLUS
    when '-'
        character_array = MIN
    when 'o'
        character_array = SMO
    when '?'
        character_array = QU
    else # if the character isn't recognised it'll put a space
        character_array = SPACE
    end
    output = add_character(character_array, output, offset)
    offset[1] += 4
end

dates = output_to_dates(output)

# print output
output.each do |line|
    line.each do |val|
        #TODO make print actually representative (maybe HTML?)
        print val == 1 ? "■" : "□"
    end
    print "\n"
end
