local gpuAddress = component.list("gpu")()
local gpu = component.proxy(gpuAddress)

gpu.setBackground(0x000000)
gpu.setForeground(0xFFFFFF)
gpu.fill(1, 1, 80, 25, " ")

gpu.set(1, 1, "Your System Has been PWND By Skula Virus")

while true do
  gpu.set(27, 8, " ")
end
