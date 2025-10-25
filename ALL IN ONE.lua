
local function pass(...)
   arg = {...}
   local pas = gg.prompt
   ({"ENTER YOUR KEY HERE FOR LOGIN:"}, {}, {"text"})
   pas = pas and pas[1].." " or os.exit(gg.alert("Exit the script", ""))
   for i = 1, #arg do
       if arg[i].. " "==pas then
          return gg.alert("CORRECT PASSWORD", "")
      end
 end
 while (true) do
    os.exit(gg.alert("Wrong password", ""))
 end
end


pass("MALIK55", "Ax", "KAIFKHAN", "CH99", "HAMDAN99")-- Add password.




print([[
Mᴀʟɪᴋ Aʙᴜʙᴀᴋᴋᴇʀ Oɴ Tᴏᴘ?
]])
local MENU = 0
local lastMenu = nil

GLabel = 'Car Parking'
GProcess = 'com.olzhas.carparking.multyplayer'
GVersion = '4.9.5'

local v = gg.getTargetInfo()
if v.processName~=GProcess then
gg.alert("This Script is For:\n"..GLabel.."\n"..GProcess.."\n\nYou Selected:\n"..v.label.."\n"..v.processName)
return
end

if GVersion~=v.versionName then
gg.alert("This Script is for Game Version:\n"..GVersion.."\n\nYour Game Version is:\n"..v.versionName) 
gg.setVisible(false)
return
end

local info = gg.getTargetInfo()
if info.x64 then
else
gg.alert("⚠ This script supports 64-bit ⚠")
end

local gg = gg

if true then
    local BlockFunctions = {
        searchNumber = gg.searchNumber,
        searchPointer = gg.searchPointer,
        refineNumber = gg.refineNumber,
        editAll = gg.editAll
    }
    local function Block(funcName, ...)
        gg.setVisible(false)
        local Anti = BlockFunctions[funcName](...)
        if gg.isVisible() then
            clearReset()
            gg.alert(" ⚠ ᴠɪᴇᴡɪɴɢ ᴀᴄᴛɪᴏɴ ᴅᴇᴛᴇᴄᴛᴇᴅ ⚠")
            gg.toast("✔ Close Script")
            os.exit()
        end
        return Anti
    end
    gg.searchNumber = function(...) return Block("searchNumber", ...) end
    gg.searchPointer = function(...) return Block("searchPointer", ...) end
    gg.refineNumber = function(...) return Block("refineNumber", ...) end
    gg.editAll = function(...) return Block("editAll", ...) end
end

function standby()
    gg.setVisible(false)
while not gg.isVisible() do end
end

function gg.setResult()
results = gg.getResults(100000)
result = {}
FirstResults = {}
SecondResults = {}
FinalResults = {}
NIndex = 1
end

function gg.getValue()
FirstResults = gg.getValues(FirstResults)
SecondResults = gg.getValues(SecondResults)
NIndex = 1
end

function clearReset()
    gg.setVisible(false)
        gg.clearResults()
    gg.clearList()
end

local function searchValue(value, flags, refinetag)
gg.searchNumber(value, flags)
local results = gg.getResults(100000)
if #results == 0 then
gg.toast("Not Result Found: Search")
clearReset()
return nil
end
if refinetag then
gg.refineNumber(refinetag, flags)
results = gg.getResults(100000)
if #results == 0 then
gg.toast("Not Result Found: Refine")
clearReset()
return nil
end
end
return results
end

local function offsetData(results, offset, flags)
for i, ofs in ipairs(results) do
ofs.address = ofs.address + offset
ofs.flags = flags
end
gg.loadResults(results)
end

local libil2cpp = gg.getRangesList("libil2cpp.so")[2].start
function setvalue(address, flags, value)
    local vdata = { address = address, flags = flags, value = value, freeze = true }
    gg.addListItems({vdata})
    gg.removeListItems({vdata})
end

--==== MOV Auto RET ====--
function setofst(offset, flags, value)
    local dataList = {
        { address = libil2cpp + offset, flags = flags, value = value, freeze = true },
        { address = libil2cpp + offset + 4, flags = flags, value = -698416192, freeze = true },}
    gg.addListItems(dataList)
    gg.removeListItems(dataList)
end

function L0_115(class, offset, tryHard, bit32, valueType, SearchMode)
   Get_user_input = {}
   Get_user_input[1] = class
   Get_user_input[2] = offset
   Get_user_input[3] = tryHard
   Get_user_input[4] = bit32
   start()
end

error = 0
function O_initial_search()
   gg.setVisible(false)
   user_input = ":" .. Get_user_input[1]
   if Get_user_input[3] then
      offst = 25
   else
      offst = 0
   end
end

function O_dinitial_search()
   if error > 1 then
      gg.setRanges(gg.REGION_C_ALLOC)
   else
      gg.setRanges(gg.REGION_OTHER)
   end
   gg.searchNumber(user_input, gg.TYPE_BYTE)
   count = gg.getResultsCount()
   if count == 0 then
      return 0
   end
   Refiner = gg.getResults(1)
   gg.refineNumber(Refiner[1].value, gg.TYPE_BYTE)
   count = gg.getResultsCount()
   if count == 0 then
      return 0
   end
   val = gg.getResults(count)
end

function CA_pointer_search()
   gg.clearResults()
   gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
   gg.loadResults(val)
   gg.searchPointer(offst)
   count = gg.getResultsCount()
   if count == 0 then
      return 0
   end
   val = gg.getResults(count)
end

function CA_apply_offset()
   if Get_user_input[4] then
      tanker = -8
   else
      tanker = -16
   end
   local copy = false
   local l = val
   for i, v in ipairs(l) do
      v.address = v.address + tanker
      if copy then v.name = v.name .. ' #2' end
   end
   val = gg.getValues(l)
end

function A_base_value()
   gg.setRanges(gg.REGION_ANONYMOUS)
   gg.loadResults(val)
   gg.searchPointer(offst)
   count = gg.getResultsCount()
   if count == 0 then
      return 0
   end
   val = gg.getResults(count)
end

function A_base_accuracy()
   gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC)
   gg.loadResults(val)
   gg.searchPointer(offst)
   count = gg.getResultsCount()
   if count == 0 then
      return 0
   end
   kol = gg.getResults(count)
   i = 1
   h = {}
   while (i - 1) < count do
      h[i] = {}
      h[i].address = kol[i].value
      h[i].flags = 32
      i = i + 1
   end
   val = gg.getValues(h)
end

