# shawzinLuaGenAccessories.py
# by Matthew Sweeney
# 4/29/2020
# 
# Module to add functionality to my shawzin macro generator
# Specifically, I want to optionally accept mxl as input instead


import tkinter as tk
from tkinter.filedialog import askopenfilename

from music21 import pitch, note, chord, converter

from shawzinLuaGenerator import generate_lua, piece_to_perform


class GuiMenuBar(tk.Menu):
    def __init__(self, parent):
        super().__init__(parent, tearoff=0)
        self.ftypes = (("MIDI Files", ".mid"), ("MIDI Files", ".midi"),
            ("MusicXML Files", ".mxl"), ("MusicXML Files", ".musicxml"),
            ("LilyPond Files", ".ly"), ("LilyPond Files", ".ily"),
            ("All Files", ""))

        # File dropdown
        fileMenu = tk.Menu(self, tearoff=0)
        # add the Import option the the File dropdown menu
        fileMenu.add_command(label="Import", command=self.browse_import_file, accelerator="Ctrl+I")
        # add the bind "Ctrl+I" to import a file
        parent.bind_all("<Control-i>", self.browse_import_file)
        # TODO add option to import from URL
        fileMenu.add_command(label="Import from URL", command=None)
        # add the File dropdown menu to the whole menubar
        self.add_cascade(label="File", menu=fileMenu)

        # Help dropdown
        helpMenu = tk.Menu(self, tearoff=0)
        helpMenu.add_command(label="Coming Soon™")
        # add the Help dropdown to the menubar
        self.add_cascade(label="Help", menu=helpMenu)

        # apply the whole menubar to the tk root object
        parent.config(menu=self)

    def browse_import_file(self, *args):
        """ Allow the user browse for a music file to be converted to a macro
        """
        # browse to select file and get its path
        filename = askopenfilename(title="Select a File to Import", filetypes=self.ftypes)
        print(f"Importing file: {filename}")
        self.parse_import(filename)

    def ask_import_url(self):
        """ Allow the user to enter a URL from which to import a piece
        """
        # get the URL from the user
        url = None
        self.parse_import(url)

    def parse_import(self, src: str):
        """ Attempt to parse the given source as input to be
            converted to a shawzin macro.\n
            Accepts raw string data, filename, or URL, etc.
        """
        # use midi parser to load MIDI content from the selected file
        try:
            pieceStream = converter.parse(src)
        except IndexError:
            print("Error: no valid file was selected for import")
            return
        
        imported_piece = []
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
                # TODO `waittime/5` should just be `waittime` or configurable per-piece or something
                imported_piece.append((waittime/5, (element.pitch,)))
                # advance time to this note for the next note
                time_pos = element.offset

            # if the element is a m21 Chord object
            elif isinstance(element, chord.Chord):
                # find the wait time since last note/chord/the beginning
                waittime = element.offset - time_pos
                # add each note's pitch to the piece list
                imported_piece.append((waittime/5, element.pitches))
                # advance time to this chord for next note/chord
                time_pos = element.offset

        # generate a lua script to copy/paste with Logitech G-Suite
        generate_lua(imported_piece)
