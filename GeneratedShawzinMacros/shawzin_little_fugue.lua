--shawzin_little_fugue.lua
--"The Shawzin is my new favorite part of Warframe"

_G.G6_Held = false
n = 350  -- Base duration of an eight note
current_segment = 0  -- Segment of the piece to play on next special-button click

x = "x"
y = "y"
up = "up"
down = "down"
left = "left"--cool
right = "right"

function OnEvent(event, arg)
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 6 and _G.G6_Held) then  -- Do the automation
        _G.G6_Held = false
        OutputLogMessage("G6_Held is"..tostring(_G.G6_Held).."\n")

        if (IsModifierPressed("lshift")) then  -- Hold lshift to definitely start at beginning
            current_segment = 0
        elseif (IsModifierPressed("lctrl")) then  -- Hold control to start [elsewhere](2)
            current_segment = 1
        -- elseif (IsModifierPressed("rshift")) then  -- (3)
        --     current_segment = 2
        end

        if (IsModifierPressed("rctrl")) then  -- Allow user to queue next segment in advance and stay in time
            Sleep(n/2)  -- Wait for duration of one 16th note
        end

        if (current_segment == 0) then
            play_1()
        elseif (current_segment == 1) then
            play_2()
        elseif (current_segment == 2) then
            play_3()
        else  -- If past last segment
            current_segment = 0
            play_1()
        end

        Sleep(3)
        current_segment = current_segment + 1
        ReleaseKey("x", "y", "up", "down", "left", "right", "1", "2", "3")
        for i = 1, 3, 1 do
            ReleaseMouseButton(i)
            Sleep(5)
        end
        OutputLogMessage("Done\n")

    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 6 and not(_G.G6_Held)) then
        _G.G6_Held = true
        OutputLogMessage("G6_Held is"..tostring(_G.G6_Held).."\n")

    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 8) then -- For testing
        test()
    end
end


function log_time()
    OutputLogMessage("This script has been running for: %d ms\n", GetRunningTime())
end


function test()
    for i = 0, 20, 1 do
        PressAndReleaseKey("1")
        Sleep(100)
    end
end


function tabn(n)
    Sleep(2)
    for i = 1, n, 1 do  -- Tab n times, waiting 2ms in between
        PressAndReleaseKey("tab")
        Sleep(2)
    end
end


function qtabn(n)  -- Quick version
    Sleep(1)
    for i = 1, n, 1 do
        PressAndReleaseKey("tab")
        Sleep(1)
    end
end


function switch_mouse(from, to)
    ReleaseMouseButton(from)
    if to > 0 then
        PressMouseButton(to)
    end
end


