-- For Sexy Parodius (JAA), shows the timer rank and total rank on the screen
-- Also shows hitbox for Mambo (was based on trial and error so may not be perfectly precise)

for tag, screen in pairs(manager.machine.screens) do print(tag) end
cpu = manager.machine.devices[":maincpu"]
mem = cpu.spaces["program"]
s = manager.machine.screens[":screen"]

timer_rank_addr = 0xc107f3
total_rank_addr = 0xc109ab
x_pos_addr = 0xc00eb3
y_pos_addr = 0xc0330d
width = 7
height = 5

function draw_overlay()
    timer_rank = mem:read_u8(timer_rank_addr)
    total_rank = mem:read_u8(total_rank_addr)
    s:draw_text(200, 0, "Timer: " .. timer_rank)
    s:draw_text(250, 0, "Total: " .. total_rank)

    xpos = mem:read_u8(x_pos_addr) + 3
    ypos = mem:read_u8(y_pos_addr) - 18
    s:draw_box(xpos, ypos, xpos + width, ypos + height)
end


emu.register_frame_done(draw_overlay, 'frame')