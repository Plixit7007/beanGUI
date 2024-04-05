local tscreen = GetPartFromPort(1, "TouchScreen")
local keyb = GetPartFromPort(2, "Keyboard")
local disk = GetPartFromPort(3, "Disk") -- KEY 'Background' IS BACKGROUND ID
local modem = GetPartFromPort(4, "Modem")

local BUILTINBACKGROUNDID = "http://www.roblox.com/asset/?id=9180622665" -- change this if you wanna make different background ids

if disk:Read("Background") == nil then -- write built in if no background id
    disk:Write("Background", BUILTINBACKGROUNDID)
end

local BackgroundId = disk:Read("Background")

local appListframeHidden = false
local appframeHidden = true
local appcodetable = {}

local VERSION = "beanOS beta 0.2"
 
local appsToCreate = { -- FORMATTED AS: Name (displayed on app button), BackgroundColor, ImageId (non working right now) (btw its pipe character or | as seperator betweeen properties)
    "Background|Light purple|noid", 
    "Lima|Wheat|noid", 
}

tscreen:ClearElements()

--
--
-- MAKE COREGUI (non cloned gui)
--
--

function bootVERSION()
    Beep(0.5)
    print("beanOS VERSION " .. VERSION)
end

bootVERSION()

local background = tscreen:CreateElement("ImageLabel", { -- background
    Position = UDim2.fromScale(0, 0);
    Size = UDim2.fromScale(1, 1);
    Image = BackgroundId;
    BackgroundColor = BrickColor.new("Dove blue")
})

local appListFrame = tscreen:CreateElement("ScrollingFrame", {
    Position = UDim2.fromScale(0, 0.5);
    Size = UDim2.fromScale(0.25, 0.5);
    BackgroundColor = BrickColor.new("Dove blue");
})

local openAppListFrame = tscreen:CreateElement("TextButton", {
    Position = UDim2.fromScale(0, 1);
    Size = UDim2.fromScale(0.2, 0.2);
    BackgroundColor = BrickColor.new("Dove blue");
    Text = "Apps";
})

local closeAppListFrame = tscreen:CreateElement("ImageButton", {
    Position = UDim2.fromScale(0.2, 0.45);
    Size = UDim2.fromScale(0.05, 0.05);
    BackgroundColor = BrickColor.new("Bright red");
    Image = "http://www.roblox.com/asset/?id=5107150301";
})

local appFrame = tscreen:CreateElement("Frame", {
    Position = UDim2.fromScale(0, 100);
    Size = UDim2.fromScale(1, 1);
    BackgroundColor = BrickColor.new("Bright red");
})
local closeAppFrame = tscreen:CreateElement("ImageButton", {
    Position = UDim2.fromScale(0.95, 0);
    Size = UDim2.fromScale(0.05, 0.05);
    Image = "http://www.roblox.com/asset/?id=5107150301";
})

appFrame:AddChild(closeAppFrame)

--
--
-- STOP MAKING COREGUI
--
--

--
--
-- start of builtin functions
--
--

function hiddenChanged()
    appListframeHidden = not appListframeHidden
    if appListframeHidden then
        hideApps()
    else
        showApps()
    end
end

function framehiddenChanged()
    appframeHidden = not appframeHidden
    if appframeHidden then
        hideFrame()
    else
        showFrame()
    end
end

function hideApps() -- dw about this, its wacky as hell gui stuff
    appListFrame:ChangeProperties({
        Position = UDim2.fromScale(100, 0.5)
    })
    closeAppListFrame:ChangeProperties({
        Position = UDim2.fromScale(100, 0.5)
    })
    openAppListFrame:ChangeProperties({
        Position = UDim2.fromScale(0, 0.8)
    })
end

function showApps() -- dw about this, its wacky as hell gui stuff
    appListFrame:ChangeProperties({
        Position = UDim2.fromScale(0, 0.5)
    })
    closeAppListFrame:ChangeProperties({
        Position = UDim2.fromScale(0.2, 0.45)
    })
    openAppListFrame:ChangeProperties({
        Position = UDim2.fromScale(0, 100)
    })
