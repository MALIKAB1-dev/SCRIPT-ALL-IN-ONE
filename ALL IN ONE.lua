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
gg.toast("CLICK GG LOGO")
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



