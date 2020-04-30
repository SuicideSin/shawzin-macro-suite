
_G.G6_Held = false
old_n = 350  -- Base duration of an eight note
n = 2650  -- New duration of measure
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

        if (IsModifierPressed("lshift")) then  -- Hold lshift to start lshift sequence
            current_segment = 0
        elseif (IsModifierPressed("lctrl")) then  -- Hold control to start lctrl sequence
            current_segment = 3
        elseif (IsModifierPressed("rshift")) then  -- Hold rshift to start rshift sequence
            current_segment = 6
        elseif (IsModifierPressed("rctrl")) then  -- rctrl
            current_segment = 9
        end

        -- if (IsModifierPressed("rctrl")) then  -- Allow user to queue next segment in advance and stay in time
        --     Sleep(n/2)  -- Wait for duration of one 16th note
        -- end

        if (current_segment == 0) then
            play_lshift_1()
        elseif (current_segment == 1) then
            play_lshift_2()

        elseif (current_segment == 3) then
            play_lctrl_1()
        elseif (current_segment == 4) then
            play_lctrl_2()
        elseif (current_segment == 5) then
            play_lctrl_3()

        elseif (current_segment == 6) then
            play_rshift_1()
        elseif (current_segment == 7) then
            play_rshift_2()

        elseif (current_segment == 9) then
            play_rctrl_1()
        elseif (current_segment == 10) then
            play_rctrl_2()

        else  -- If past last segment
            current_segment = 0
            play_lshift_1()
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