end

function showFrame()
    appListFrame:ChangeProperties({
        Position = UDim2.fromScale(100, 0)
    })
    closeAppListFrame:ChangeProperties({
        Position = UDim2.fromScale(100, 0)
    })
    openAppListFrame:ChangeProperties({
        Position = UDim2.fromScale(0, 100)
    })
    appFrame:ChangeProperties({
        Position = UDim2.fromScale(0, 0)
    })
end

function hideFrame()
    appListFrame:ChangeProperties({
        Position = UDim2.fromScale(100, 0.5)
    })
    closeAppListFrame:ChangeProperties({
        Position = UDim2.fromScale(100, 0.5)
    })
    openAppListFrame:ChangeProperties({
        Position = UDim2.fromScale(0, 0.8)
    })
    appFrame:ChangeProperties({
        Position = UDim2.fromScale(100, 0)
    })
end
--
-- end of builtin functions
--


--- PROGRAMS HERE IN ORDER



appcodetable[1] = function() -- this god forsaken thing took like 2 hours to get running, and i am so happy that it finally works now
    if appframeHidden then -- INIT
        keyboardTEXTvariableFORbackground = ""
        showFrame()
        local frame = tscreen:CreateElement("Frame", {
            Position = UDim2.fromScale(0, 0);
            Size = UDim2.fromScale(0.95, 0.95);
            BackgroundColor = BrickColor.new("Dove blue")
        })

        local BackgroundImageTextBox = tscreen:CreateElement("TextLabel", {
            Position = UDim2.fromScale(0, 0);
            Size = UDim2.fromScale(1, 0.5);
            TextSize = 16;
            Text = "No ImageID.";
        })

        local SubmitBackgroundImage = tscreen:CreateElement("TextButton", {
            Position = UDim2.fromScale(0, 0.5);
            Size = UDim2.fromScale(0.5, 0.5);
            TextSize = 25;
            Text = "Submit";
            BackgroundColor = BrickColor.new("Bright green")
        })

        local Revert = tscreen:CreateElement("TextButton", {
            Position = UDim2.fromScale(0.5, 0.5);
            Size = UDim2.fromScale(0.5, 0.5);
            TextSize = 25;
            Text = "Revert";
            BackgroundColor = BrickColor.new("Bright red")
        })
        
        appFrame:AddChild(frame)
        frame:AddChild(BackgroundImageTextBox)
        frame:AddChild(SubmitBackgroundImage)
        frame:AddChild(Revert)

        keyb:Connect("TextInputted", function(text) --> Attach the function to the event "TextInputted".
            BackgroundImageTextBox:ChangeProperties({
                Text = text;
            })
            keyboardTEXTvariableFORbackground = text
        end)

        SubmitBackgroundImage.MouseButton1Down:Connect(function()
            background:ChangeProperties({
                Image = keyboardTEXTvariableFORbackground;
            })
            disk:Write("Background", keyboardTEXTvariableFORbackground)
        end)
        Revert.MouseButton1Down:Connect(function()
            disk:Write("Background", BUILTINBACKGROUNDID)
            background:ChangeProperties({
                Image = BUILTINBACKGROUNDID;
            })
        end)

        if appframeHidden == false then -- ON END EXECUTE ACTION -- must have hideFrame() inside of and you gotta get rid of every screenobject and binding you made
            keyb:Disconnect()
            SubmitBackgroundImage:Disconnect()

            frame:Destroy()
            hideFrame()
        end
    end
end