-- BWV 578 mm 1-5
function play_1()
    -- 1st Measure
    PressMouseButton(2)
    Sleep(1)
    PressAndReleaseKey("2")
    Sleep(5)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(2*n-5)
    PressAndReleaseKey("3")
    Sleep(5)
    Sleep(2*n-5)
    PressAndReleaseKey("1")
    Sleep(5)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(3*n-5)
    PressAndReleaseKey("3")
    Sleep(n)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n-2)
    PressAndReleaseKey("1")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n-2)
    PressAndReleaseKey("3")
    Sleep(n)
    PressAndReleaseKey("2")
    for i = 0, 6, 1 do  -- Tab over to Major Scale for Leading Tone
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n-14)
    PressAndReleaseKey("1")
    PressAndReleaseKey("tab")  -- Tab back to Minor Scale
    Sleep(n)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(1)
    Sleep(n-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(1)
    -- End of 2nd Measure

    -- 3rd Measure
    PressMouseButton(2)
    Sleep(2*n-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(1)
    Sleep(n-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(1)
    PressMouseButton(2)
    Sleep(n-2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(1)
    Sleep(n-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(1)
    PressMouseButton(3)
    Sleep(n-2)
    PressAndReleaseKey("1")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(1)
    Sleep(n-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(1)
    -- End of 3rd Measure
    -- 4th Measure
    PressMouseButton(2)
    Sleep(n-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(1)
    Sleep(n-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(1)
    PressMouseButton(2)
    Sleep(n/2-2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(1)
    Sleep(n-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(1)
    PressMouseButton(2)
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n/2-2)
    PressAndReleaseKey("1")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(1)
    Sleep(n/2-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(1)
    PressMouseButton(3)
    Sleep(n/2-2)
    PressAndReleaseKey("1")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    -- End of 4th Measure

    -- 5th Measure
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(2)

    PressMouseButton(1)
    Sleep(n-2)
    PressAndReleaseKey("1")
    Sleep(n)
    PressAndReleaseKey("2")
    Sleep(1)
    ReleaseMouseButton(1)
    Sleep(1)
    PressAndReleaseKey("2")
    Sleep(2*n-2)
    PressAndReleaseKey("1")
end


-- BWV 578 mm 5-8
function play_2()
    -- 1st Measure
    PressMouseButton(3)
    Sleep(1)
    PressAndReleaseKey("1")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n/2-2)
    PressAndReleaseKey("1")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    for i = 0, 6, 1 do  -- Tab over to Major Scale for Leading Tone
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-14)
    PressAndReleaseKey("1")
    PressAndReleaseKey("tab")  -- Tab back to Minor Scale
    Sleep(n/2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(1)
    Sleep(n/2-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(1)
    PressMouseButton(2)
    Sleep(n/2-2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n/2-2)
    PressAndReleaseKey("1")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    PressAndReleaseKey("tab")  -- tab once to get natural 6th 8va from Hirajoshi
    Sleep(n/2)
    PressAndReleaseKey("1")
    -- End of 1st Measure

    -- 2nd Measure
    PressAndReleaseKey("tab")  -- tab twice to get subtonic 8va from Minor Pentatonic
    PressAndReleaseKey("tab")
    Sleep(n/2)
    PressAndReleaseKey("1")
    for i = 0, 5, 1 do  -- Tab 6x back to Hirajoshi
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-12)
    PressAndReleaseKey("1")
    for i = 0, 6, 1 do  -- Tab 7x back to Cm
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-14)
    PressAndReleaseKey("3")
    for i = 0, 2, 1 do  -- Tab 3x to m Pentationic
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-6)
    PressAndReleaseKey("1")
    for i = 0, 5, 1 do  -- Tab 6x back to Hirajoshi
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-12)
    PressAndReleaseKey("1")
    for i = 0, 6, 1 do  -- Tab 7x back to Cm
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-14)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    PressAndReleaseKey("tab")  -- Tab once to Hirajoshi for F# (Dominant's LT)
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n/2-2)
    PressAndReleaseKey("1")
    for i = 0, 6, 1 do  -- Tab 7x back to Cm
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-14)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n-2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n-2)
    PressAndReleaseKey("3")
    Sleep(2)
    PressAndReleaseKey("tab")  -- Tab once to Hirajoshi for M 6th
    Sleep(n-2)
    PressAndReleaseKey("1")
    -- End of 2nd Measure

    -- 3rd Measure
    for i = 0, 1, 1 do  -- Tab twice to get 8va subtonic + tonic from m Pentatonic
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n-4)
    PressAndReleaseKey("1")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("1")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    for i = 0, 2, 1 do  -- Trill (3 iterations)
        PressAndReleaseKey("1")
        Sleep(n/6)
        PressAndReleaseKey("2")
        Sleep(n/6)
    end
    Sleep(n/2)  -- Make up time from trill
    PressAndReleaseKey("1")
    Sleep(n/4)
    PressAndReleaseKey("2")
    Sleep(2)
    PressAndReleaseKey("tab")  -- Tab once to get D (supertonic) + tonic from Maj Pentatonic
    Sleep(n/4-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    tabn(7)  -- Tab to min Pentatonic for Eb (m 3rd/mediant)
    Sleep(n/2-16)
    PressAndReleaseKey("3")
    Sleep(2)
    PressAndReleaseKey("tab")  -- Tab right back to Maj Pentatonic for D+C
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    tabn(7)  -- Get 8va subtonic from min Pentatonic
    Sleep(n/2-16)
    PressAndReleaseKey("1")
    tabn(6)  -- Get M 6th/mediant from Hirajoshi
    Sleep(n/2-14)
    PressAndReleaseKey("1")
    -- End of 3rd Measure
    
    -- 4th Measure
    tabn(2)  -- Get Bb (subtonic) from min Pentatonic
    Sleep(n/2-6)
    PressAndReleaseKey("1")
    Sleep(2)
    PressAndReleaseKey("tab")  -- Get C/D tonic/supertonic from Maj Pentatonic
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    tabn(5)  -- Get F# (Dominant's LT) from Hirajoshi
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n/2-12)
    PressAndReleaseKey("3")
    tabn(3)  -- Get C/D tonic/supertonic from Maj Pentatonic
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n/2-8)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    tabn(4)  -- Get G Dominant from C min
    Sleep(n/2-10)
    PressAndReleaseKey("3")
    tabn(4)  -- Get C/D tonic/supertonic from Maj Pentatonic
    Sleep(n/2-6)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    tabn(5)  -- Get F# (Dominant's LT) from Hirajoshi
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n/2-12)
    PressAndReleaseKey("3")
    tabn(3)  -- Get C/D tonic/supertonic from Maj Pentatonic
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n/2-8)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    --End of 4th Measure

    --5th Measure

    ReleaseMouseButton(3)

    -- While testing: tab back to Cm
    tabn(4)
