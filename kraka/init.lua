-- Game Over! XD
local gpuAddress = component.list("gpu")()
local gpu = component.proxy(gpuAddress)

gpu.setResolution(80, 25)

gpu.setBackground(0x000000)
gpu.setForeground(0xFFFFFF)

gpu.set(35, 1, "You so stupid!")
gpu.setForeground(0x960a00)
gpu.set(27, 5, "The situation with your disk")
gpu.set(27, 6, "is much worse than you think.")
gpu.setForeground(0xFFFFFF)

while true do
  gpu.set(27, 8, " ")
end