appcodetable[2] = function()
    showFrame()

    local TextToSave = "[LIMA]: Connected. Try using '/cmds' for an overview of the chat commands or use '/changenetwork networkid' to change your connected network."
    local TextToSend = ""
    local id = 1
    local messagebeingsent = false

    local scrollframe = tscreen:CreateElement("ScrollingFrame", {
        Position = UDim2.fromScale(0, 0);
        Size = UDim2.fromScale(0.95, 0.95);
        BackgroundColor = BrickColor.new("Really black");
    })

    local ModemText = tscreen:CreateElement("TextLabel", {
        Position = UDim2.fromScale(0, 0);
        Size = UDim2.fromScale(1, 1);
        BackgroundColor = BrickColor.new("Really black");
        TextColor3 = Color3.new(0, 0.5, 0);
        TextXAlignment = "Left";
        TextYAlignment = "Top";
        Text = TextToSave;
        TextSize = 16;
        TextWrapped = true;
    })

    modem:Connect("MessageSent", function(data) --  WHY DOES IT SEND 2 MESSAGES ON THE SENDER
        TextToSave = TextToSave .. data
        if messagebeingsent == false then
            ModemText:ChangeProperties({
                Text = TextToSave
            })
        end
    end)

    keyb:Connect("TextInputted", function(text, player)
        messagebeingsent = true
        text = text:sub(1, -2)

        local textarray = string.split(text, " ")

        local cmd = textarray[1]
        local args = textarray[2]

        --MODEM CHAT COMMANDS

        if text == "/cmds" then
            TextToSave = TextToSave .. "\n" .. "[" .. "LIMA" .. "]: " .. "Commands: /clear: Clears the chat. /changenetwork (networkid): Changes the modem id to listen to and send messages from."
        else
            TextToSave = TextToSave .. "\n" .. "[" .. player .. "]: " .. text
        end

        if text == "/clear" then
            ModemText:ChangeProperties({
                Text = "";
            })
            TextToSave = "[" .. "LIMA" .. "]: " .. "Cleared text."
        end

        if cmd == "/changenetwork" then
            modem.NetworkID = tonumber(args)
            id = args
            TextToSave = TextToSave .. "\n" .. "Changed networkID to: " .. args;
        end

        ModemText:ChangeProperties({
            Text = TextToSave;
        })
        
        TextToSend = "\n" .. "[" .. player .. "]: " .. text
        modem:SendMessage(TextToSend, id)

        task.wait(1) -- add delay before messagebeingsent turns off to avoid double messages

        messagebeingsent = false
    end)

    appFrame:AddChild(scrollframe)
    scrollframe:AddChild(ModemText)

    if appframeHidden == false then
        scrollframe:Destroy()
        hideFrame()
        keyb:Disconnect()
        modem:Disconnect()
    end
end




------------------------
closeAppListFrame.MouseButton1Down:Connect(hiddenChanged) -- these few bindings are built in ones
openAppListFrame.MouseButton1Down:Connect(hiddenChanged)
closeAppFrame.MouseButton1Down:Connect(framehiddenChanged)
------------------------


------------------------ BUILT IN GUI, PLEASE DONT EDIT


local yaxis = 0
local apps = {}

local CLONINGAPP = tscreen:CreateElement("TextButton", {
    Position = UDim2.fromScale(1, 0);
    Size = UDim2.fromScale(1, 0.25);
    BackgroundColor = BrickColor.new("Bright red");
})

for i = 1, #appsToCreate, 1 do
    local appArray = appsToCreate[i]
    local formulaYaxis = #appsToCreate / (#appsToCreate * #appsToCreate)
    local appsplitarray = string.split(appArray, "|")
    
    local name = appsplitarray[1]
    local color = appsplitarray[2]
    local imageid = appsplitarray[3]

    if i == 1 then
        yaxis = 0
    else
        yaxis += formulaYaxis
    end

    local clonedApp = CLONINGAPP:Clone()

    appListFrame:AddChild(clonedApp)

    clonedApp:ChangeProperties({
        Position = UDim2.fromScale(0, yaxis);
        Size = UDim2.fromScale(1, formulaYaxis);
        BackgroundColor = BrickColor.new(color);
        Text = name;
    })

    table.insert(apps, clonedApp)
    clonedApp.MouseButton1Down:Connect(appcodetable[i])
end
