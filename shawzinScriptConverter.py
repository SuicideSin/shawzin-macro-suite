"""
shawzinScriptConverter.py
by Matthew Sweeney
11/17/2019

A script to convert lua scripts for playing shawzin macros in Warframe
DE changed the shawzin scales, breaking contemporary shawzin bots/macros
This script aims to convert old macros to work with the new scale setup

Input: a lua script through stdin
"""

from sys import stdin

curr_scale = 0
output = ""


# I can make this elegent later
blank_lines = 0
while True:
    line = stdin.readline()  # process each line in the lua file
    print(line)
    if not line:  # end when no lines left
        blank_lines += 1
        if blank_lines > 4:
            break
        else:
            continue

    if line[:10] == "    qtabn(":  # if tab is used to cycle the scale
        curr_scale += int(line[10])  # track scale progress
        if curr_scale >= 8:  # when the cript reaches the Yo scale
            # (Assuming no script cycles past Yo more than once at a time, which should be true)
            line = list(line)  # make into list to edit
            line[10] = str(int(line[10]) + 1)  # add 1 tab press to account for the extra scale
            line = "".join(line)  # make back into string

            curr_scale %= 8  # cycle back around to next scale

    #  add edited script to string that accumulates output
    output += line[:-1]


with open("scriptConverterOutput.lua", "w+") as f:
    f.write(output)
