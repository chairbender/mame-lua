for tag, screen in pairs(manager.machine.screens) do print(tag) end
cpu = manager.machine.devices[":maincpu"]
mem = cpu.spaces["program"]
s = manager.machine.screens[":screen"]

timer_rank_addr = 0xc107f3
total_rank_addr = 0xc109ab

function draw_overlay()
    timer_rank = mem:read_u8(timer_rank_addr)
    total_rank = mem:read_u8(total_rank_addr)
    s:draw_text(40, 40, timer_rank)
    s:draw_text(80, 80, total_rank)
end

emu.register_frame_done(draw_overlay, 'frame')