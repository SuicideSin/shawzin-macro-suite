# shawzinLuaGenAccessories.py
# by Matthew Sweeney
# 4/29/2020
# 
# Module to add functionality to my shawzin macro generator
# Specifically, I want to optionally accept mxl as input instead


import tkinter as tk
from tkinter.filedialog import askopenfilename

from music21 import pitch, note, chord, converter
# import midi

from shawzinLuaGenerator import generate_lua


class GuiMenuBar(tk.Menu):
    def __init__(self, parent):
        tk.Menu.__init__(self, parent, tearoff=0)

        # File dropdown
        fileMenu = tk.Menu(self, tearoff=0)
        # Import submenu
        importMenu = tk.Menu(fileMenu, tearoff=0)
        # add the MIDI option the the Import submenu
        importMenu.add_command(label="MIDI File", command=self.import_midi)
        # add Import submenu to the File dropdown
        fileMenu.add_cascade(label="Import", menu=importMenu)

        # add the File dropdown menu to the whole menubar
        self.add_cascade(label="File", menu=fileMenu)

        # apply the whole menubar to the tk root object
        parent.config(menu=self)

    @staticmethod
    def import_midi():
        """ Allow the user import a MIDI file to be converted to a macro
        """
        # browse to select file and get its path
        ftypes = (("MIDI files", ".mid"), ("MIDI files", ".midi"), ("All files", ".*"))
        filename = askopenfilename(title="Select A File", filetypes=ftypes)
        print(f"Importing MIDI: {filename}")

        # use midi parser to load MIDI content from the selected file
        pieceStream = converter.parseFile(filename)
        # print(piece.flat.show("text"))
        
        piece_list = []
        # current offset from beginning as we parse through the stream
        # `offset` in the stream is absolute; I want to find relative offsets for now
        time_pos = 0

        # for each thing in the m21 stream object
        for element in pieceStream.flat:
            # figure out if we care about it
            # (It can have like rests, clefs, key sig, style markings, etc.)
            # TODO care about finer points later on e.g. tempo, maybe dynamics
            # if that thing is a m21 Note object
            if isinstance(element, note.Note):
                # find the wait/rest length since last note (or beginning)
                waittime = element.offset - time_pos
                # add to the piece in similar mannr to how the button GUI does it
                piece_list.append((waittime/5, (element.pitch,)))
                # advance time to this note for the next note
                time_pos = element.offset

            # if the element is a m21 Chord object
            elif isinstance(element, chord.Chord):
                # find the wait time since last note/chord/the beginning
                waittime = element.offset - time_pos
                # add each note's pitch to the piece list
                piece_list.append((waittime/5, element.pitches))
                # advance time to this chord for next note/chord
                time_pos = element.offset

        # generate a lua script to copy/paste with Logitech G-Suite
        print(piece_list)
        print("generating lua")
        generate_lua(piece_list)
