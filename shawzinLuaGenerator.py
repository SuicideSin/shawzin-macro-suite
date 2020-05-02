##! /usr/bin/python3
# shawzinLuaGenerator.py
# by Matthew Sweeney
# 9/3/2019
#
# Python app to take a midi file as input and generate lua scripts
# for the Logitech G-suite macro API to play the given music
# with the shawzin emote in the game Warframe
#
# This app also has its own GUI for note entry
# I do want to optionally accept mxl input since it is persistent
#
# DE added the Yo scale and changed Pentatonic to Pentatonic Dominant
# I accomodated these updates in this app 11/17/2019


import tkinter as tk

from music21 import pitch, scale

from shawzinLuaGenAccessories import *


pentatonic_minor = tuple(pitch.Pitch(p) for p in ("c4", "e-4", "f4", "g4", "b-4", "c5", "e-5", "f5", "g5", "b-5", "c6", "e-6"))
pentatonic_major = tuple(pitch.Pitch(p) for p in ("c4", "d4", "e4", "g4", "a4", "c5", "d5", "e5", "g5", "a5", "c6", "d6"))
chromatic = tuple(pitch.Pitch(p) for p in ("c4", "c#4", "d4", "d#4", "e4", "f4", "f#4", "g4", "g#4", "a4", "a#4", "b4"))
hexatonic = tuple(pitch.Pitch(p) for p in ("c4", "e-4", "f4", "g-4", "g4", "b-4", "c5", "e-5", "f5", "g-5", "g5", "b-5"))
major = tuple(pitch.Pitch(p) for p in ("c4", "d4", "e4", "f4", "g4", "a4", "b4", "c5", "d5", "e5", "f5", "g5"))
minor = tuple(pitch.Pitch(p) for p in ("c4", "d4", "e-4", "f4", "g4", "a-4", "b-4", "c5", "d5", "e-5", "f5", "g5"))
hirajoshi = tuple(pitch.Pitch(p) for p in ("c4", "d-4", "f4", "g-4", "b-4", "c5", "d-5", "f5", "g-5", "a5", "c6", "d-6"))
phrygian = tuple(pitch.Pitch(p) for p in ("c4", "d-4", "e4", "f4", "g4", "a-4", "b-4", "c5", "d-5", "e5", "f5", "g5"))
yo_scale = tuple(pitch.Pitch(p) for p in ("d-4", "e-4", "g-4", "a-4", "b-4", "d-5", "e-5", "g-5", "a-5", "b-5", "d-6", "e-6"))

# fancier scale objects from music21
# fancy_pentatonic_minor = scale.ConcreteScale(pentatonic_minor)
# fancy_pentatonic_major = scale.ConcreteScale(pentatonic_major)
# fancy_chromatic = scale.ChromaticScale(chromatic)
# fancy_hexatonic = scale.ConcreteScale(hexatonic)
# fancy_major = scale.MajorScale(major)
# fancy_minor = scale.MinorScale(minor)
# fancy_hirajoshi = scale.ConcreteScale(hirajoshi)
# fancy_phrygian = scale.ConcreteScale(phrygian)
# fancy_yo_scale = scale.ConcreteScale(yo_scale)

# The scales you can choose from on shawzin, in the order you cycle through them
shawzin_scales = (pentatonic_minor, pentatonic_major, chromatic, hexatonic, major, minor, hirajoshi, phrygian, yo_scale)
# fancy_shawzin_scales = tuple(scale.ConcreteScale(sc) for sc in shawzin_scales)

# The pitches and wait times for the macro to play [[<waitTime>, [<pitch(es)>]], etc., ...]
# grouped by both chord and rest time until that chord is played
piece_to_perform = [[0, []]]