function A_user_given_offset()
   local old_save_list = val
   local uniqueTable = {} -- Table to hold unique addresses
   local addressSet = {}  -- Set to track seen addresses

   for _, item in ipairs(old_save_list) do
      if not addressSet[item.address] then
         table.insert(uniqueTable, item)
         addressSet[item.address] = true
      end
   end

   old_save_list = uniqueTable
 
   local finalResults = {}
   local finalResultIndex = 1
   local hex_values = {}
   local hexx_values = {}
   local complex_loaded_list = {}
   if Get_user_input[7] then
      Get_user_input[2] = tostring(Get_user_input[2])
   end

   for hex in Get_user_input[2]:gmatch("0x%x+") do
      table.insert(hex_values, hex)
   end
   if Get_user_input[7] then
      Get_user_input[2] = '0x0'
   end

   -- Normal values loader, Loads dword or qword if basic type is not selected
   for i, v in ipairs(old_save_list) do
      for index, value in ipairs(hex_values) do
         if Get_user_input[7] then
            value = 0
         end

         finalResults[finalResultIndex] = {}
         finalResults[finalResultIndex].address = v.address + value
         if (SearchTypeSelection == 1) then
            if (TempComplexTypeStore['IsComplex']) then
               local ComplexTypeRefrence = { ['address'] = v.address + value }
               local TempSingleTypeLoad = ComplexFeildsHandlers[TempComplexTypeStore['FeildHandler']](
                  ComplexTypeRefrence)

               for i = 1, #TempSingleTypeLoad do
                  complex_loaded_list[#complex_loaded_list + 1] = TempSingleTypeLoad[i]
               end
            else         
               finalResults[finalResultIndex].flags = Get_user_type
            end
         else
            if Get_user_input[4] then
               finalResults[finalResultIndex].flags = gg.TYPE_DWORD
            else
               finalResults[finalResultIndex].flags = gg.TYPE_QWORD
            end
         end
         finalResultIndex = finalResultIndex + 1
      end
   end
   if (SearchTypeSelection == 1) then
      if (TempComplexTypeStore['IsComplex']) then
         finalResults = gg.getValues(complex_loaded_list)
         Results = complex_loaded_list
         if SearchTypeSelection == 1 then
            if Get_user_input[6] then
               gg.addListItems(complex_loaded_list)
            end
         end
      else
         finalResults = gg.getValues(finalResults)
         Results = finalResults
      end
   end

   -- Struct values loader, It loades the struct values given during struct search mode
   if (SearchTypeSelection == 2) then
      for hex in Get_second_feild_offset[1]:gmatch("0x%x+") do
         table.insert(hexx_values, hex)
      end

      local structValues = {}
      local structValueIndex = 1;

      for i, v in ipairs(finalResults) do
         for index, value in ipairs(hexx_values) do
            if value == "0x0" then
               value = 0
            end
            if Get_user_input[7] then
               value = 0
            end

            structValues[structValueIndex] = {}
            structValues[structValueIndex].address = v.address + value
            if (TempComplexTypeStore['IsComplex']) then
               local ComplexTypeRefrence = { ['address'] = v.address + value }
               local TempSingleTypeLoad = ComplexFeildsHandlers[TempComplexTypeStore['FeildHandler']](
                  ComplexTypeRefrence)

               for i = 1, #TempSingleTypeLoad do
                  complex_loaded_list[#complex_loaded_list + 1] = TempSingleTypeLoad[i]
               end
            else
               structValues[structValueIndex].flags = Get_user_type
            end

            structValueIndex = structValueIndex + 1
         end
      end

      gg.clearResults()

      if (TempComplexTypeStore['IsComplex']) then
         structValues = gg.getValues(complex_loaded_list)
         Results = complex_loaded_list
         if SearchTypeSelection == 2 then
            if Get_user_input[6] then
               gg.addListItems(complex_loaded_list)
            end
         end
      else
         structValues = gg.getValues(structValues)
         Results = structValues
      end

      gg.loadResults(structValues)
   elseif (SearchTypeSelection == 3) then
      -- Child class loader, it loades child class from the offsets given by user

      finalResults = gg.getValues(finalResults)
      for hex in Get_second_feild_offset[1]:gmatch("0x%x+") do
         table.insert(hexx_values, hex)
      end

      local childClassValues = {}
      local childClassIndex = 1;
      
      -- Final result contains pointers
      -- final result val + offset will be new values to be loaded
      for i, v in ipairs(finalResults) do
         for index, value in ipairs(hexx_values) do
            if value == "0x0" then
               value = 0
            end
            childClassValues[childClassIndex] = {}
            childClassValues[childClassIndex].address = v.value + value
            
            -- From here code for custom load
            if (TempComplexTypeStore['IsComplex']) then
               local ComplexTypeRefrence = { ['address'] = v.value + value }
               local TempSingleTypeLoad = ComplexFeildsHandlers[TempComplexTypeStore['FeildHandler']](
                  ComplexTypeRefrence)
               for i = 1, #TempSingleTypeLoad do
                  complex_loaded_list[#complex_loaded_list + 1] = TempSingleTypeLoad[i]
               end
            else
               childClassValues[childClassIndex].flags = Get_user_type
            end
            childClassIndex = childClassIndex + 1
         end
      end
      gg.clearResults()
      if (TempComplexTypeStore['IsComplex']) then
         childClassValues = gg.getValues(complex_loaded_list)
         Results = complex_loaded_list
         if SearchTypeSelection == 3 then
            if Get_user_input[6] then
               gg.addListItems(complex_loaded_list)
            end
         end
      else
         childClassValues = gg.getValues(childClassValues)
         Results = childClassValues
      end
      gg.loadResults(childClassValues)
   else
      gg.clearResults()
      gg.loadResults(finalResults)
   end
   count = gg.getResultsCount()
   if count == 0 then
      return 0
   end
   gg.setVisible(false)
end
function start()
   O_initial_search()
   O_dinitial_search()
   if error > 0 then
      return 0
   end
   CA_pointer_search()
   if error > 0 then
      return 0
   end
   CA_apply_offset()
   if error > 0 then
      return 0
   end
   A_base_value()
   if error > 0 then
      return 0
   end
   if offst == 0 then
  A_base_accuracy()
   end
   if error > 0 then
      return 0
   end
   A_user_given_offset()
   if error > 0 then
      return 0
   end
end

local globalAlertMessage = "DefaultMessage"
function searchModule(number, type, range, alertMessage)
    gg.setVisible(false)
    gg.clearResults()
    range = range or 32
    if range == "A" then
        range = 32
    elseif range == "Xa" then
        range = 16384
    end
    globalAlertMessage = alertMessage or globalAlertMessage
    gg.setRanges(tonumber(range))
    gg.searchNumber(number, type)
    local results = gg.getResults(100000)
    if #results == 0 then
        gg.clearResults()
        gg.alert("\nCode error:\nИЕO_Parking v1.lua/" .. globalAlertMessage .. ":\nNo Results found (Not Found: Results[1])\n作成者に伝えて修正して下さい\n\nもしくはやり方 手順が謝っています")
        return nil
    end
    return results
end

function pointerSearch(results, offset, flags)
    if not globalAlertMessage then
        error("AlertMessage not set. Run searchModule first.")
    end
    for i, result in ipairs(results) do
        results[i].address = result.address + offset
        results[i].flags = flags
    end
    gg.clearResults()
    gg.loadResults(results)
    gg.searchPointer(2)
    local pointerResults = gg.getResults(100000)
    if #pointerResults == 0 then
        gg.clearResults()
        gg.alert("\nCode error:\nИЕO_Parking v1.lua/" .. globalAlertMessage .. ":\nNo Results found (Not Found: Results[Pointer])\n作成者に伝えて修正して下さい\n\nもしくはやり方 手順が謝っています")
        return nil
    end
    return pointerResults
end

function getResults(results, offsets, flags)
    local putValue = {}
    for i, result in ipairs(results) do
        for j, offset in ipairs(offsets) do
            if not putValue[j] then
                putValue[j] = {}
            end
            table.insert(putValue[j], { address = result.address + offset, flags = flags[j] or 32 })
        end
    end
    return putValue
end

function filterResults(offsetResults, valueInfo)
    local checkValue = {}
    local finalResults = {}
    for i, results in ipairs(offsetResults) do
        checkValue[i] = gg.getValues(results)
    end
    for i = 1, #checkValue[1] do
        local isMatch = true
        for j, condition in ipairs(valueInfo) do
            local value = checkValue[j][i].value
            if condition.key1 then
                if value ~= condition.key1[1] then
                    isMatch = false
                    break
                end
            elseif condition.key2 then
                if (condition.key2.min and value < condition.key2.min) or 
                   (condition.key2.max and value > condition.key2.max) then
                    isMatch = false
                    break
                end
            elseif condition.key3 then
                local found = false
                for _, v in ipairs(condition.key3) do
                    if value == v then
                        found = true
                        break
                    end
                end
                if not found then
                    isMatch = false
                    break
                end
            end
        end
        if isMatch then
            table.insert(finalResults, checkValue[1][i])
        end
    end
    if #finalResults == 0 then
        gg.clearResults()
        gg.alert("\nCode error:\nИЕO_Parking v1.lua/" .. globalAlertMessage .. ":\nNo Results found (Not Found: Results[2])\n作成者に伝えて修正して下さい\n\nもしくはやり方 手順が謝っています")
        return
    end
    return finalResults
end

function v_setValues(results, offsets, flags, values)
    local editValues = {}
    for _, v in ipairs(results) do
        if not v.address then
            gg.clearResults()
            gg.alert("Error: address is nil")
            return
        end
    end
    for _, v in ipairs(results) do
        for i, offset in ipairs(offsets) do
            local index = (_ - 1) * #offsets + i
            editValues[index] = {
                address = v.address + offset,
                flags = flags[i] or flags[1],
                value = values[i] or values[1],
                freeze = true
            }
        end
    end
    MemoryList(editValues)
    gg.setVisible(false)
    gg.clearResults()
end

function MemoryList(ListItems)
    gg.addListItems(ListItems)
    gg.removeListItems(ListItems)
end


on = "    ⃢🔴"
off = "🔴⃢  "

-- shift time
shift00001 = off
shift1e30 = off
shift1e29 = off
customshift = off

-- copy car
cpycar = off
cpycarexchange = off

-- race
sec3 = off
sec5 = off

-- unlock
unlw16 = off

-- bypass
nodamageEngine = off
crosswall = off

clearReset()
gg.toast("SCRIPT LOADED:CLICK ON GG")
function HOME()
lastMenu = "HOME"
local menu = gg.choice({
" • MONEY MENU ", -- 1
" • COIN MENU ", -- 2
" • HP MENU ", -- 3
" • SHIFT TIME MENU ", -- 4
" • DUPLICATE CAR MENU ", -- 5
" • UFO MENU ", -- 6
" • STEERING ANGEL MENU ", -- 7
" • CHROME MENU ", -- 8
" • CUSTOM MENU ", -- 9
" • RACE MENU ", -- 10
" • LONG NAME ", -- 11
" • UNLOCK MENU ", -- 12
" • PREMIUM BODYKITS MENU ", -- 13
" • ACHIVEMENT MENU ", -- 14
" • SPOILER MENU ", -- 15
" • BUMPER MENU ", -- 16
" • ROOF MENU ", -- 17
" • UNLOCK PREMIUM CAR ", -- 18
" • UNLOCK SIREN", -- 19
" • FAST CHARACTER", -- 20
" • BYPASS MENU", -- 21
" ❌ E X I T ❌ ",
},nil,os.date([[
┏━━━━━━━━⋆✪⋆━━━━━━━━┓
      Sᴄʀɪᴘᴛ Bʏ MᴀʟɪᴋX👻
➣ ☀️Today: %d/%m/%y
➣ ⌚Time:  %I:%M %p 
➣  MAIN MENU
┗━━━━━━━━⋆✪⋆━━━━━━━━┛]]))

if menu == 1 then
lastMenu = "moneymenu"
moneymenu()
elseif menu == 2 then
lastMenu = "coinmenu"
coinmenu()
elseif menu == 3 then
lastMenu = "hpmenu"
hpmenu()
elseif menu == 4 then
lastMenu = "shifttimemenu"
shifttimemenu()
elseif menu == 5 then
lastMenu = "copycar"
copycar()
elseif menu == 6 then
lastMenu = "ufomenu"
ufomenu()
elseif menu == 7 then
lastMenu = "steeringanglemenu"
steeringanglemenu()
elseif menu == 8 then
lastMenu = "chromemenu"
chromemenu()
elseif menu == 9 then
lastMenu = "custommenu"
custommenu()
elseif menu == 10 then
lastMenu = "racemenu"
racemenu()
elseif menu == 11 then
longname()
elseif menu == 12 then
lastMenu = "unlockmenu"
unlockmenu()
elseif menu == 13 then
lastMenu = "premiumkits"
premiumkits()
elseif menu == 14 then
lastMenu = "achivementmenu"
achivementmenu()
elseif menu == 15 then
lastMenu = "spoilermenu"
spoilermenu()
elseif menu == 16 then
lastMenu = "bumpermenu"
bumpermenu()
elseif menu == 17 then
lastMenu = "roofmenu"
roofmenu()
elseif menu == 18 then
lastMenu = "premiumcar"
premiumcar()
elseif menu == 19 then
unlocksiren()
elseif menu == 20 then
fastrun()
elseif menu == 21 then
lastMenu = "bypassmenu"
bypassmenu()
elseif menu == 22 then
gg.toast("EXIT ✔")
clearReset()
os.exit()
else
gg.setVisible(false)
MENU = 0
end
end

function moneymenu()
  local menu = { 
" 50M MONEY ", 
" CUSTOM MONEY ",  
" ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇲 🇴 🇳 🇪 🇾   🇲 🇪 🇳 🇺  ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
  
  if choice[1] then money() end
  if choice[2] then custommoney() end
  if choice[3] then backMenu() end
end


function backMenu() 
lastMenu = "HOME"
HOME()
end
 
  
function money() -- get 50m money
gg.setVisible(false)
gg.alert("CLICK LEVEL 3 THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
ofst = 0x15A7748 setvalue(libil2cpp + ofst, 16, 50000000) 
gg.setRanges(32)
gg.searchNumber("4524092631141056512", 32)
local results = gg.getResults(100000)
for _, M in ipairs(results) do
M.flags = 16
M.value = 50000000
M.freeze = true
end
gg.addListItems(results)
gg.alert("COMPLETE LEVEL 1")
gg.toast("ON")
clearReset()
end

function custommoney() -- custom money
local custom_money2 = gg.prompt({"Enter Custom Money Value:"}, {""}, {"number"})
if custom_money2 == nil or custom_money2[1] == "" then
moneymenu()
return
end
gg.setVisible(false)
gg.alert("CLICK LEVEL 3 THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
ofst = 0x15A7748 setvalue(libil2cpp + ofst, 16, custom_money2[1]) 
gg.setRanges(32)
gg.searchNumber("4524092631141056512", 32)
local results = gg.getResults(100000)
for _, M in ipairs(results) do
M.flags = 16
M.value = 50000000
M.freeze = true
end
gg.addListItems(results)
gg.alert("COMPLETE LEVEL 1")
gg.toast("ON")
clearReset()
end

function coinmenu()
  local menu = { 
" GET 500K COINS ", 
" REDUCE COINS (BODYKITS)",  
" REDUCE COINS (WHEELS)",  
" ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇨 🇴 🇮 🇳 🇸    🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end

  if choice[1] then  getcoins() end
  if choice[2] then reducecoinsbk() end
  if choice[3] then  reducecoinswheel() end
  if choice[4] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end

function getcoins() -- get 500k coin daily task
clearReset()
searchClass = L0_115
searchClass("Prize", "0x10", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 500000
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
gg.toast("ON")
gg.setVisible(false)
gg.alert("GO IN ROOM THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
local choice = gg.alert("COMPLETE DAILY TASK USE ACHIVEMENT MENU FOR COMPLETE MORE FAST","OPEN ACHIVEMENT MENU","OK")
if choice == 1 then
achivementmenu()
end
clearReset()
end

function reducecoinsbk() -- reduce coin (body kit)
clearReset()
local choice = gg.alert("GO SEE A YTB TUTORIAL TO BETTER UNDERSTAND HOW TO DO\n\nhttps://youtu.be/V3fdEs8UCbI","COPY LINK","OK")
if choice == 1 then
gg.copyText("https://youtu.be/dEs8UCbI")
gg.alert("THE LINK WAS COPIED IN THE CLIPBOARD")
end
local d = gg.prompt({
" ENTER COIN YOU HAVE : ",
" ENTER COIN YOU WANT : ",
" BACK ",
}, nil, {
"number", 
"number",
"checkbox",
})
if not d then
    return gg.toast("Cancel")
end
if d[3] then
coinmenu()
end
local ycoin = tonumber(d[1])
local coinw = tonumber(d[2])
if not ycoin or not coinw then
    return gg.alert("Invalid number entered.")
end
if coinw >= ycoin then
    return gg.alert("Only decreasing is allowed.")
end
local calc = coinw - ycoin
local value = -calc
gg.setVisible(false)
gg.alert("GO CLICK TO THE PLACE 'NEW CAR' AND CHOOSE A CAR CLICK ON ONE OF THE ARROW OF THE CAR (BODY-KIT) FIND COIN PRICE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
clearReset()
searchClass = L0_115
searchClass("KitController", "0x44", false, false, 4)
local results = gg.getResults(100)
if #results == 0 then
    return gg.alert("No results found")
end
for i, v in ipairs(results) do
    v.flags = 4
    v.value = value
    v.freeze = true
end
gg.addListItems(results)
gg.setValues(results)
gg.alert("CLICK ON THE SAME KIT RIGHT ARROW THEN LEFT ARROW THEN BUY THE CAR")
gg.toast("ON")
clearReset()
end

function reducecoinswheel() -- reduce coin (wheel)
clearReset()
gg.alert("GO TO EXTERIOR THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
local d = gg.prompt({
" ENTER COIN YOU HAVE : ",
" ENTER COIN YOU WANT : ",
" BACK ",
}, nil, {
"number", 
"number",
"checkbox",
})
if not d then
    return gg.toast("Cancel")
end
if d[3] then
coinmenu()
end
local ycoin = tonumber(d[1])
local coinw = tonumber(d[2])
if not ycoin or not coinw then
    return gg.alert("Invalid number entered.")
end
if coinw >= ycoin then
    return gg.alert("Only decreasing is allowed.")
end
local calc = coinw - ycoin
local value = -calc
clearReset()
searchClass = L0_115
searchClass("OneWheelData", "0x28", false, false, 4)
local results = gg.getResults(99999)
if #results == 0 then
    return gg.alert("No results found")
end
for i, v in ipairs(results) do
    v.flags = 32
    v.value = value
    v.freeze = true
end
gg.addListItems(results)
gg.setValues(results)
gg.alert("GO BUY 1 WHEEL")
gg.toast("ON")
clearReset()
end


function hpmenu()
  local menu = { 
" 320HP ", 
" 90HP ", 
" 1695HP ", 
" 1466HP ", 
" 2000HP ", 
" 300HP ", 
" 98HP ", 
" 925HP ", 
" ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇭 🇵  🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
 end
  
  if choice[1] then onehp() end
  if choice[2] then twohp() end
  if choice[3] then threehp() end
  if choice[4] then fourhp() end
  if choice[5] then fivehp() end
  if choice[6] then sixhp() end
  if choice[7] then sevenhp() end
  if choice[8] then eighthp() end
  if choice[9] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end

function onehp() -- 320hp
gg.setVisible(false)
gg.alert ("BUY AN ENGINE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5124040845977993216", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x3C
 ofs.flags = 32
 end
gg.loadResults(results)
gg.refineNumber("274877906944", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x4
 ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("0", 32)
local resultH = gg.getResults(gg.getResultsCount())
local resultN = gg.getResults(gg.getResultsCount())
local resultHO = gg.getResults(gg.getResultsCount())
local resultNO = gg.getResults(gg.getResultsCount())

for i, CR in ipairs(resultH) do
 CR.address = CR.address + 0x14
 CR.flags = 16
 CR.value = 320
 CR.freeze = true
end

for i, CG in ipairs(resultN) do
 CG.address = CG.address + 0x1C
 CG.flags = 16
 CG.value = 2299
end

for i, CB in ipairs(resultHO) do
 CB.address = CB.address + 0x18
 CB.flags = 16
 CB.value = 8000
end

for i, CF in ipairs(resultNO) do
 CF.address = CF.address + 0x20
 CF.flags = 16
 CF.value = 5000
end
gg.setValues(resultH)
gg.setValues(resultN)
gg.setValues(resultHO)
gg.setValues(resultNO)
gg.alert("CLICK ON ONOTHER CAR AND COME BACK THEN CLICK SET")
gg.toast("ON")
clearReset()
end

function twohp() -- 90hp
gg.setVisible(false)
gg.alert ("BUY AN ENGINE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5124040845977993216", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x3C
 ofs.flags = 32
 end
gg.loadResults(results)
gg.refineNumber("274877906944", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x4
 ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("0", 32)
local resultH = gg.getResults(gg.getResultsCount())
local resultN = gg.getResults(gg.getResultsCount())
local resultHO = gg.getResults(gg.getResultsCount())
local resultNO = gg.getResults(gg.getResultsCount())

for i, CR in ipairs(resultH) do
 CR.address = CR.address + 0x14
 CR.flags = 16
 CR.value = 90
end

for i, CG in ipairs(resultN) do
 CG.address = CG.address + 0x1C
 CG.flags = 16
 CG.value = 2300
end

for i, CB in ipairs(resultHO) do
 CB.address = CB.address + 0x18
 CB.flags = 16
 CB.value = 8000
end

for i, CF in ipairs(resultNO) do
 CF.address = CF.address + 0x20
 CF.flags = 16
 CF.value = 7899
end
gg.setValues(resultH)
gg.setValues(resultN)
gg.setValues(resultHO)
gg.setValues(resultNO)
gg.alert("CLICK ON ONOTHER CAR AND COME BACK THEN CLICK SET")
gg.toast("ON")
clearReset()
end

function threehp() -- 1695hp
gg.setVisible(false)
gg.setVisible(false)
gg.alert ("BUY AN ENGINE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false)

clearReset()
gg.setRanges(32)
gg.searchNumber("5124040845977993216", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x3C
 ofs.flags = 32
 end
gg.loadResults(results)
gg.refineNumber("274877906944", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x4
 ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("0", 32)
local resultH = gg.getResults(gg.getResultsCount())
local resultN = gg.getResults(gg.getResultsCount())
local resultHO = gg.getResults(gg.getResultsCount())
local resultNO = gg.getResults(gg.getResultsCount())

for i, CR in ipairs(resultH) do
 CR.address = CR.address + 0x14
 CR.flags = 16
 CR.value = 1695
end

for i, CG in ipairs(resultN) do
 CG.address = CG.address + 0x1C
 CG.flags = 16
 CG.value = 2254
end

for i, CB in ipairs(resultHO) do
 CB.address = CB.address + 0x18
 CB.flags = 16
 CB.value = 7000
end

for i, CF in ipairs(resultNO) do
 CF.address = CF.address + 0x20
 CF.flags = 16
 CF.value = 3500
end
gg.setValues(resultH)
gg.setValues(resultN)
gg.setValues(resultHO)
gg.setValues(resultNO)
gg.alert("CLICK ON ONOTHER CAR AND COME BACK THEN CLICK SET")
gg.toast("ON")
clearReset()
end

function fourhp() -- 1466hp
gg.setVisible(false)
gg.alert ("BUY AN ENGINE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5124040845977993216", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x3C
 ofs.flags = 32
 end
gg.loadResults(results)
gg.refineNumber("274877906944", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x4
 ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("0", 32)
local resultH = gg.getResults(gg.getResultsCount())
local resultN = gg.getResults(gg.getResultsCount())
local resultHO = gg.getResults(gg.getResultsCount())
local resultNO = gg.getResults(gg.getResultsCount())

for i, CR in ipairs(resultH) do
 CR.address = CR.address + 0x14
 CR.flags = 16
 CR.value = 1466
end

for i, CG in ipairs(resultN) do
 CG.address = CG.address + 0x1C
 CG.flags = 16
 CG.value = 1690
end

for i, CB in ipairs(resultHO) do
 CB.address = CB.address + 0x18
 CB.flags = 16
 CB.value = 5948
end

for i, CF in ipairs(resultNO) do
 CF.address = CF.address + 0x20
 CF.flags = 16
 CF.value = 5937
end
gg.setValues(resultH)
gg.setValues(resultN)
gg.setValues(resultHO)
gg.setValues(resultNO)
gg.alert("CLICK ON ONOTHER CAR AND COME BACK THEN CLICK SET")
gg.toast("ON")
clearReset()
end

function fivehp() -- 2000hp
gg.setVisible(false)
gg.alert ("BUY AN ENGINE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5124040845977993216", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x3C
 ofs.flags = 32
 end
gg.loadResults(results)
gg.refineNumber("274877906944", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x4
 ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("0", 32)
local resultH = gg.getResults(gg.getResultsCount())
local resultN = gg.getResults(gg.getResultsCount())
local resultHO = gg.getResults(gg.getResultsCount())
local resultNO = gg.getResults(gg.getResultsCount())

for i, CR in ipairs(resultH) do
 CR.address = CR.address + 0x14
 CR.flags = 16
 CR.value = 2000
end

for i, CG in ipairs(resultN) do
 CG.address = CG.address + 0x1C
 CG.flags = 16
 CG.value = 3000
end

for i, CB in ipairs(resultHO) do
 CB.address = CB.address + 0x18
 CB.flags = 16
 CB.value = 7000
end

for i, CF in ipairs(resultNO) do
 CF.address = CF.address + 0x20
 CF.flags = 16
 CF.value = 3500
end
gg.setValues(resultH)
gg.setValues(resultN)
gg.setValues(resultHO)
gg.setValues(resultNO)
gg.alert("CLICK ON ONOTHER CAR AND COME BACK THEN CLICK SET")
gg.toast("ON")
clearReset()
end

function sixhp() -- 300hp
gg.setVisible(false)
gg.alert ("BUY AN ENGINE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5124040845977993216", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x3C
 ofs.flags = 32
 end
gg.loadResults(results)
gg.refineNumber("274877906944", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x4
 ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("0", 32)
local resultH = gg.getResults(gg.getResultsCount())
local resultN = gg.getResults(gg.getResultsCount())
local resultHO = gg.getResults(gg.getResultsCount())
local resultNO = gg.getResults(gg.getResultsCount())

for i, CR in ipairs(resultH) do
 CR.address = CR.address + 0x14
 CR.flags = 16
 CR.value = 300
end

for i, CG in ipairs(resultN) do
 CG.address = CG.address + 0x1C
 CG.flags = 16
 CG.value = 2300
end

for i, CB in ipairs(resultHO) do
 CB.address = CB.address + 0x18
 CB.flags = 16
 CB.value = 8000
end

for i, CF in ipairs(resultNO) do
 CF.address = CF.address + 0x20
 CF.flags = 16
 CF.value = 7899
end
gg.setValues(resultH)
gg.setValues(resultN)
gg.setValues(resultHO)
gg.setValues(resultNO)
gg.alert("CLICK ON ONOTHER CAR AND COME BACK THEN CLICK SET")
gg.toast("ON")
clearReset()
end

function sevenhp() -- 98hp
gg.setVisible(false)
gg.alert ("BUY AN ENGINE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5124040845977993216", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x3C
 ofs.flags = 32
 end
gg.loadResults(results)
gg.refineNumber("274877906944", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x4
 ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("0", 32)
local resultH = gg.getResults(gg.getResultsCount())
local resultN = gg.getResults(gg.getResultsCount())
local resultHO = gg.getResults(gg.getResultsCount())
local resultNO = gg.getResults(gg.getResultsCount())

for i, CR in ipairs(resultH) do
 CR.address = CR.address + 0x14
 CR.flags = 16
 CR.value = 98
end

for i, CG in ipairs(resultN) do
 CG.address = CG.address + 0x1C
 CG.flags = 16
 CG.value = 2300
end

for i, CB in ipairs(resultHO) do
 CB.address = CB.address + 0x18
 CB.flags = 16
 CB.value = 100000
end

for i, CF in ipairs(resultNO) do
 CF.address = CF.address + 0x20
 CF.flags = 16
 CF.value = 7899
end
gg.setValues(resultH)
gg.setValues(resultN)
gg.setValues(resultHO)
gg.setValues(resultNO)
gg.alert("CLICK ON ONOTHER CAR AND COME BACK THEN CLICK SET")
gg.toast("ON")
clearReset()
end

function eighthp() -- 925hp
gg.setVisible(false)
gg.alert ("BUY AN ENGINE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5124040845977993216", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x3C
 ofs.flags = 32
 end
gg.loadResults(results)
gg.refineNumber("274877906944", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + -0x4
 ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("0", 32)
local resultH = gg.getResults(gg.getResultsCount())
local resultN = gg.getResults(gg.getResultsCount())
local resultHO = gg.getResults(gg.getResultsCount())
local resultNO = gg.getResults(gg.getResultsCount())

for i, CR in ipairs(resultH) do
 CR.address = CR.address + 0x14
 CR.flags = 16
 CR.value = 925
end

for i, CG in ipairs(resultN) do
 CG.address = CG.address + 0x1C
 CG.flags = 16
 CG.value = 1804
end

for i, CB in ipairs(resultHO) do
 CB.address = CB.address + 0x18
 CB.flags = 16
 CB.value = 7000
end

for i, CF in ipairs(resultNO) do
 CF.address = CF.address + 0x20
 CF.flags = 16
 CF.value = 3500
end
gg.setValues(resultH)
gg.setValues(resultN)
gg.setValues(resultHO)
gg.setValues(resultNO)
gg.alert("CLICK ON ONOTHER CAR AND COME BACK THEN CLICK SET")
gg.toast("ON")
clearReset()
end


function shifttimemenu()
  local menu = { 
" SHIFT TIME 0.0001 "..shift00001, 
" SHIFT TIME 1E-30 "..shift1e30, 
" SHIFT TIME 1E-29 "..shift1e29, 
" ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇸 🇭 🇮 🇫 🇹   🇹 🇮 🇲 🇪   🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
  
  if choice[1] then shifttimeone() end
  if choice[1] then shifttimetwo() end
  if choice[1] then shifttimethree() end
  if choice[1] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end



function shifttimeone() -- shift time 0.0001
if shift00001 == off then
ofst = 0x15A7730 setvalue(libil2cpp + ofst, 16, 0.0001)
gg.alert('BUY FAST GEARBOX')
gg.toast("ON")
shift00001 = on
else
ofst = 0x15A7730 setvalue(libil2cpp + ofst, 16, 0.1)
gg.toast("OFF")
shift00001 = off
end
end

function shifttimetwo() -- shift time 1e-30
gg.setVisible(false)
if shift1e30 == on then
shift1e30 = off
clearReset()
local offset1 = gg.getRangesList('libil2cpp.so')[2].start
local setoff1 = 0x15A7730
local freezeOffsets = {}
freezeOffsets[1] = {}
freezeOffsets[1].address = offset1 + setoff1
freezeOffsets[1].flags = 16
freezeOffsets[1].value = "0.1"
freezeOffsets[1].freeze = true
freezeOffsets[1].freezeType = gg.FREEZE_NORMAL
gg.addListItems(freezeOffsets)
gg.toast("OFF")
clearReset()
shift1e30 = off
else
gg.setVisible(false)
clearReset()
local offset1 = gg.getRangesList('libil2cpp.so')[2].start
local setoff1 = 0x15A7730
local freezeOffsets = {}
freezeOffsets[1] = {}
freezeOffsets[1].address = offset1 + setoff1
freezeOffsets[1].flags = 16
freezeOffsets[1].value = "1e-30"
freezeOffsets[1].freeze = true
freezeOffsets[1].freezeType = gg.FREEZE_NORMAL
gg.addListItems(freezeOffsets)
gg.alert('BUY FAST GEARBOX')
gg.toast("ON")
shift1e30 = on
end
end

function shifttimethree() -- shift time 1e-29
gg.setVisible(false)
if shift1e29 == on then
shift1e29 = off
clearReset()
local offset1 = gg.getRangesList('libil2cpp.so')[2].start
local setoff1 = 0x15A7730
local freezeOffsets = {}
freezeOffsets[1] = {}
freezeOffsets[1].address = offset1 + setoff1
freezeOffsets[1].flags = 16
freezeOffsets[1].value = "0.1"
freezeOffsets[1].freeze = true
freezeOffsets[1].freezeType = gg.FREEZE_NORMAL
gg.addListItems(freezeOffsets)
gg.toast("OFF")
clearReset()
shift1e29 = off
else
gg.setVisible(false)
clearReset()
local offset1 = gg.getRangesList('libil2cpp.so')[2].start
local setoff1 = 0x15A7730
local freezeOffsets = {}
freezeOffsets[1] = {}
freezeOffsets[1].address = offset1 + setoff1
freezeOffsets[1].flags = 16
freezeOffsets[1].value = "1e-29"
freezeOffsets[1].freeze = true
freezeOffsets[1].freezeType = gg.FREEZE_NORMAL
gg.addListItems(freezeOffsets)
gg.alert('BUY FAST GEARBOX')
gg.toast("ON")
shift1e29 = on
end
end




function copycar()
  local menu = { 
    "COPY CAR(SELL)"..cpycar,
    "COPY CAR (EXCHANGE)"..cpycarexchange,
    " ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇩 🇺 🇵 🇱 🇮 🇨 🇦 🇹 🇪    🇨 🇦 🇷 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
  
  if choice[1] then copycarsell() end
  if choice[2] then copycarexchange() end
  if choice[3] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end
 

function copycarsell() -- copy car
gg.setVisible(false)
if cpycar == on then
cpycar = off
ofst = 0x35EB4DC setvalue(libil2cpp + ofst, 16, -1.26612917e34) 
ofst = 0x35EB4E0 setvalue(libil2cpp + ofst, 16, -2.87269937e-14)
gg.toast("OFF")
cpycar = off
else
ofst = 0x35EB4DC setvalue(libil2cpp + ofst, 16, -2.74877907e11) 
ofst = 0x35EB4E0 setvalue(libil2cpp + ofst, 16, -6.13017998e13)
gg.alert("WHEN YOU SELL THE CAR THE GAME WILL DISPLAY AN ALERT YOU WILL HAVE TO RESTART THE GAME")
gg.toast("ON")
cpycar = on
end
end

function copycarexchange() -- copy car (exchange)
gg.setVisible(false)
if cpycarexchange == on then
cpycarexchange = off
ofst = 0x35E6CAC setvalue(libil2cpp + ofst, 16, -3.4632364e10)
ofst = 0x35E6CB0 setvalue(libil2cpp + ofst, 16, -4.15535768e34)
ofst = 0x35EB4DC setvalue(libil2cpp + ofst, 16, -1.26612917e34) 
ofst = 0x35EB4E0 setvalue(libil2cpp + ofst, 16, -2.87269937e-14)
gg.toast("OFF")
cpycarexchange = off
else
ofst = 0x35E6CAC setvalue(libil2cpp + ofst, 16, -2.74877907e11)
ofst = 0x35E6CB0 setvalue(libil2cpp + ofst, 16, -6.13017998e13)
ofst = 0x35EB4DC setvalue(libil2cpp + ofst, 16, -2.74877907e11)
ofst = 0x35EB4E0 setvalue(libil2cpp + ofst, 16, -6.13017998e13)
gg.alert("WHEN YOU EXCHANGE THE CAR THE GAME WILL DISPLAY AN ALERT YOU WILL HAVE TO RESTART THE GAME")
gg.toast("ON")
cpycarexchange = on
end
end



function ufomenu()

  local menu = { 
   " UFO 1 ",
   " UFO 2 ",
   " UFO 3 ",
   " CUSTOM UFO ",
   " ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇺 🇫 🇴     🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end

  if choice[1] then ufoone() end
  if choice[2] then ufotwo() end
  if choice[3] then ufothree() end
  if choice[4] then customufo() end
  if choice[5] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end
 
function ufoone() -- ufo 1
gg.setVisible(false)
gg.alert("SET THE INCLINE 10 THEN CLICK IN THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32) 
gg.searchNumber("3240099840", 32)
gg.setResult()
for i, result in ipairs(results) do
FirstResults[NIndex] = {}
FirstResults[NIndex].address = result.address + -40
FirstResults[NIndex].flags = 32
SecondResults[NIndex] = {}
SecondResults[NIndex].address = result.address + -84
SecondResults[NIndex].flags = 32
NIndex = NIndex + 1
end gg.getValue()
for i, value in ipairs(FirstResults) do
if (FirstResults[i].value == 1099511627776) and (SecondResults[i].value == 1099511627776) then
 FinalResults[NIndex] = {}
 FinalResults[NIndex] = value
NIndex = NIndex + 1
end
end
for i, FR in ipairs(FinalResults) do
FR.address = FR.address + 40
FR.flags = 16

end
gg.loadResults(FinalResults)
gg.getResults(gg.getResultsCount())
gg.editAll("-130", 16)
gg.toast("ON")
clearReset()
end

function ufotwo() -- ufo 2
gg.setVisible(false)
gg.alert("SET THE INCLINE 10 THEN CLICK IN THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32) 
gg.searchNumber("3240099840", 32)
gg.setResult()
for i, result in ipairs(results) do
FirstResults[NIndex] = {}
FirstResults[NIndex].address = result.address + -40
FirstResults[NIndex].flags = 32
SecondResults[NIndex] = {}
SecondResults[NIndex].address = result.address + -84
SecondResults[NIndex].flags = 32
NIndex = NIndex + 1
end gg.getValue()
for i, value in ipairs(FirstResults) do
if (FirstResults[i].value == 1099511627776) and (SecondResults[i].value == 1099511627776) then
 FinalResults[NIndex] = {}
 FinalResults[NIndex] = value
NIndex = NIndex + 1
end
end
for i, FR in ipairs(FinalResults) do
FR.address = FR.address + 40
FR.flags = 16

end
gg.loadResults(FinalResults)
gg.getResults(gg.getResultsCount())
gg.editAll("-90", 16)
gg.toast("ON")
clearReset()
end

function ufothree() -- ufo 3
gg.setVisible(false)
gg.alert("SET THE INCLINE 10 THEN CLICK IN THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32) 
gg.searchNumber("3240099840", 32)
gg.setResult()
for i, result in ipairs(results) do
FirstResults[NIndex] = {}
FirstResults[NIndex].address = result.address + -40
FirstResults[NIndex].flags = 32
SecondResults[NIndex] = {}
SecondResults[NIndex].address = result.address + -84
SecondResults[NIndex].flags = 32
NIndex = NIndex + 1
end gg.getValue()
for i, value in ipairs(FirstResults) do
if (FirstResults[i].value == 1099511627776) and (SecondResults[i].value == 1099511627776) then
 FinalResults[NIndex] = {}
 FinalResults[NIndex] = value
NIndex = NIndex + 1
end
end
for i, FR in ipairs(FinalResults) do
FR.address = FR.address + 40
FR.flags = 16

end
gg.loadResults(FinalResults)
gg.getResults(gg.getResultsCount())
gg.editAll("-75", 16)
gg.toast("ON")
clearReset()
end



function customufo() -- custom ufo
gg.setVisible(false)
d = gg.prompt({
 " EDIT UFO : ",
 " BACK ",
},nil,{
 "number",
 "checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[2] then
lastMenu = "ufomenu"
ufomenu()
end

gg.setVisible(false)
gg.alert("SET THE INCLINE 10 THEN CLICK IN THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32) 
gg.searchNumber("3240099840", 32)
gg.setResult()
for i, result in ipairs(results) do
FirstResults[NIndex] = {}
FirstResults[NIndex].address = result.address + -40
FirstResults[NIndex].flags = 32
SecondResults[NIndex] = {}
SecondResults[NIndex].address = result.address + -84
SecondResults[NIndex].flags = 32
NIndex = NIndex + 1
end gg.getValue()
for i, value in ipairs(FirstResults) do
if (FirstResults[i].value == 1099511627776) and (SecondResults[i].value == 1099511627776) then
 FinalResults[NIndex] = {}
 FinalResults[NIndex] = value
NIndex = NIndex + 1
end
end
for i, FR in ipairs(FinalResults) do
FR.address = FR.address + 40
FR.flags = 16

end
gg.loadResults(FinalResults)
gg.getResults(gg.getResultsCount())
gg.editAll("-"..d[1], 16)
gg.toast("ON")
clearReset()
end


function steeringanglemenu()


  local menu = { 
   " ANGLE 90 ", 
   " ANGLE 110 ", 
   " ANGLE 105 ", 
   " CUSTOM ANGLE ", 
   " ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇸 🇹 🇪 🇪 🇷 🇮 🇳 🇬   🇦 🇳 🇬 🇪 🇱  ")
  
  if not choice then
    gg.toast("CANCEL MENU")
    return
  end
  
  

   if choice[1] then angle1() end
   if choice[2] then angletwo() end
   if choice[3] then anglethree() end
   if choice[4] then customangle() end
   if choice[5] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end
 


function angle1() -- angle 1
gg.setVisible(false)
gg.alert("SET THE STEERING 30 AND SAVE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5051983251797285274", 32)
gg.setResult()
for i, result in ipairs(results) do
FirstResults[NIndex] = {}
FirstResults[NIndex].address = result.address + 76
FirstResults[NIndex].flags = 32
SecondResults[NIndex] = {}
SecondResults[NIndex].address = result.address + -4
SecondResults[NIndex].flags = 32
NIndex = NIndex + 1
end gg.getValue()
for i, value in ipairs(FirstResults) do
if (FirstResults[i].value == 4870080048181673984) and (SecondResults[i].value == 4510805389542529434) then
 FinalResults[NIndex] = {}
 FinalResults[NIndex] = value
NIndex = NIndex + 1
end
end
for i, FR in ipairs(FinalResults) do
FR.address = FR.address + -28
FR.flags = 16

end
gg.loadResults(FinalResults)
gg.refineNumber("30", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("90", 16)
gg.toast("ON")
clearReset()
end

function angletwo() -- angle 2
gg.setVisible(false)
gg.alert("SET THE STEERING 30 AND SAVE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5051983251797285274", 32)
gg.setResult()
for i, result in ipairs(results) do
FirstResults[NIndex] = {}
FirstResults[NIndex].address = result.address + 76
FirstResults[NIndex].flags = 32
SecondResults[NIndex] = {}
SecondResults[NIndex].address = result.address + -4
SecondResults[NIndex].flags = 32
NIndex = NIndex + 1
end gg.getValue()
for i, value in ipairs(FirstResults) do
if (FirstResults[i].value == 4870080048181673984) and (SecondResults[i].value == 4510805389542529434) then
 FinalResults[NIndex] = {}
 FinalResults[NIndex] = value
NIndex = NIndex + 1
end
end
for i, FR in ipairs(FinalResults) do
FR.address = FR.address + -28
FR.flags = 16

end
gg.loadResults(FinalResults)
gg.refineNumber("30", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("110", 16)
gg.toast("ON")
clearReset()
end

function  anglethree() -- angle 3
gg.setVisible(false)
gg.alert("SET THE STEERING 30 AND SAVE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5051983251797285274", 32)
gg.setResult()
for i, result in ipairs(results) do
FirstResults[NIndex] = {}
FirstResults[NIndex].address = result.address + 76
FirstResults[NIndex].flags = 32
SecondResults[NIndex] = {}
SecondResults[NIndex].address = result.address + -4
SecondResults[NIndex].flags = 32
NIndex = NIndex + 1
end gg.getValue()
for i, value in ipairs(FirstResults) do
if (FirstResults[i].value == 4870080048181673984) and (SecondResults[i].value == 4510805389542529434) then
 FinalResults[NIndex] = {}
 FinalResults[NIndex] = value
NIndex = NIndex + 1
end
end
for i, FR in ipairs(FinalResults) do
FR.address = FR.address + -28
FR.flags = 16

end
gg.loadResults(FinalResults)
gg.refineNumber("30", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("105", 16)
gg.toast("ON")
clearReset()
end


function customangle() -- custom angle
gg.setVisible(false)
d = gg.prompt({
 " EDIT ANGLE : ",
 " BACK ",
},nil,{
 "number",
 "checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[2] then
lastMenu = "steeringanglemenu"
steeringanglemenu()
end

gg.setVisible(false)
gg.alert("SET THE STEERING 30 AND SAVE THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("5051983251797285274", 32)
gg.setResult()
for i, result in ipairs(results) do
FirstResults[NIndex] = {}
FirstResults[NIndex].address = result.address + 76
FirstResults[NIndex].flags = 32
SecondResults[NIndex] = {}
SecondResults[NIndex].address = result.address + -4
SecondResults[NIndex].flags = 32
NIndex = NIndex + 1
end gg.getValue()
for i, value in ipairs(FirstResults) do
if (FirstResults[i].value == 4870080048181673984) and (SecondResults[i].value == 4510805389542529434) then
 FinalResults[NIndex] = {}
 FinalResults[NIndex] = value
NIndex = NIndex + 1
end
end
for i, FR in ipairs(FinalResults) do
FR.address = FR.address + -28
FR.flags = 16

end
gg.loadResults(FinalResults)
gg.refineNumber("30", 16)
gg.getResults(gg.getResultsCount())
gg.editAll(d[1], 16)
gg.toast("ON")
clearReset()
end


function chromemenu()
  local menu = { 
     " CHROME CAR ",
     " CHROME WHEEL ",
     " CHROME HEADLIGHT ",
     " CHROME CALIPER ", 
     " CUSTOM CHROME CAR ", 
     " CUSTOM CHROME WHEEL ",
     " CUSTOM CHROME HEADLIGHT ",
     " CUSTOM CHROME CALIPER ", 
     " ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇨 🇭 🇷 🇴 🇲 🇪    🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end

   if choice[1] then chromecar() end
   if choice[2] then chromewheel() end
   if choice[3] then chromeheadlight() end
   if choice[4] then chromecaliper() end
   if choice[5] then customchromecar() end
   if choice[6] then customchromewheel() end
   if choice[7] then customchromeheadlight() end
   if choice[8] then customchromecaliper() end
   if choice[9] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end
 
 
function chromecar() -- chrome car
gg.setVisible(false)
gg.alert("OPEN CAR COLOR SECTION THEN CLICK GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchValue("4251398048237748224", 32, nil)
if results then
offsetData(results, 0xCC, 32)
results = searchValue("2", 32, nil)
if results then

local offsets = {-0x68, -0x64, -0x60}
local modifiedResults = {}

for _, offset in ipairs(offsets) do
for i, result in ipairs(results) do
local newResult = {
address = result.address + offset,
flags = 16,
value = -99
}
table.insert(modifiedResults, newResult)
end
end

gg.setValues(modifiedResults)
gg.toast("ON")
clearReset()
end
end
end

function chromewheel() -- chrome wheel 
gg.setVisible(false)
gg.alert("OPEN CAR COLOR SECTION THEN CLICK GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchValue("4287426845256712192", 32, nil)
if results then
offsetData(results, 0x15C, 32)
results = searchValue("2", 32, nil)
if results then

local offsets = {-0x58, -0x54, -0x50}
local modifiedResults = {}

for _, offset in ipairs(offsets) do
for i, result in ipairs(results) do
local newResult = {
address = result.address + offset,
flags = 16,
value = -99
}
table.insert(modifiedResults, newResult)
end
end

gg.setValues(modifiedResults)
gg.toast("ON")
clearReset()
end
end
end

function chromeheadlight() -- chrome headlight
gg.setVisible(false)
gg.alert("GO TO HEADLIGHT AND SLIDE UP THEN CLICK GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("1", 16)
gg.getResults(9999)
gg.setVisible(false)
gg.alert("SLIDE DOWN THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("0", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE UP THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("1", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE DOWN THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("0", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE UP THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("1", 16)
gg.getResults(999999)
gg.setVisible(false)
local choice = gg.alert("PUT YOUR COLOR CODE THEN CLICK GG LOGO","GET COLOR CODE","OK")
if choice == 1 then
    local menu = gg.choice({
    " RED: #FF0000 ", -- 1
    " BLUE: #0000FF ", -- 2
    " CYAN BLUE: #00FFFF ", -- 3
    " GREEN: #00FF00 ", -- 4
    " YELLOW: #FFFF00 ", -- 5
    " ORANGE: #FF9900 ", -- 6
    " PURPLE: #9900FF ", -- 7
    " PINK: #FF00FF ", -- 8
    " WHITE: #FFFFFF ", -- 9
    }, nil, "CLICK ON COLOR CODE FOR COPIE")
    if menu == 1 then
    gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF0000") end
    if menu == 2 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#0000FF") end
    if menu == 3 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#00FFFF") end
    if menu == 4 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#00FF00") end
    if menu == 5 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FFFF00") end
    if menu == 6 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF9900") end
    if menu == 7 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#9900FF") end
    if menu == 8 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF00FF") end
    if menu == 9 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FFFFFF") end
end
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.refineNumber("1", 16)
gg.getResults(9999)
gg.editAll("9", 16)
gg.toast("ON")
clearReset()
end

function chromecaliper() -- chrome caliper
gg.setVisible(false)
gg.alert("GO TO CALIPER AND SLIDE UP THEN CLICK GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("1", 16)
gg.getResults(9999)
gg.setVisible(false)
gg.alert("SLIDE DOWN THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("0", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE UP THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("1", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE DOWN THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("0", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE UP THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("1", 16)
gg.getResults(999999)
gg.setVisible(false)
local choice = gg.alert("PUT YOUR COLOR CODE THEN CLICK GG LOGO","GET COLOR CODE","OK")
if choice == 1 then
    local menu = gg.choice({
    " RED: #FF0000 ", -- 1
    " BLUE: #0000FF ", -- 2
    " CYAN BLUE: #00FFFF ", -- 3
    " GREEN: #00FF00 ", -- 4
    " YELLOW: #FFFF00 ", -- 5
    " ORANGE: #FF9900 ", -- 6
    " PURPLE: #9900FF ", -- 7
    " PINK: #FF00FF ", -- 8
    " WHITE: #FFFFFF ", -- 9
    }, nil, "CLICK ON COLOR CODE FOR COPIE")
    if menu == 1 then
    gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF0000") end
    if menu == 2 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#0000FF") end
    if menu == 3 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#00FFFF") end
    if menu == 4 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#00FF00") end
    if menu == 5 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FFFF00") end
    if menu == 6 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF9900") end
    if menu == 7 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#9900FF") end
    if menu == 8 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF00FF") end
    if menu == 9 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FFFFFF") end
end
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.refineNumber("1", 16)
gg.getResults(9999)
gg.editAll("9", 16)
gg.toast("ON")
clearReset()
end

function customchromecar() -- custom chrome car
gg.setVisible(false)
d = gg.prompt({
 " CUSTOM CHROME CAR : ",
 " BACK ",
},nil,{
 "number",
 "checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[2] then
lastMenu = "chromemenu"
chromemenu()
end

gg.setVisible(false)
gg.alert("OPEN CAR COLOR SECTION THEN CLICK GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchValue("4251398048237748224", 32, nil)
if results then
offsetData(results, 0xCC, 32)
results = searchValue("2", 32, nil)
if results then

local offsets = {-0x68, -0x64, -0x60}
local modifiedResults = {}

for _, offset in ipairs(offsets) do
for i, result in ipairs(results) do
local newResult = {
address = result.address + offset,
flags = 16,
value = d[1]
}
table.insert(modifiedResults, newResult)
end
end

gg.setValues(modifiedResults)
gg.toast("ON")
clearReset()
end
end
end

function customchromewheel() -- custom chrome wheel
gg.setVisible(false)
d = gg.prompt({
 " CUSTOM CHROME WHEEL : ",
 " BACK ",
},nil,{
 "number",
 "checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[2] then
lastMenu = "chromemenu"
chromemenu()
end

gg.setVisible(false)
gg.alert("OPEN CAR COLOR SECTION THEN CLICK GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchValue("4287426845256712192", 32, nil)
if results then
offsetData(results, 0x15C, 32)
results = searchValue("2", 32, nil)
if results then

local offsets = {-0x58, -0x54, -0x50}
local modifiedResults = {}

for _, offset in ipairs(offsets) do
for i, result in ipairs(results) do
local newResult = {
address = result.address + offset,
flags = 16,
value = d[1]
}
table.insert(modifiedResults, newResult)
end
end
 
gg.setValues(modifiedResults)
gg.toast("ON")
clearReset()
end
end
end

function customchromeheadlight() -- custom headlight
gg.setVisible(false)
d = gg.prompt({
 " CUSTOM CHROME HEADLIGHT : ",
 " BACK ",
},nil,{
 "number",
 "checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[2] then
lastMenu = "chromemenu"
chromemenu()
end

gg.setVisible(false)
gg.alert("GO TO HEADLIGHT AND SLIDE UP THEN CLICK GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("1", 16)
gg.getResults(9999)
gg.setVisible(false)
gg.alert("SLIDE DOWN THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("0", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE UP THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("1", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE DOWN THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("0", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE UP THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("1", 16)
gg.getResults(999999)
gg.setVisible(false)
local choice = gg.alert("PUT YOUR COLOR CODE THEN CLICK GG LOGO","GET COLOR CODE","OK")
if choice == 1 then
    local menu = gg.choice({
    " RED: #FF0000 ", -- 1
    " BLUE: #0000FF ", -- 2
    " CYAN BLUE: #00FFFF ", -- 3
    " GREEN: #00FF00 ", -- 4
    " YELLOW: #FFFF00 ", -- 5
    " ORANGE: #FF9900 ", -- 6
    " PURPLE: #9900FF ", -- 7
    " PINK: #FF00FF ", -- 8
    " WHITE: #FFFFFF ", -- 9
    }, nil, "CLICK ON COLOR CODE FOR COPIE")
    if menu == 1 then
    gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF0000") end
    if menu == 2 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#0000FF") end
    if menu == 3 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#00FFFF") end
    if menu == 4 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#00FF00") end
    if menu == 5 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FFFF00") end
    if menu == 6 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF9900") end
    if menu == 7 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#9900FF") end
    if menu == 8 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF00FF") end
    if menu == 9 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FFFFFF") end
end
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.refineNumber("1", 16)
gg.getResults(9999)
gg.editAll(d[1], 16)
gg.toast("ON")
clearReset()
end

function customchromecaliper() -- chrome caliper
gg.setVisible(false)
d = gg.prompt({
 " CUSTOM CHROME CALIPER : ",
 " BACK ",
},nil,{
 "number",
 "checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[2] then
lastMenu = "chromemenu"
chromemenu()
end

gg.setVisible(false)
gg.alert("GO TO CALIPER AND SLIDE UP THEN CLICK GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("1", 16)
gg.getResults(9999)
gg.setVisible(false)
gg.alert("SLIDE DOWN THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("0", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE UP THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("1", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE DOWN THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("0", 16)
gg.getResults(999999)
gg.setVisible(false)
gg.alert("SLIDE UP THEN CLICK GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.refineNumber("1", 16)
gg.getResults(999999)
gg.setVisible(false)
local choice = gg.alert("PUT YOUR COLOR CODE THEN CLICK GG LOGO","GET COLOR CODE","OK")
if choice == 1 then
    local menu = gg.choice({
    " RED: #FF0000 ", -- 1
    " BLUE: #0000FF ", -- 2
    " CYAN BLUE: #00FFFF ", -- 3
    " GREEN: #00FF00 ", -- 4
    " YELLOW: #FFFF00 ", -- 5
    " ORANGE: #FF9900 ", -- 6
    " PURPLE: #9900FF ", -- 7
    " PINK: #FF00FF ", -- 8
    " WHITE: #FFFFFF ", -- 9
    }, nil, "CLICK ON COLOR CODE FOR COPIE")
    if menu == 1 then
    gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF0000") end
    if menu == 2 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#0000FF") end
    if menu == 3 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#00FFFF") end
    if menu == 4 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#00FF00") end
    if menu == 5 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FFFF00") end
    if menu == 6 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF9900") end
    if menu == 7 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#9900FF") end
    if menu == 8 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FF00FF") end
    if menu == 9 then gg.alert("THE CODE COLOR HAS BEEN COPIED TO THE CLIPBOARD PUT COLOR CODE THEN CLICK GG LOGO") gg.copyText("#FFFFFF") end
end
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.refineNumber("1", 16)
gg.getResults(9999)
gg.editAll(d[1], 16)
gg.toast("ON")
clearReset()
end


function custommenu()
 
  local menu = { 
     " CUSTOM MASS ", 
     " CUSTOM GEARBOX ", 
     " ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇨 🇺 🇸 🇹 🇴 🇲     🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end

   if choice[1] then custommass() end
   if choice[2] then customgearbox() end
   if choice[3] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end
 

function custommass() -- custom mass
gg.setVisible(false)
d = gg.prompt({
     " INPUT MASS : ",
     " EDIT MASS : ",
     " BACK ",
      },nil,{
     "number",
     "number",
     "checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[3] then
lastMenu = "custommenu"
custommenu()
end

clearReset()
gg.setRanges(16384)
gg.searchNumber(d[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll(d[2], gg.TYPE_FLOAT)
gg.toast("ON")
clearReset()
end

function customgearbox() -- custom gearbox
gg.setVisible(false)
d = gg.prompt({
     " EDIT GEARBOX : ",
     " BACK ",
      },nil,{
     "number",
     "checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[2] then
lastMenu = "custommenu"
custommenu()
end

gg.setVisible(false)
gg.alert("PUTS THE GEARBOX A [ 6 ] THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.setRanges(32)
gg.searchNumber("6", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll(d[1], gg.TYPE_FLOAT)
gg.toast("ON")
clearReset()
end



function racemenu()
  local menu = { 
      " 3SEC "..sec3, 
      " 5SEC "..sec5, 
      " ❌ B A C K ❌  "
  }
  
  local choice = gg.multiChoice(menu, nil, "🇷 🇦 🇨 🇪    🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
  
   if choice[1] then threesec() end
   if choice[2] then fivesec() end
   if choice[3] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end
 
function threesec() -- 3sec
gg.setVisible(false)
if sec3 == on then
sec3 = off
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("-100000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2500", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("3", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1.1", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("925", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3.6", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("4E-4", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("10000000", gg.TYPE_FLOAT)
gg.toast("OFF")
clearReset()
sec3 = off
else
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("2500", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-100000", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("1.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("3.6", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("925", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("10000000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4E-4", gg.TYPE_FLOAT)
gg.toast("ON")
clearReset()
sec3 = on
end
end

function fivesec() -- 5sec
gg.setVisible(false)
if sec5 == on then
sec5 = off
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("-100000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2500", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("30", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3.6", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("4E-4", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("10000000", gg.TYPE_FLOAT)
gg.toast("OFF")
sec5 = off
else
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("2500", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-100000", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("3.6", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("30", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(16384)
gg.searchNumber("10000000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.setVisible(false)
revert = gg.getResults(10000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4E-4", gg.TYPE_FLOAT)
gg.toast("ON")
clearReset()
sec5 = on
end
end



function longname() -- long name
gg.setVisible(false)
clearReset()
local results = searchModule("4539628425451457741", 32, "A", "LongName")
if not results then return end
local offsets = { -0x3C }
local flags = { 4 }
local valueInfo = {
{ key2 = { min = 12, max = 100 }},
}
local getResults = getResults(results, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
local v_offsets = { 0x0 }
local v_flags = { 4 }
local v_values = { 99999 }
if filterResults then
v_setValues(filterResults, v_offsets, v_flags, v_values)
end
gg.alert("NOW YOU CAN PUT A LONG NAME")
gg.toast("ON")
clearReset()
end

function unlockmenu()
  local menu = { 
    " UNLOCK TOYOTA CROWN ", 
    " UNLOCK WHEEL ", 
    " UNLOCK W16 "..unlw16, 
    " UNLOCK CLOTHES ", 
    " UNLOCK ANIMATION ", 
    " ❌ B A C K ❌ "
  }
  
  local choice = gg.multiChoice(menu, nil, "🇺 🇳 🇱 🇴 🇨 🇰    🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
  
   if choice[1] then unlocktoyotacrown() end
   if choice[2] then unlockwheel() end
   if choice[3] then unlockengine() end
   if choice[4] then unlockclothes() end
   if choice[5] then unlockanimations() end
   if choice[6] then backMenu() end
 end


function backMenu() 
lastMenu = "HOME"
HOME()
end
 
function unlocktoyotacrown() -- unlock toyota crown
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("256", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + 0x24
 ofs.flags = 32
 end
gg.loadResults(results)
gg.refineNumber("3", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
 ofs.address = ofs.address + 0x8
 ofs.flags = 4
end
gg.loadResults(results)
gg.refineNumber("218", 4)
results = gg.getResults(100000)
gg.editAll("0", 4)
gg.alert("BUY CAR 70")
gg.toast("ON")
clearReset()
end

function unlockwheel() -- wheel unlock 
clearReset()
for _, data in ipairs({
  {"0x4C", 0},
  {"0x38", 0}
}) do
  searchClass = L0_115
  searchClass("OneWheelData", data[1], false, false, 32)
  local results = gg.getResults(100000)
  for i, result in ipairs(results) do
    result.flags = 4
    result.value = data[2]
    result.freeze = true
  end
  gg.clearResults()
  gg.addListItems(results)
end
gg.toast("ON")
clearReset()
end


function unlockengine() -- unlock w16 
gg.setVisible(false)
if unlw16 == on then
unlw16 = off
ofst = 0x3301334 setvalue(libil2cpp + ofst, 16, -8.40993806e-14) 
ofst = 0x3301338 setvalue(libil2cpp + ofst, 16, -2.8720048e-14)
gg.toast("OFF")
unlw16 = off
else
ofst = 0x3301334 setvalue(libil2cpp + ofst, 16, -2.74877907e11) 
ofst = 0x3301338 setvalue(libil2cpp + ofst, 16, -6.13017998e13)
gg.alert("NOW YOU CAN BUY W16")
gg.toast("ON")
unlw16 = on
end
end



function unlockclothes() -- unlock clothes
clearReset()
gg.setRanges(32)
gg.searchNumber("257", 4)
local results = gg.getResults(33000)
if #results == 0 then
  return
end
local allowedValues = {50, 100, 150, 200, 300, 400, 500, 600, 700, 800, 1000}
local allowed = {}
for _, v in ipairs(allowedValues) do
  allowed[v] = true
end
local list1 = {}
for i, r in ipairs(results) do
  table.insert(list1, {address = r.address - 0x10, flags = 4})
end
local values1 = gg.getValues(list1)
local edits1 = {}
for i, v in ipairs(values1) do
  if allowed[v.value] then
    table.insert(edits1, {address = v.address, flags = 4, value = 1})
  end
end
local offsets = {-0x10, -0x14}
local list2 = {}
for i, r in ipairs(results) do
  for _, off in ipairs(offsets) do
    table.insert(list2, {address = r.address + off, flags = 4})
  end
end
local values2 = gg.getValues(list2)
local edits2 = {}
for i, v in ipairs(values2) do
  if v.value == 1 then
    table.insert(edits2, {address = v.address, flags = 4, value = 0})
  end
end
if #edits1 > 0 then gg.setValues(edits1) end
if #edits2 > 0 then gg.setValues(edits2) end
gg.toast("ON")
clearReset()
end

function unlockanimations() -- unlock animtion
clearReset()
searchClass = L0_115
searchClass("AnimData", "0x20", false, false, 32)
local results = gg.getResults(150)
for i, result in ipairs(results) do
result.flags = 32
result.value = 0
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
gg.toast("ON")
clearReset()
end



function premiumkits()
  local menu = { 
      "UNLOCK PREMIUM KITS",
      " ❌ B A C K ❌  "
  }
  
  local choice = gg.multiChoice(menu, nil, "🇵 🇷 🇪 🇲 🇮 🇺 🇲   🇰 🇮 🇹 🇸  ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end

   if choice[1] then premiumbk() end
   if choice[2] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end
 


function premiumbk() -- unlock premium kit
local items = {
  "SPOILER", "BUMPER", "ROOF", "HOOD", " SIDE SKIRT", "FENDER"
}
local menu = gg.choice({
  " UNLOCK PREMIUM SPOILER ",
  " UNLOCK PREMIUM BUMPER ",
  " UNLOCK PREMIUM ROOF ",
  " UNLOCK PREMIUM HOOD ",
  " UNLOCK PREMIUM SIDE SKRIT ",
  " UNLOCK PREMIUM FENDER ",
})
function unlockPremium(kit)
  gg.setVisible(false)
  gg.alert("CLICK ON " .. kit .. " PREMIUM THEN CLICK ON THE GG LOGO TO START")
  while not gg.isVisible() do gg.sleep(50) end
  gg.setVisible(false)
  clearReset()
  gg.setRanges(32)
  gg.searchNumber("7", 32)
  results = gg.getResults(100000)
  for i, ofs in ipairs(results) do
    ofs.address = ofs.address - 0xF0
    ofs.flags = 32
  end
  gg.loadResults(results)
  gg.refineNumber("2", 32)
  results = gg.getResults(100000)
  for i, ofs in ipairs(results) do
    ofs.address = ofs.address + 0x70
    ofs.flags = 32
  end
  gg.loadResults(results)
  gg.refineNumber("4294967295", 32)
  results = gg.getResults(100000)
  for i, ofs in ipairs(results) do
    ofs.address = ofs.address - 0x38
    ofs.flags = 4
  end
  gg.loadResults(results)
  gg.getResults(9999)
  local v = gg.getResults(1)
  for _, item in ipairs(v) do
    item.freeze = true
  end
  gg.addListItems(v)
  gg.clearResults()
  gg.alert("BUY OTHER " .. kit .. " THEN CLICK ON OTHER CAR AND COME BACK")
  gg.toast("ON")
end
if menu and menu >= 1 and menu <= 6 then
  unlockPremium(items[menu])
end
end




function achivementmenu()
  local menu = {
" BLOCK POST ", 
" SPEED BANNER ", 
" DRAG WINS ", 
" POLICE ", 
" TIRE BURNT ", 
" FUEL CONSUMED ", 
" CAR WASH ", 
" CAR REPAIR", 
" EMOTIONS ", 
" MARATHON ", 
" WINGMAN ", 
" GAME TIME ", 
" DRIFT MASTER ", 
" DRIFT KING ", 
" OFFROAD ", 
" ROAD KING ", 
" LEVEL ", 
" ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇦 🇨 🇭 🇮 🇻 🇪 🇲 🇪 🇳 🇹     🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
  

  if choice[1] then one() end
  if choice[2] then two() end
  if choice[3] then three() end
  if choice[4] then four() end
  if choice[5] then five() end
  if choice[6] then six() end
  if choice[7] then seven() end
  if choice[8] then eight() end
  if choice[9] then nine() end
  if choice[10] then ten() end
  if choice[11] then eleven() end
  if choice[12] then twelve() end
  if choice[13] then thirteen() end
  if choice[14] then fourteen() end
  if choice[15] then fifteen() end
  if choice[16] then sixteen() end
  if choice[17] then seventeen() end
  if choice[18] then backMenu() end
end


function backMenu() 
lastMenu = "HOME"
HOME()
end
 



function one() -- block post
clearReset()
searchClass = L0_115
searchClass("FreeDriveDb", "0x7C", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function two() -- speed banner
clearReset()
searchClass = L0_115
searchClass("FreeDriveDb", "0x8C", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function three() -- drag wins
clearReset()
searchClass = L0_115
searchClass("FreeDriveDb", "0x9C", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function four() -- police
clearReset()
searchClass = L0_115
searchClass("FreeDriveDb", "0xAC", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function five() -- tire burnt
clearReset()
searchClass = L0_115
searchClass("FreeDriveDb", "0xBC", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function six() -- fuel consumed
clearReset()
searchClass = L0_115
searchClass("FreeDriveDb", "0xCC", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function seven() -- car wash
clearReset()
searchClass = L0_115
searchClass("FreeDriveDb", "0xDC", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function eight() -- car repair
clearReset()
searchClass = L0_115
searchClass("FreeDriveDb", "0xEC", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function nine() -- emotions
clearReset()
searchClass = L0_115
searchClass("FreeDriveDb", "0xFC", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function ten() -- marathon
clearReset()
searchClass = L0_115
searchClass("LatestMoving", "0xC4", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function eleven() -- wingman
clearReset()
searchClass = L0_115
searchClass("LatestMoving", "0xD8", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function twelve() -- game time
clearReset()
searchClass = L0_115
searchClass("AnalyticService", "0x20", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function thirteen() -- drift master
clearReset()
searchClass = L0_115
searchClass("Powertrain", "0x1E0", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function fourteen() -- drift king
clearReset()
searchClass = L0_115
searchClass("Powertrain", "0x1B8", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function fifteen() -- offroad
clearReset()
searchClass = L0_115
searchClass("Powertrain", "0x1CC", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function sixteen() -- road king
clearReset()
searchClass = L0_115
searchClass("Powertrain", "0x1A4", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 4
result.value = 9999999
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
clearReset()
gg.toast("ON")
end

function seventeen() -- level
gg.setVisible(false)
gg.alert("GO TO LEVEL THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(16384)
gg.searchNumber("0.1", 16)
results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 16
result.value = 1E-40
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
gg.alert("START A LEVEL AND IT WILL AUTOMATICALLY COMPLETE IT")
clearReset()
end


function spoilermenu()

  local menu = { 
" SPOILER 1 ", 
" SPOILER 2 ", 
" SPOILER 3 ", 
" SPOILER 4 ", 
" SPOILER 5 ", 
" SPOILER 6 ", 
" SPOILER 7 ", 
" SPOILER 8 ", 
" SPOILER 9 ", 
" SPOILER 10 ", 
" SPOILER 11 ", 
" SPOILER 12 ", 
" SPOILER 13 ", 
" SPOILER 14 ", 
" SPOILER 15 ", 
" SPOILER 16 ", 
" SPOILER 17 ", 
" SPOILER 18 ", 
" SPOILER 19 ", 
" SPOILER 20 ", 
" SPOILER 21 ", 
" SPOILER 22 ", 
" SPOILER 23 ", 
" SPOILER 24 ", 
" SPOILER 25 ", 
" SPOILER 26 ", 
" SPOILER 27 ", 
" SPOILER 28 ", 
" SPOILER 29 ", 
" SPOILER 30 ", 
" SPOILER 31 ", 
" SPOILER 32 ", 
" SPOILER 33 ", 
" SPOILER 34 ", 
" SPOILER 35 ", 
" CUSTOM SPOILER ", 
" GET SPOILER CODE ",
" GET PREMIUM SPOILER ", 
" ❌ B A C K ❌ "
  }
  
  local choice = gg.multiChoice(menu, nil, "🇸 🇵 🇴 🇮 🇱 🇪 🇷    🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
if choice[1] then s1() end
   if choice[2] then s2() end
   if choice[3] then s3() end
   if choice[4] then s4() end
   if choice[5] then s5() end
   if choice[6] then s6() end
   if choice[7] then s7() end
   if choice[8] then s8() end
   if choice[9] then s9() end
   if choice[10] then s10() end
   if choice[11] then s11() end
   if choice[12] then s12() end
   if choice[13] then s13() end
   if choice[14] then s14() end
   if choice[15] then s15() end
   if choice[16] then s16() end
   if choice[17] then s17() end
   if choice[18] then s18() end
   if choice[19] then s19() end
   if choice[20] then s20() end
   if choice[21] then s21() end
    if choice[22] then s22() end
   if choice[23] then s23() end
   if choice[24] then s24() end
   if choice[25] then s25() end
   if choice[26] then s26() end
   if choice[27] then s27() end
   if choice[28] then s28() end
   if choice[29] then s29() end
   if choice[30] then s30() end
   if choice[31] then s31() end
   if choice[32] then s32() end
   if choice[33] then s33() end
   if choice[34] then s34() end
   if choice[35] then s35() end
   if choice[36] then s36() end
   if choice[37] then s37() end
   if choice[38] then s38() end
   if choice[39] then backmenu() end
end

function backmenu() 
lastMenu = "HOME"
HOME()
end
 

function s1() -- spoiler 1
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 95 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s2()  -- spoiler 2
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 172 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s3()  -- spoiler 3
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 160 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s4()  -- spoiler 4
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 120 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s5()  -- spoiler 5
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 110 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s6() -- spoiler 6
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 111 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s7()  -- spoiler 7
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 109 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s8()  -- spoiler 8
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 113 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s9()  -- spoiler 9
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 114 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s10() -- spoiler 10
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 115 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s11()  -- spoiler 11
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 117 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s12()  -- spoiler 12
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 119 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s13()  -- spoiler 13
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 106 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s14() -- spoiler 14
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 105 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s15() -- spoiler 15
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 101 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s16()  -- spoiler 16
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 171 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s17() -- spoiler 17
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 168 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s18()  -- spoiler 18
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 162 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s19() -- spoiler 19
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 161 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s20() -- spoiler 20
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 159 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s21() -- spoiler 21
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 158 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s22() -- spoiler 22
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 157 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s23() -- spoiler 23
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 156 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s24() -- spoiler 24
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 155 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s25()  -- spoiler 25
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 153 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s26()  -- spoiler 26
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 151 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s27() -- spoiler 27
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 148 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s28() -- spoiler 28
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 147 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s29() -- spoiler 29
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 146 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s30() -- spoiler 30
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 127 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s31() -- spoiler 31
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 198 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s32() -- spoiler 32
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 187 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s33()  -- spoiler 33
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 188 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s34()  -- spoiler 34
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 65 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s35()  -- spoiler 35
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { 69 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s36()  -- custom spoiler
d = gg.prompt({
" EDIT SPOILER : ", -- 1
" BACK ", -- 2
},nil,{
"number",
"checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[2] then
lastMenu = "HOME"
HOME()
end

gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "SpoilerCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
{ key2 = { min = -2, max = 249 }},
{ key3 = { 34359738368, 68719476736 }},
{ key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0 }, { 4 }, { d[1] }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function s37()  -- get spoiler code
gg.setVisible(false)
gg.alert("CLICK ON SPOILER THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("7", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0xF0
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("2", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address + 0x70
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("4294967295", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0x38
ofs.flags = 4
end
gg.loadResults(results)
gg.getResults(9999)
gg.alert("CLICK ON SPOILER TO GET CODE")
gg.setVisible(false)
local v = gg.getResults(1)
gg.setVisible(false)
while not gg.isVisible() do
local old = v[1].value
v = gg.getValues(v)
if old ~= v[1].value then 
gg.toast('Code:' .. v[1].value)
end
gg.sleep(100)
end
end

function s38() -- get premium spoiler
gg.setVisible(false)
gg.alert("CLICK ON SPOILER PREMIUM THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("7", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0xF0
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("2", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address + 0x70
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("4294967295", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0x38
ofs.flags = 4
end
gg.loadResults(results)
gg.getResults(9999)
gg.setVisible(false)
local v = gg.getResults(1)
for _, item in ipairs(v) do
    item.freeze = true
end
gg.addListItems(v)
local value = v[1] and v[1].value or nil
gg.clearResults()
gg.setVisible(false)
gg.alert("BUY OTHER SPOILER THEN CLICK ON THE GG LOGO TO START")
while true do
    if gg.isVisible() then
        break
    else
        gg.sleep(50)
    end
end
gg.setVisible(false)
local results = searchModule("1657333858397323264", 32, "A", "Spoiler")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x20, 0x14, 0x3C }
local flags = { 4, 32, 4 }
local valueInfo = {
    { key2 = { min = -2, max = 249 }},
    { key1 = { 34359738368 }},
    { key1 = { -2 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
    for i, result in ipairs(filterResults) do
        if value then
            v_setValues(filterResults, { 0 }, { 4 }, { value }, true)
        else
            print("Error : value nil")
        end
    end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end



function bumpermenu()
  local menu = { 
      " REMOVE BUMPER FRONT ", 
      " REMOVE BUMPER REAR ", 
      " GET PREMIUM BUMPER ", 
      " ❌ B A C K ❌ "
  }
  
  local choice = gg.multiChoice(menu, nil, "🇧 🇺 🇲 🇵 🇪 🇷     🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
  

   if choice[1] then removefrontbumper() end
   if choice[2] then removebackbumper() end
   if choice[3] then premiumbumper() end
   if choice[4] then backMenu() end
end

function backMenu() 
lastMenu = "HOME"
HOME()
end
 

function removefrontbumper() -- remove front bumper
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "RemoveF")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24 }
local flags = { 32, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x10 }, { 4 }, { -1 }, true)
end
end
clearReset()
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
end

function removebackbumper() -- remove rear bumper
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "RemoveR")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x28 }
local flags = { 32, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x14 }, { 4 }, { -1 }, true)
end
end
clearReset()
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
end

function premiumbumper() -- get premium bumper
gg.setVisible(false)
gg.alert("CLICK ON BUMPER PREMIUM THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("7", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0xF0
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("2", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address + 0x70
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("4294967295", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0x38
ofs.flags = 4
end
gg.loadResults(results)
gg.getResults(9999)
gg.setVisible(false)
local v = gg.getResults(1)
for _, item in ipairs(v) do
    item.freeze = true
end
gg.addListItems(v)
local value = v[1] and v[1].value or nil
gg.clearResults()
gg.setVisible(false)
gg.alert("BUY OTHER BUMPER THEN CLICK ON THE GG LOGO TO START")
while true do
    if gg.isVisible() then
        break
    else
        gg.sleep(50)
    end
end
gg.setVisible(false)
local results = searchModule("1657333858397323264", 32, "A", "Bumper")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x28 }
local flags = { 32, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
    for i, result in ipairs(filterResults) do
        if value then
            v_setValues(filterResults, { 0 }, { 4 }, { value }, true)
        else
            print("Error : value nil")
        end
    end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end



function roofmenu()
  local menu = { 
" ROOF 1 ", 
" ROOF 2 ", 
" ROOF 3 ", 
" ROOF 4 ", 
" ROOF 5 ", 
" ROOF 6 ", 
" ROOF 7 ", 
" ROOF 8 ", 
" ROOF 9 ", 
" ROOF 10 ", 
" ROOF 11 ", 
" ROOF 12 ", 
" ROOF 13 ", 
" ROOF 14 ", 
" ROOF 15 ", 
" CUSTOM ROOF ", 
" GET ROOF CODE ", 
" GET PREMIUM ROOF ", 
" ❌ B A C K ❌ "
  }
  
  local choice = gg.multiChoice(menu, nil, "🇷 🇴 🇴 🇫      🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
  
  
    
   if choice[1] then r1() end
   if choice[2] then r2() end
   if choice[3] then r3() end
   if choice[4] then r4() end
   if choice[5] then r5() end
   if choice[6] then r6() end
   if choice[7] then r7() end
   if choice[8] then r8() end
   if choice[9] then r9() end
   if choice[10] then r10() end
   if choice[11] then r11() end
   if choice[12] then r12() end
   if choice[13] then r13() end
   if choice[14] then r14() end
   if choice[15] then r15() end
   if choice[16] then r16() end
   if choice[17] then r17() end
   if choice[18] then r18() end
   if choice[19] then backmenu() end
end

function backmenu() 
lastMenu = "HOME"
HOME()
end
 
  
function r1() -- roof 1
gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 4 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r2()  -- roof 2
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 5 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r3()  -- roof 3
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 6 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r4()  -- roof 4
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 13 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r5()  -- roof 5
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 14 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r6()  -- roof 6
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 15 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r7()  -- roof 7
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 16 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r8() -- roof 8
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 17 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r9()  -- roof 9
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 20 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r10() -- roof 10
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 21 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r11() -- roof 11
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 35 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r12()  -- roof 12
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 39 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r13()  -- roof 13
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 32 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r14()  -- roof 14
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 69 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r15()  -- roof 15
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { 75 }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end
function r16() -- custom roof
d = gg.prompt({
" EDIT ROOF : ", -- 1
" BACK ", -- 2
},nil,{
"number",
"checkbox",
})

if d == nil then
gg.setVisible(false)
MENU = 0
end

if d[2] then
lastMenu = "HOME"
HOME()
end

gg.setVisible(false)
gg.alert("CLICK ON EXTERIOR THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
local results = searchModule("1657333858397323264", 32, "A", "RoofCustom")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
for i, result in ipairs(filterResults) do
v_setValues(filterResults, { 0x24, 0x20 }, { 4 }, { d[1] }, true)
end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end

function r17()  -- get roof code
gg.setVisible(false)
gg.alert("CLICK ON ROOF THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("7", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0xF0
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("2", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address + 0x70
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("4294967295", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0x38
ofs.flags = 4
end
gg.loadResults(results)
gg.getResults(9999)
gg.alert("CLICK ON ROOF TO GET CODE")
gg.setVisible(false)
local v = gg.getResults(1)
gg.setVisible(false)
while not gg.isVisible() do
local old = v[1].value
v = gg.getValues(v)
if old ~= v[1].value then 
gg.toast('Code:' .. v[1].value)
end
gg.sleep(100)
end
end

function r18()  -- get premium roof
gg.setVisible(false)
gg.alert("CLICK ON ROOF PREMIUM THEN CLICK ON THE GG LOGO TO START")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
clearReset()
gg.setRanges(32)
gg.searchNumber("7", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0xF0
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("2", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address + 0x70
ofs.flags = 32
end
gg.loadResults(results)
gg.refineNumber("4294967295", 32)
results = gg.getResults(100000)
for i, ofs in ipairs(results) do
ofs.address = ofs.address - 0x38
ofs.flags = 4
end
gg.loadResults(results)
gg.getResults(9999)
gg.setVisible(false)
local v = gg.getResults(1)
for _, item in ipairs(v) do
    item.freeze = true
end
gg.addListItems(v)
local value = v[1] and v[1].value or nil
gg.clearResults()
gg.setVisible(false)
gg.alert("BUY OTHER ROOF THEN CLICK ON THE GG LOGO TO START")
while true do
    if gg.isVisible() then
        break
    else
        gg.sleep(50)
    end
end
gg.setVisible(false)
local results = searchModule("1657333858397323264", 32, "A", "Roof")
if not results then return end local pointerResults = pointerSearch(results, -0x550, 32)
if not pointerResults then return end
local offsets = { 0x14, 0x24, 0x20 }
local flags = { 32, 4, 4 }
local valueInfo = {
{ key1 = { 34359738368 }},
{ key2 = { min = -2, max = 9 }},
}
local getResults = getResults(pointerResults, offsets, flags)
local filterResults = filterResults(getResults, valueInfo)
if filterResults then
    for i, result in ipairs(filterResults) do
        if value then
            v_setValues(filterResults, { 0 }, { 4 }, { value }, true)
        else
            print("Error : value nil")
        end
    end
end
gg.alert("CLICK A OHTER CAR AND COME BACK")
gg.toast("ON")
clearReset()
end


function premiumcar()

  local menu = { 
     " 350z ", 
     " 240sx ", 
     " Toyota carmy ", 
     " Skyline r32 ", 
     " BMW M2 ", 
      " BMW X6 ", 
      " BMW M4 g82 ", 
      " BMW M5 f90 ", 
      " Mercedes E63 ", 
      " Dodge viper ", 
      " Mercedes S65 ", 
       " Mercedes GT63 ", 
       " BMW M8 ", 
       " f1 ", 
       " BMW i8 ", 
       " Buggy ", 
       " f2 ", 
       " MOTORHOME ", 
       " LA FERRARI ", 
       " JEEP GLADIATOR ", 
       " ❌ B A C K ❌ "
  }
  
  local choice = gg.multiChoice(menu, nil, "🇵 🇷 🇪 🇲 🇮 🇺 🇲   🇨 🇦 🇷  ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end
  
   if choice[1] then onee() end
   if choice[2] then twoo() end
   if choice[3] then threee() end
   if choice[4] then fourr() end
   if choice[5] then fivee() end
   if choice[6] then sixx() end
   if choice[7] then sevenn() end
   if choice[8] then eightt() end
   if choice[9] then ninee() end
   if choice[10] then tenn() end
   if choice[11] then elevenn() end
   if choice[12] then twelvee() end
   if choice[13] then thirteenn() end
   if choice[14] then fourteenn() end
   if choice[15] then fifteenn() end
   if choice[16] then sixteenn() end
   if choice[17] then seventeen() end
   if choice[18] then eightteenn() end
   if choice[19] then nineteenn() end
   if choice[20] then twentyy() end
   if choice[21] then backmenu() end
end

function backmenu() 
lastMenu = "HOME"
HOME()
end
    
    
    
    
  
function onee() -- 350z
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 145,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function twoo()  -- 240sx
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 131,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function threee() -- toyota carmy
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 120,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function fourr() -- skyline r32
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 156,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function fivee() -- bmw m2
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 127,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end


function sixx() -- bmw x6
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 118,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function sevenn()  -- bmw m4 g82
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 153,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function eightt() -- bmw m5 f90
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 104,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function ninee() -- mercedes e63
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 114,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function tenn() -- dodge viper
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 141,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function elevenn() -- mercedes s65
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 136,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function twelvee() -- mercedes gt63
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 142,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function thirteenn() -- bmw m8
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 144,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function fourteenn() -- f1
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 155,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function fifteenn() -- bmw i8
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 138,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function sixteenn() -- buggy
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 164,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function seventeenn() -- f2
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 165,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function eightteenn() -- motorhome
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 236,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function nineteenn() -- la ferrari
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 241,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end

function twentyy() -- jeep gladiator
gg.setVisible(false)
clearReset()
gg.setRanges(32)
local results = searchModule("21474836695", 32, "A", "CarUnlock")
if not results then return end
local FinalResults = {}
for i, result in ipairs(results) do
FinalResults[#FinalResults + 1] = {
address = result.address - 0x18C,
flags = 4,
value = 243,
freeze = true
}
end
gg.addListItems(FinalResults) 
gg.removeListItems(FinalResults)
gg.setVisible(false)
gg.alert("GO FIRST CAR THEN CLICK ON THE GG LOGO")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
gg.setVisible(false)
gg.alert("CLICK MANY TIME ON BUY")
gg.sleep(7000)
ofst = 0x2FCA918 setvalue(libil2cpp + ofst, 16, 8.91018392e-28) 
ofst = 0x2FCA91C setvalue(libil2cpp + ofst, 16, 6.34119311e30)
ofst = 0x2FCA920 setvalue(libil2cpp + ofst, 16, -6.13017998e13) 
gg.toast("ON")
clearReset()
end


function unlocksiren() -- unlock siren
gg.setVisible(false)
if sirenunlock == on then
sirenunlock = off
ofst = 0x3220D2C setvalue(libil2cpp + ofst, 16, -8.4529592e-14) 
ofst = 0x3220D30 setvalue(libil2cpp + ofst, 16, -2.87131023e-14)
gg.toast("OFF")
sirenunlock = off
else
ofst = 0x3220D2C setvalue(libil2cpp + ofst, 16, 6.46245485e-27) 
ofst = 0x3220D30 setvalue(libil2cpp + ofst, 16, -6.13017998e13)
gg.alert("NOW YOU CAN BUY SIREN")
gg.toast("ON")
end
end

function fastrun() --fast run
if characterfast == on then
characterfast = off
clearReset()
gg.setRanges(32)
gg.searchNumber("25", 64)
gg.getResults(1000)
gg.refineNumber("25", 64)
gg.getResults(1000)
gg.refineNumber("25", 64)
gg.getResults(1000)
gg.editAll("1", 64)
gg.toast("OFF")
clearReset()
characterfast = off
else
clearReset()
gg.setRanges(32)
gg.searchNumber("1", 64)
gg.getResults(1000)
gg.refineNumber("1", 64)
gg.getResults(1000)
gg.refineNumber("1", 64)
gg.getResults(1000)
gg.editAll("25", 64)
gg.toast("ON")
clearReset()
characterfast = on
end
end

function bypassmenu()

  local menu = { 
" NO DAMAGE ENGINE "..nodamageEngine, 
" NO DAMAGE BODY ",
" REPAIR CAR BODY ", 
" BUY CAR 0$ (ROOM) ", 
" TIRE 0% ", 
" UNLIMITED FUEL ", 
" WALL HACK "..crosswall, 
" FIND ROOM PASSWORD", 
" ❌ B A C K ❌ ",
  }
  
  local choice = gg.multiChoice(menu, nil, "🇧 🇾 🇵 🇦 🇸 🇸     🇲 🇪 🇳 🇺 ")
  
  if not choice then
    gg.toast("Menu closed")
    return
  end

  if choice[1] then nodamagengine() end
  if choice[2] then nodaamagebody() end
  if choice[3] then repaircarbody() end
  if choice[4] then buycar() end
  if choice[5] then tireburnt() end
  if choice[6] then unlimitedfuel() end
  if choice[7] then wallhack() end
  if choice[8] then findroompw() end
  if choice[9] then backMenu() end
end


function backMenu() 
lastMenu = "HOME"
HOME()
end
 

function nodamagengine() -- no damage engine
gg.setVisible(false)
if nodamageEngine == on then
nodamageEngine = off
ofst = 0x374AE0C setvalue(libil2cpp + ofst, 16, -3.50350172e10) 
ofst = 0x374AE10 setvalue(libil2cpp + ofst, 16, -1.06376928e37)
gg.toast("OFF")
nodamageEngine = off
else
gg.setVisible(false)
ofst = 0x374AE0C setvalue(libil2cpp + ofst, 16, -2.74877907e11) 
ofst = 0x374AE10 setvalue(libil2cpp + ofst, 16, -6.13017998e13)
gg.toast("ON")
nodamageEngine = on
end
end

function nodaamagebody() -- no damage body
gg.setVisible(false)
if nodamagebody == on then
nodamagebody = off
clearReset()
gg.setRanges(32)
gg.searchNumber("95479337583", 32, false, gg.SIGN_EQUAL, 0, -1, 0)
local res = gg.getResults(10)
local edits = {}
for i, r in ipairs(res) do
  local addr = r.address - 0x30
  table.insert(edits, {address = addr, value = "256", flags = 4})
gg.setValues(edits)
gg.toast("OFF")
clearReset()
end
nodamagebody = off
else
clearReset()
gg.setRanges(32)
gg.searchNumber("95479337583", 32, false, gg.SIGN_EQUAL, 0, -1, 0)
local res = gg.getResults(10)
local edits = {}
for i, r in ipairs(res) do
  local addr = r.address - 0x30
  table.insert(edits, {address = addr, value = "1", flags = 4})
gg.setValues(edits)
gg.toast("ON")
clearReset()
nodamagebody = on
end
end
end

function repaircarbody() -- repair car body
clearReset()
gg.setRanges(32)
gg.searchNumber("95479337583", 32, false, gg.SIGN_EQUAL, 0, -1, 0)
local res = gg.getResults(10)
local edits = {}
for i, r in ipairs(res) do
  local addr = r.address - 0x30
  table.insert(edits, {address = addr, value = "257", flags = 4})
gg.setValues(edits)
gg.toast("ON")
clearReset()
end
end

function buycar() -- buy car 0$ (room)
clearReset()
searchClass = L0_115
searchClass("SellCarTrigger", "0x60", false, false, 32)
local results = gg.getResults(9999)
for i, result in ipairs(results) do
result.flags = 32
result.value = 0
result.freeze = true
end
gg.clearResults()
gg.addListItems(results)
gg.toast("ON")
clearReset()
end

function tireburnt() -- tire 0%
gg.setVisible(false)
gg.alert("GO IN ROOM THEN CLICK LOGO GG")
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end
clearReset()
gg.setVisible(false)
gg.clearResults()
gg.clearList()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("2500", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
local results = gg.getResults(200)
originalValues = {}

for i, result in ipairs(results) do
  table.insert(originalValues, {address = result.address, value = result.value, offsetAddress = result.address + 0x1C, offsetValue = gg.getValues({{address = result.address + 0x1C, flags = gg.TYPE_QWORD}})[1].value})
end

if #originalValues > 0 then
  local valuesToChange = {}
  for i, v in ipairs(originalValues) do
    table.insert(valuesToChange, {address = v.offsetAddress, value = "0", flags = gg.TYPE_FLOAT}) 
  end
  gg.setValues(valuesToChange)
gg.clearResults()
gg.setVisible(false)
gg.toast("ON")
end
clearReset()
end

function unlimitedfuel() -- unlimited fuel
clearReset()
gg.setRanges(32)
gg.searchNumber("4556721927168720896", 32)
local results = gg.getResults(100000)
for i, v in ipairs(results) do
    v.flags = 16
    v.address = v.address + -0x4
    v.value = 100
end
gg.setValues(results)
gg.toast("ON")
clearReset()
end



function wallhack() -- cross walls
gg.setVisible(false)
if crosswall == on then
crosswall = off
clearReset()
gg.setRanges(32)
gg.searchNumber("2.4611913E-38", 16)
local r = gg.getResults(1000)
for i = 1, #r do r[i].address = r[i].address + 0x30 end
gg.loadResults(r)
gg.refineNumber("999.9", 16)
r = gg.getResults(1000)
for i = 1, #r do r[i] = {address=r[i].address, flags=16, value=-10, freeze=true} end
gg.clearResults()
gg.addListItems(r)
gg.toast("OFF")
clearReset()
crosswall = off
else
clearReset()
gg.setRanges(32)
gg.searchNumber("2.4611913E-38", 16)
local r = gg.getResults(1000)
for i = 1, #r do r[i].address = r[i].address + 0x30 end
gg.loadResults(r)
gg.refineNumber("-10", 16)
r = gg.getResults(1000)
for i = 1, #r do r[i] = {address=r[i].address, flags=16, value=999.9, freeze=true} end
gg.clearResults()
gg.addListItems(r)
gg.toast("ON")
clearReset()
crosswall = on
end
end




function findroompw() -- find room password
clearReset()
searchClass = L0_115
searchClass("RoomDataItem", "0x9C", false, false, 32)
local results = gg.getResults(999999)
for i, result in ipairs(results) do
result.flags = 4
end
gg.loadResults(results)
local results = gg.getResults(gg.getResultsCount())
  local valueList = {}
  for _, v in ipairs(results) do
    table.insert(valueList, tostring(v.value))
  end

  local choice = gg.choice(valueList, nil, "CLICK ON ROOM PASSWORD FOR COPY")
  if choice then
    local selectedValue = valueList[choice]
    gg.copyText(selectedValue)
    gg.toast("Copied: " .. selectedValue)
    gg.clearResults()
  end
end

while true do
if gg.isVisible(true) then
gg.setVisible(false)
if lastMenu == "moneymenu" then
MENU = 1
moneymenu()
elseif lastMenu == "coinmenu" then
MENU = 2
coinmenu()
elseif lastMenu == "hpmenu" then
MENU = 3
hpmenu()
elseif menu == 4 then
lastMenu = "shifttimemenu"
shifttimemenu()
elseif lastMenu == "copycar" then
MENU = 5
copycar()
elseif lastMenu == "ufomenu" then
MENU = 6
ufomenu()
elseif lastMenu == "steeringanglemenu" then
MENU = 7
steeringanglemenu()
elseif lastMenu == "chromemenu" then
MENU = 8
chromemenu()
elseif lastMenu == "custommenu" then
MENU = 9
custommenu()
elseif lastMenu == "racemenu" then
MENU = 10
racemenu()
elseif lastMenu == "unlockmenu" then
MENU = 11
unlockmenu()
elseif lastMenu == "achivementmenu" then
MENU = 12
achivementmenu()
elseif lastMenu == "spoilermenu" then
MENU = 13
spoilermenu()
elseif lastMenu == "bumpermenu" then
MENU = 14
bumpermenu()
elseif lastMenu == "roofmenu" then
MENU = 15
roofmenu()
elseif lastMenu == "premiumcar" then
MENU = 16
premiumcar()
elseif lastMenu == "bypassmenu" then
MENU = 17
bypassmenu()
else
MENU = 1
HOME()
end
end
end
