-- For Sexy Parodius (JAA), shows the timer rank and total rank on the screen

for tag, screen in pairs(manager.machine.screens) do print(tag) end
cpu = manager.machine.devices[":maincpu"]
mem = cpu.spaces["program"]
s = manager.machine.screens[":screen"]

timer_rank_addr = 0xc107f3
total_rank_addr = 0xc109ab

function draw_overlay()
    timer_rank = mem:read_u8(timer_rank_addr)
    total_rank = mem:read_u8(total_rank_addr)
    s:draw_text(40, 0, "Timer: " .. timer_rank)
    s:draw_text(200, 0, "Total: " .. total_rank)
end

emu.register_frame_done(draw_overlay, 'frame')