-- Imperial March pt. 1
function play_rctrl_1()
    Sleep(0)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --E-6
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --E-6
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --E-6
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --E-6
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --E-6
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --E-6
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --E-6
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --E-6
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    switch_mouse(2, 0)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    qtabn(3)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --G5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --G5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.041666666666666664*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --D5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --B-4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --D5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --B-4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --D5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(1, 0)
    Sleep(1)
    PressAndReleaseKey("3")  --E-4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --B-4
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("3")  --E-4
    Sleep(1)
    Sleep(0.0625*n)
    qtabn(3)
    switch_mouse(0, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --B-5
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("2")  --B-4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --D5
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.125*n)
    qtabn(1)
    Sleep(1)
    PressAndReleaseKey("1")  --D#4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --A#4
    Sleep(1)
    qtabn(1)
    switch_mouse(3, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(0, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --B-5
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --D5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    switch_mouse(3, 1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    qtabn(4)
    Sleep(1)
    PressAndReleaseKey("1")  --B-5
    Sleep(1)
    qtabn(1)
    Sleep(1)
    PressAndReleaseKey("3")  --D6
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    qtabn(2)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --B-5
    Sleep(1)
    qtabn(6)
    Sleep(1)
    PressAndReleaseKey("3")  --D6
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    qtabn(2)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --B-5
    Sleep(1)
    qtabn(6)
    Sleep(1)
    PressAndReleaseKey("3")  --D6
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.125*n)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --F#4
    Sleep(1)
    qtabn(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-5
    Sleep(1)
    qtabn(5)
    Sleep(1)
    PressAndReleaseKey("3")  --E-6
    Sleep(1)
    Sleep(0.125*n)
    qtabn(2)
    switch_mouse(3, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --F#4
    Sleep(1)
    Sleep(0.0625*n)
    qtabn(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --B-5
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("1")  --C4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 0)
    Sleep(1)
    PressAndReleaseKey("1")  --C4
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(0, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --B-5
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --D5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    qtabn(4)
    switch_mouse(3, 0)
    Sleep(1)
end

-- Imperial Marcg pt. 2
function play_rctrl_2()
    Sleep(0*n)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("3")  --F4
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("2")  --B-4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --D5
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(0.0625*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.0625*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --A#4
    Sleep(1)
    qtabn(2)
    switch_mouse(3, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --D5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    qtabn(2)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G-5
    Sleep(1)
    Sleep(0.125*n)
    qtabn(1)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --F5
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("3")  --A-4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --D-5
    Sleep(1)
    qtabn(2)
    Sleep(1)
    PressAndReleaseKey("2")  --E5
    Sleep(1)
    Sleep(0.0625*n)
    qtabn(2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    Sleep(0.0625*n)
    qtabn(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --E5
    Sleep(1)
    Sleep(0.125*n)
    qtabn(2)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    Sleep(0.125*n)
    qtabn(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(1, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    qtabn(2)
    Sleep(1)
    PressAndReleaseKey("3")  --E4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    qtabn(5)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --D-5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(2, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("3")  --C5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(1, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    Sleep(0.0625*n)
    qtabn(4)
    switch_mouse(0, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --B4
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --D#4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("1")  --D#4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --F#4
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --A#4
    Sleep(1)
    Sleep(0.0625*n)
    Sleep(1)
    PressAndReleaseKey("1")  --A4
    Sleep(1)
    Sleep(0.0625*n)
    Sleep(1)
    PressAndReleaseKey("2")  --A#4
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --D#4
    Sleep(1)
    Sleep(0.125*n)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G-4
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(1, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(0.0625*n)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G-4
    Sleep(1)
    Sleep(0.0625*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-4
    Sleep(1)
    Sleep(0.125*n)
    qtabn(1)
    switch_mouse(1, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D4
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(0.0625*n)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --B-4
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --D5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    qtabn(3)
    Sleep(1)
    PressAndReleaseKey("1")  --B-5
    Sleep(1)
    qtabn(1)
    Sleep(1)
    PressAndReleaseKey("3")  --D6
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.125*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(0.041666666666666664*n)
    qtabn(7)
    switch_mouse(1, 0)
    Sleep(1)

    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --B-4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --D5
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    qtabn(1)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --D#4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --D#4
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.0625*n)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --A#4
    Sleep(1)
    qtabn(2)
    switch_mouse(3, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --D5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    qtabn(2)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G-5
    Sleep(1)
    Sleep(0.125*n)
    qtabn(1)
    switch_mouse(2, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --F5
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("3")  --A-4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --D-5
    Sleep(1)
    qtabn(2)
    Sleep(1)
    PressAndReleaseKey("2")  --E5
    Sleep(1)
    Sleep(0.0625*n)
    qtabn(2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    Sleep(0.0625*n)
    qtabn(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --E5
    Sleep(1)
    Sleep(0.125*n)
    qtabn(2)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    Sleep(0.125*n)
    qtabn(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("3")  --A-4
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(1, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    qtabn(2)
    Sleep(1)
    PressAndReleaseKey("3")  --E4
    Sleep(1)
    qtabn(1)
    switch_mouse(0, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --G#4
    Sleep(1)
    qtabn(4)
    Sleep(1)
    PressAndReleaseKey("1")  --D-5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(2, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("3")  --C5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(1, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --D-4
    Sleep(1)
    Sleep(0.0625*n)
    qtabn(4)
    switch_mouse(0, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --B4
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --D#4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --F#4
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("2")  --A#4
    Sleep(1)
    Sleep(0.0625*n)
    Sleep(1)
    PressAndReleaseKey("1")  --A4
    Sleep(1)
    Sleep(0.0625*n)
    Sleep(1)
    PressAndReleaseKey("2")  --A#4
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --D#4
    Sleep(1)
    Sleep(0.125*n)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 0)
    Sleep(1)
    PressAndReleaseKey("2")  --E-4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --G-5
    Sleep(1)
    Sleep(0.25*n)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("1")  --C4
    Sleep(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G-4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-4
    Sleep(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("2")  --E-5
    Sleep(1)
    Sleep(0.125*n)
    switch_mouse(2, 0)
    Sleep(1)
    PressAndReleaseKey("1")  --C4
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(0, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --B-5
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("2")  --G4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --B-4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("3")  --D5
    Sleep(1)
    switch_mouse(2, 3)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    qtabn(1)
    switch_mouse(3, 0)
    Sleep(1)
    PressAndReleaseKey("3")  --E-4
    Sleep(1)
    qtabn(1)
    switch_mouse(0, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G-4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("2")  --B-4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 3)
    Sleep(1)
    PressAndReleaseKey("1")  --E-5
    Sleep(1)
    Sleep(0.125*n)
    Sleep(0.0625*n)
    qtabn(1)
    Sleep(1)
    PressAndReleaseKey("1")  --B-5
    Sleep(1)
    Sleep(0.0625*n)
    switch_mouse(3, 1)
    Sleep(1)
    PressAndReleaseKey("1")  --G4
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("2")  --B-4
    Sleep(1)
    qtabn(1)
    switch_mouse(1, 2)
    Sleep(1)
    PressAndReleaseKey("1")  --D5
    Sleep(1)
    Sleep(1)
    PressAndReleaseKey("3")  --G5
    Sleep(1)
    Sleep(0.25*n)
    qtabn(7)
    switch_mouse(2, 0)
    Sleep(1)
end