class GuiApp(tk.Frame):
    def __init__(self, parent):
        super().__init__(parent)
        parent.frame = self
        self.width = 740
        self.height = 600
        self.quarter_length = tk.IntVar()  # duration of a quarter note in ms
        self.init_UI()

    def init_UI(self):
        self.master.title("Logitech G-Suite Macro API Lua Script Generator for Shawzin - App GUI")
        self.master.geometry(f"{self.width}x{self.height}+{0}+{0}")
        self.master.resizable(True, False)
        self.config(width=self.width, height=self.height)
        self.grid(row=0)
        self.update_idletasks()

        # Pitch Buttons
        self.pitch_buttons = []
        for gui_column in range(3):  # for each octave of pitch buttons
            for octave_offset in range(12):  # for each pitch in that octave
                # create a button on the GUI to add that pitch to the current chord
                self.pitch_buttons.append(PitchAdderButton(self, pitch.Pitch(60 + 12*gui_column + octave_offset)))
                # and configure the button's positioning
                self.pitch_buttons[-1].grid(row=11-octave_offset, column=gui_column, columnspan=1, sticky="NW")
        # disable the buttons of pitches that are not actually playable on shawzin
        for button in self.pitch_buttons:
            if button.pitch.midi == 83 or button.pitch.midi >= 88:
                button.config(state="disabled")

        # WaitTime Buttons
        self.wait_buttons = []
        # for each rest length /2
        for i, inv_notelen in enumerate((1, 2, 4, 8, 16, 32)):
            # create a button on the GUI to add a rest of that length onto the piece
            self.wait_buttons.append(WaitAdderButton(self, inv_notelen))
            # and configure the button's positioning
            self.wait_buttons[-1].grid(row=i, column=3, columnspan=1, sticky="NE")
        # for each rest length /3
        for i, inv_notelen in enumerate((3, 6, 12, 24, 48)):
            # create a button
            self.wait_buttons.append(WaitAdderButton(self, inv_notelen))
            # configure its positioning
            self.wait_buttons[-1].grid(row=i+1, column=4, columnspan=1, sticky="NE")

        # Quarter Note Length Entry (WIP) # TODO
        self.quarter_length_entry = QuarterLengthEntry(self)
        self.quarter_length_entry.grid(row=1, column=5, columnspan=2, sticky="NE")
        self.quarter_length_entry_label = tk.Label(self)
        self.quarter_length_entry_label.config(text="Quarter Note Length", anchor="s")
        self.quarter_length_entry_label.grid(row=0, column=5, columnspan=2, sticky="SW")

        # Backspace Button
        self.backspace_button = BackspaceButton(self)  # deletes most recent chord + rest
        self.backspace_button.grid(row=3, column=5, columnspan=2, sticky="SW")

        # Generate Button
        self.generate_button = GeneratorButton(self)  # stores the piece to output file
        self.generate_button.grid(row=4, column=5, columnspan=2, sticky="SW")


class PitchAdderButton(tk.Button):
    """ a button that adds its assigned pitch to the piece's latest chord
    """
    def __init__(self, parent, _pitch: pitch.Pitch):
        super().__init__(parent)
        self.pitch = _pitch
        self.config(text=str(self.pitch),
            command=self.add_pitch_factory(self.pitch), padx=20, pady=10)

    @staticmethod
    def add_pitch_factory(_pitch: pitch.Pitch):
        """ `_pitch`: the pitch to add to the piece's latest chord
            return a function to add the specified pitch to the piece's latest chord
        """
        def add_pitch():
            try:
                # append a pitch to the pitch-list in the last [wait, [pitches]] element of the piece
                piece_to_perform[-1][1].append(_pitch)
            except IndexError:
                # if the piece_to_perform list is empty
                print("Add a wait duration first")
            else:
                # print to the console the pitch that was just added
                print(str(_pitch))

        return add_pitch


class WaitAdderButton(tk.Button):
    """ a button that adds its assigned wait/rest onto piece
    """
    def __init__(self, parent, _inv_duration: int):
        super().__init__(parent)
        self.inv_duration = _inv_duration
        self.config(text=f"1/{_inv_duration}",
            command=self.add_wait_factory(self.inv_duration), padx=20, pady=10)

    @staticmethod
    def add_wait_factory(inv_notelength: int):
        """ `inv_notelength`: inverse of notelength to wait for (e.g. `8` for 1/8 note)
            return a function that adds the specified rest time to the piece
        """
        def add_wait():
            # Make a new entry with the specified rest length before its chord, which starts empty
            piece_to_perform.append([1 / inv_notelength, []])
            # print to the console the length of the rest that was just added
            print(f"1/{inv_notelength} rest")

        return add_wait


class BackspaceButton(tk.Button):
    """ A button that deletes the piece's latest [wait, [<pitches>]] element
        so you don't have to start all over if you make a small mistake using the GUI.
        never again
    """
    def __init__(self, parent):
        super().__init__(parent)
        self.config(text="Backspace", command=self.backspace, padx=20, pady=10)
    
    def backspace(self):
        try:
            deleted = piece_to_perform.pop()
        except IndexError:
            print("There is nothing left to be deleted")
        else:
            print(f"Deleted {deleted}")


class GeneratorButton(tk.Button):
    """ A button that generates a lua script based on the current piece of music
    """
    def __init__(self, parent):
        super().__init__(parent)
        self.config(text="Generate Lua Macro", command=generate_lua)