end


-- BWV 578 mm 5-8 *with bass*
function play_3()
    -- 1st Measure (same as without bass)
    PressMouseButton(3)
    Sleep(1)
    PressAndReleaseKey("1")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n/2-2)
    PressAndReleaseKey("1")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    for i = 0, 6, 1 do  -- Tab over to Major Scale for Leading Tone
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-14)
    PressAndReleaseKey("1")
    PressAndReleaseKey("tab")  -- Tab back to Minor Scale
    Sleep(n/2)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(1)
    Sleep(n/2-2)
    PressAndReleaseKey("2")
    Sleep(2)
    ReleaseMouseButton(1)
    PressMouseButton(2)
    Sleep(n/2-2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n/2-2)
    PressAndReleaseKey("1")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    PressAndReleaseKey("tab")  -- tab once to get natural 6th 8va from Hirajoshi
    Sleep(n/2)
    PressAndReleaseKey("1")
    -- End of 1st Measure

    -- 2nd Measure
    PressAndReleaseKey("tab")  -- tab twice to get subtonic 8va from Minor Pentatonic
    PressAndReleaseKey("tab")
    Sleep(n/2)
    PressAndReleaseKey("1")

    qtabn(5)  -- Get G Dominant from Cm
    ReleaseMouseButton(3)
    PressMouseButton(1)
    Sleep(1)
    PressAndReleaseKey("2")  -- Bass
    qtabn(1)  -- Tab on to Hirajoshi
    ReleaseMouseButton(1)
    PressMouseButton(3)

    Sleep(n/2-10)
    PressAndReleaseKey("2")
    Sleep(n/2-12)
    PressAndReleaseKey("1")
    for i = 0, 6, 1 do  -- Tab 7x back to Cm
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-14)
    PressAndReleaseKey("3")
    for i = 0, 2, 1 do  -- Tab 3x to m Pentationic
        PressAndReleaseKey("tab")
        Sleep(2)
    end
    Sleep(n/2-6)
    PressAndReleaseKey("1")

    qtabn(5)  -- Get D V/V from Cm
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(1)
    PressAndReleaseKey("3")  -- Bass
    qtabn(1)  -- Tab on to Hirajoshi
    ReleaseMouseButton(2)
    PressMouseButton(3)

    Sleep(n/2-10)
    PressAndReleaseKey("1")
    tabn(7)  -- Tab 7x back to Cm
    Sleep(n/2-16)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    PressAndReleaseKey("tab")  -- Tab once to Hirajoshi for F# (Dominant's LT)
    Sleep(n/2-2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n/2-2)
    PressAndReleaseKey("1")

    qtabn(7)  -- Get Bb iii/V from Cm
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(1)
    PressAndReleaseKey("1")  -- Bass
    ReleaseMouseButton(2)
    PressMouseButton(3)
    
    Sleep(n/2-10)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n-2)
    PressAndReleaseKey("3")
    Sleep(2)
    ReleaseMouseButton(2)
    PressMouseButton(3)
    Sleep(n-2)
    PressAndReleaseKey("3")
    Sleep(2)
    PressAndReleaseKey("tab")  -- Tab once to Hirajoshi for M 6th
    Sleep(n-2)
    PressAndReleaseKey("1")

    qtabn(3)  -- Get A (non 8va M6th) from Maj Pentatonic
    ReleaseMouseButton(3)
    PressMouseButton(1)
    Sleep(1)
    PressAndReleaseKey("2")  -- Bass
    -- End of 2nd Measure

    -- 3rd Measure
    tabn(4)  -- Get G V from Cm
    Sleep(n-15)
    PressAndReleaseKey("2")  -- Bass
    ReleaseMouseButton(1)
    PressMouseButton(3)

    qtabn(3)  -- Get 8va subtonic + tonic from m Pentatonic
    Sleep(1)
    PressAndReleaseKey("1")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("1")

    qtabn(5)  -- Get Bb from cm
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(1)
    PressAndReleaseKey("1")  -- Bass
    tabn(3)  -- Return to min Pentatonic for upper voice
    ReleaseMouseButton(2)
    PressMouseButton(3)

    Sleep(n/2-15)
    PressAndReleaseKey("2")

    tabn(1)  -- Get A (8vb) from Maj Pentatonic
    ReleaseMouseButton(3)
    PressMouseButton(1)
    Sleep(n/2-4)
    PressAndReleaseKey("2") -- Bass
    qtabn(7)  -- Return to min Pentatonic for upper voice's trill  
    ReleaseMouseButton(1)
    PressMouseButton(3)
    Sleep(1)  

    for i = 0, 2, 1 do  -- Trill (3 iterations)
        PressAndReleaseKey("1")
        Sleep(n/6)
        PressAndReleaseKey("2")
        Sleep(n/6)
    end

    qtabn(4)  -- Get G V from Cm
    ReleaseMouseButton(3)
    PressMouseButton(1)
    Sleep(1)
    PressAndReleaseKey("2")  -- Bass
    tabn(4)  -- Return to min Pentatonic for upper voice's 32nd notes
    ReleaseMouseButton(1)
    PressMouseButton(3)

    Sleep(n/2-16)  -- Make up time from trill
    PressAndReleaseKey("1")
    Sleep(n/4)
    PressAndReleaseKey("2")
    Sleep(2)
    PressAndReleaseKey("tab")  -- Tab once to get D (supertonic) + tonic from Maj Pentatonic
    Sleep(n/4-2)
    PressAndReleaseKey("3")

    qtabn(2)  -- Get F# (non 8va) from Hexatonic
    ReleaseMouseButton(3)
    PressMouseButton(1)
    Sleep(1)
    PressAndReleaseKey("1")  -- Bass
    tabn(6)  -- Return to Maj Pentatonic for upper voice's 16th notes
    ReleaseMouseButton(1)
    PressMouseButton(3)

    Sleep(n/2-18)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")

    Sleep(1)  -- Already in Maj Pentatonic for A (non 8va)
    ReleaseMouseButton(3)
    PressMouseButton(1)
    Sleep(1)
    PressAndReleaseKey("2")  -- Bass
    Sleep(1)
    ReleaseMouseButton(1)
    PressMouseButton(3)

    tabn(7)  -- Tab to min Pentatonic for Eb (m 3rd/mediant)
    Sleep(n/2-20)
    PressAndReleaseKey("3")

    tabn(5)  -- Get D V/V from Cm
    ReleaseMouseButton(3)
    PressMouseButton(2)
    Sleep(n/2-12)
    PressAndReleaseKey("3")  -- Bass
    qtabn(4)  -- Go to Maj Pentatonic for upper voice's D+C
    ReleaseMouseButton(2)
    PressMouseButton(3)

    Sleep(1)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    tabn(7)  -- Get 8va subtonic from min Pentatonic
    Sleep(n/2-16)
    PressAndReleaseKey("1")
    tabn(6)  -- Get M 6th/mediant from Hirajoshi
    Sleep(n/2-14)
    PressAndReleaseKey("1")
    -- End of 3rd Measure
    
    -- 4th Measure
    tabn(2)  -- Get Bb (subtonic) from min Pentatonic (+G V Bass)
    Sleep(n/2-6)
    PressAndReleaseKey("1")

    Sleep(1)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  -- Bass G V
    Sleep(1)
    switch_mouse(1, 3)

    PressAndReleaseKey("tab")  -- Get C/D tonic/supertonic from Maj Pentatonic (+D non 8va Bass)
    Sleep(n/2-3)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")

    Sleep(1)
    switch_mouse(3, 2)
    Sleep(1)
    PressAndReleaseKey("1")  -- Bass D V/V
    Sleep(1)
    switch_mouse(2, 3)

    Sleep(n/2-3)
    PressAndReleaseKey("3")
    tabn(5)  -- Get F# (Dominant's LT) from Hirajoshi
    switch_mouse(3, 2)
    Sleep(n/2-12)
    PressAndReleaseKey("3")

    qtabn(3)  -- Get A from Maj Pentatonic
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("2")  -- Bass A M6th non 8va
    Sleep(1)
    switch_mouse(1, 3)

    Sleep(n/2-6)  -- Stay in Maj Pentatonic for upper C/D tonic/supertonic
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    tabn(4)  -- Get G Dominant from C min
    Sleep(n/2-10)
    PressAndReleaseKey("3")
    tabn(4)  -- Get C/D tonic/supertonic from Maj Pentatonic
    Sleep(n/2-6)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    tabn(5)  -- Get F# (Dominant's LT) from Hirajoshi
    switch_mouse(3, 2)
    Sleep(n/2-12)
    PressAndReleaseKey("3")
    tabn(3)  -- Get C/D tonic/supertonic from Maj Pentatonic
    switch_mouse(2, 3)
    Sleep(n/2-8)
    PressAndReleaseKey("3")
    Sleep(n/2)
    PressAndReleaseKey("2")
    Sleep(n/2)
    PressAndReleaseKey("3")
    --End of 4th Measure

    --5th Measure

    ReleaseMouseButton(3)

    -- While testing: tab back to Cm
    tabn(4)
end
