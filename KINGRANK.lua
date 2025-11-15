gg.alert("𝑺𝒄𝒓𝒊𝒑𝒕 𝑺𝒕𝒂𝒕𝒖𝒔 = 𝑶𝒇𝒇 𝑭𝒐𝒓 1𝒐𝒓2 𝑫𝒂𝒚𝒔")

local function pass(...)
   arg = {...}
   local pas = gg.prompt
   ({"ENTER YOUR KEY HERE FOR LOGIN:"}, {}, {"text"})
   pas = pas and pas[1].." " or os.exit(gg.alert("Exit the script", ""))
   for i = 1, #arg do
       if arg[i].. " "==pas then
          return gg.alert("𝑪𝑶𝑹𝑹𝑬𝑪𝑻 𝑲𝑬𝒀✅️\n\n🦋⁂༄₩ԑ₰cơෆℯ༄⁂🦋", "")
      end
 end
 while (true) do
    os.exit(gg.alert("𝑺𝒄𝒓𝒊𝒑𝒕 𝑶𝒇𝒇 𝑫𝒖𝒆 𝑻𝒐 𝑺𝒐𝒎𝒆 𝑭𝒂𝒖𝒍𝒕𝒔 ", ""))
 end
end


pass("MALIK44", "𝒇𝒇", "𝒉𝒉", "𝒌𝒌", "𝒍𝒍")-- Add password.




gg.toast("✅️𝑨𝒄𝒄𝒆𝒔𝒔 𝒈𝒓𝒂𝒏𝒕𝒆𝒅!✅️")
gg.sleep("1000")


print([[
Mᴀʟɪᴋ Aʙᴜʙᴀᴋᴋᴇʀ Oɴ Tᴏᴘ?
]])
local MENU = 0
local lastMenu = nil





local info = gg.getTargetInfo()
if info.x64 then
else
gg.alert("⚠ This script supports 64-bit ⚠")
end

local gg = gg


gg.alert("🦋⁂༄₩ԑ₰cơෆℯ༄⁂🦋")

gg.toast("𝙎𝙘𝙧𝙞𝙥𝙩 𝙇𝙤𝙖𝙙𝙚𝙙:𝘾𝙡𝙞𝙘𝙠 𝙊𝙣 𝙂𝙂 𝙄𝙘𝙤𝙣️")
function HOME()
lastMenu = "HOME"
local menu = gg.choice({
" • 👑𝗞𝗜𝗡𝗚 𝗥𝗔𝗡𝗞👑", 
"𝗜𝗡𝗙𝗢𝗥𝗠𝗔𝗧𝗜𝗢𝗡",
" ❌ 𝙀𝙓𝙄𝙏 ❌ ",
},nil,os.date([[
┏━━━━━━━━⋆✪⋆━━━━━━━━┓
👑 Sᴄʀɪᴘᴛ Bʏ MᴀʟɪᴋAʙᴜʙᴀᴋᴋᴇʀ👑
➣ ☀️𝙏𝙊𝘿𝘼𝙔: %d/%m/%y
➣ ⌚𝙏𝙄𝙈𝙀:  %I:%M %p 
➣  👑𝙆𝙄𝙉𝙂 𝙍𝘼𝙉𝙆 𝘽𝙔 𝙈𝘼𝙇𝙄𝙆 👑
┗━━━━━━━━⋆✪⋆━━━━━━━━┛]]))

if menu == 1 then
kingrank()
elseif menu == 2 then
Info()
elseif menu == 3 then
gg.toast("EXIT ✔")
os.exit()
else
gg.setVisible(false)
MENU = 0
end
end



function kingrank() --kingrank
local url = "https://cpm-rank.onrender.com/rank"


gg.alert("Log out of your account before use, then click gg logo")
gg.toast("When You Are Ready Then Click On GG icon")
gg.sleep("2000")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
local input = gg.prompt({"Enter your email:", "Enter your password:"}, nil, {"text", "text"})
if input == nil then
gg.alert("✖️ Cancel ✖️")
return
end
if not input or input[1]:match("^%s*$") or input[2]:match("^%s*$") then
gg.alert("Email or password missing.")
return
end
local res = gg.makeRequest(url, {["Content-Type"] = "application/json"},
string.format('{"email":"%s","password":"%s"}', input[1], input[2]))
if not res or res.code ~= 200 then
return gg.alert("Error: " .. (res and res.code or "You are offline"))
end
local msg = res.content:match('"message"%s*:%s*"([^"]+)"') or "Rank set successfully!"
gg.alert(msg)
end

function Info()

  local menu = gg.choice({
    "• 𝙋𝙍𝙀𝙈𝙄𝙐𝙈  𝙆𝙄𝙉𝙂 𝙍𝘼𝙉𝙆 𝙎𝘾𝙍𝙄𝙋𝙏 𝘽𝙔 𝙈𝘼𝙇𝙄𝙆",
	"• 𝙁𝙊𝙍 𝘼𝙉𝙔 𝙁𝙍𝙀𝙀 𝘼𝙉𝘿 𝙋𝘼𝙄𝘿 𝙎𝙀𝙍𝙑𝙄𝘾𝙀 𝙒𝙃𝘼𝙏𝙎𝘼𝙋𝙋: ",
	"𝙊𝙍 𝘿𝙄𝙎𝘾𝙊𝙍𝘿",
    "• 𝘼𝙇𝙃𝘼𝙈𝘿𝙐𝙇𝙄𝙇𝙇𝘼𝙃 𝙒𝙊𝙍𝙇𝘿 𝙏𝙊𝙋 𝙏𝙍𝙐𝙎𝙏𝙀𝘿 𝙎𝘾𝙍𝙄𝙋𝙏 𝙎𝙀𝙇𝙇𝙀𝙍",
    "❌𝘽𝘼𝘾𝙆✖️",
  }, nil, "🇵🇸 𝙋𝘼𝙇𝙀𝙎𝙏𝙄𝙉𝙄 🇵🇸")
  
  
  
  
  if menu == 1 then Info()
  elseif menu == 2 then InfoWa()
  elseif menu == 3 then InfoDc()
  elseif menu == 4 then Info()
  elseif menu == 5 then backMenu()
  end
end


function backMenu() 
lastMenu = "HOME"
HOME()
end




function InfoWa()
gg.copyText("𝙒𝙝𝙖𝙩𝙨𝘼𝙥𝙥: +923408005070")
gg.toast("𝙏𝙝𝙚 𝙒𝙖 𝙉𝙪𝙢 𝙒𝙖𝙨 𝘾𝙤𝙥𝙮 𝙄𝙣 𝙔𝙤𝙪𝙧 𝘾𝙡𝙞𝙥 𝘽𝙤𝙖𝙧𝙙")
gg.sleep("2000")
end

function InfoDc()
gg.copyText("𝘿𝙞𝙨𝙘𝙤𝙧𝙙: malikab_1")
gg.toast("𝙏𝙝𝙚 𝘿𝙘 𝙐𝙨𝙚𝙧𝙉𝙖𝙢𝙚 𝙒𝙖𝙨 𝘾𝙤𝙥𝙮 𝙄𝙣 𝙔𝙤𝙪𝙧 𝘾𝙡𝙞𝙥 𝘽𝙤𝙖𝙧𝙙")
gg.sleep("2000")
end




while true do
if gg.isVisible(true) then
gg.setVisible(false)
else
MENU = 1
HOME()
end
end