class QuarterLengthEntry(tk.Entry):
    def __init__(self, master):
        super().__init__(master)
        self.config(textvariable=self.master.quarter_length)


def write_note(f, note, current_scale, current_mouse):
    """ Add instructions for playing pitch `note` to lua script file `f`\n
        starting from shawzin_scales[`current_scale`] with mouse button `current_mouse` pressed\n
        returns new scale and new mouse fingering (scale, mouse)
    """
    # Find nearest fingering to play this pitch
    for i in range(len(shawzin_scales)):  # For each scale
        scale_index = (i + current_scale) % len(shawzin_scales)
        for step_index, step_pitch in enumerate(shawzin_scales[scale_index]):  # For each step
            if step_pitch.midi == note.midi:  # If this is the desired pitch
                # Determine tab action, take action if necessary
                # (pressing tab iterates the selected scale in Warfarme)
                tab_difference = (scale_index - current_scale) % len(shawzin_scales)
                if tab_difference:
                    f.write(f"    qtabn({tab_difference})\n")  # Tab to the pitch's scale

                # Determine mouse action, take action if necessary
                # (pressing mouse buttons changes the shawzin's selected fret in Warframe)
                new_mouse = (step_index) // 3
                if new_mouse != current_mouse:
                    f.write(f"    switch_mouse({current_mouse}, {new_mouse})\n")

                # Press/release the pitch's key
                # (pressing these keys plays notes on the shawzin in Warframe)
                key_to_press = (step_index % 3) + 1
                f.write(f"    Sleep(1)\n    PressAndReleaseKey(\"{key_to_press}\")  --{str(step_pitch)}\n    Sleep(1)\n")
                return (scale_index, new_mouse)
    # if execution reaches here, the note requested is not playable on shawzin


def generate_lua(piece: list = piece_to_perform):
    print("Generating Lue macro")
    filename = "luaGeneratorOutput.lua"  # file to write the lua script to
    quarterlen = 2700  # ms duration of 1/4 note, will come from GUI in future  # TODO
                        # currently is actually duration of 1 measure/whole note, not 1/4 note

    with open(filename, 'w') as f:
        # Start file with header, generic event-handling function, and utility functions
        f.write(f"""--{filename}\n--Generated by Matthew Sweeney's generator for shawzin Logitech macros\n
n={quarterlen}\n
function OnEvent(event, arg)
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 6) then
        play1()
        Sleep(5)
        ReleaseKey("x", "y", "up", "down", "left", "right", "1", "2", "3")
        for i = 1, 3, 1 do
            ReleaseMouseButton(i)
            Sleep(5)
        end
        OutputLogMessage("Done\\n")
    end
end\n
function tabn(_n)
    Sleep(2)
    for i = 1, _n, 1 do  -- Tab n times, waiting 2ms in between
        PressAndReleaseKey("tab")
        Sleep(2)
    end
end\n
function qtabn(_n)  -- Quick version
    Sleep(1)
    for i = 1, _n, 1 do
        PressAndReleaseKey("tab")
        Sleep(1)
    end
end\n
function switch_mouse(from, to)
    if from > 0 then
        ReleaseMouseButton(from)
    end
    if to > 0 then
        PressMouseButton(to)
    end
end\n
function play1()\n""")

        # Add in the instructions on how to play the piece
        current_scale = 0  # starts on scale #0 - pentatonic minor
        current_mouse = 0  # assume no mouse button is held initially
        for chord in piece:
            f.write(f"    Sleep({chord[0]}*n)\n")
            for note in chord[1]:  # For each pitch to be played between waiting
                try:
                    # write the note and get back the new current scale and mouse button
                    current_scale, current_mouse = write_note(f, note, current_scale, current_mouse)
                except:
                    # if there is a problem e.g. the note is not playable on shawzin
                    pass
                    # for now:
                    # just ignore that note, don't write it

        # At the end of the piece tab back to Minor Pentatonic, reset mouse
        tab_difference = (0 - current_scale) % len(shawzin_scales)
        f.write(f"    qtabn({tab_difference})\n    switch_mouse({current_mouse}, 0)\n    Sleep(1)\n")

        # Close the lua function
        f.write("end")
    print(f"Successfully saved macro to {filename}")


def main():
    # set up the Tkinter GUI
    root = tk.Tk()
    app = GuiApp(root)
    menuBar = GuiMenuBar(root)
    root.mainloop()

if __name__ == '__main__':
    main()
