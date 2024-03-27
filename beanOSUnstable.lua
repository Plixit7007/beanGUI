local tscreen = GetPartFromPort(1, "TouchScreen")

local appListframeHidden = false
local appframeHidden = true
 
local appsToCreate = { -- FORMATTED AS: Name, BackgroundColor, ImageId (pipe character or | as seperator)
    "Placeholder 1|Dove blue|noid", 
}

tscreen:ClearElements()

--
--
-- MAKE COREGUI (non cloned gui)
--
--

local background = tscreen:CreateElement("ImageLabel", { -- background
    Position = UDim2.fromScale(0, 0);
    Size = UDim2.fromScale(1, 1);
    Image = "http://www.roblox.com/asset/?id=9180622665";
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
    Position = UDim2.fromScale(0, 0);
    Size = UDim2.fromScale(1, 1);
    BackgroundColor = BrickColor.new("Bright red");
})
local closeAppFrame = tscreen:CreateElement("ImageButton", {
    Position = UDim2.fromScale(1, 0);
    Size = UDim2.fromScale(0.05, 0.05);
    Image = "http://www.roblox.com/asset/?id=5107150301";
})

--
--
-- STOP MAKING COREGUI
--
--

--
--
-- start of coregui functions
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

-- hey line 100 noice
--
-- end of coregui functions
--
--

local appcodetable = {}


--- PROGRAMS HERE IN ORDER
appcodetable[1] = function() -- this entire god forsaken thing took me like 2 hours to get this part working and it wont even work when im finished
    if appframeHidden then
        showFrame()
    end
end
--------------------------

closeAppListFrame.MouseButton1Down:Connect(hiddenChanged)
openAppListFrame.MouseButton1Down:Connect(hiddenChanged)

closeAppFrame.MouseButton1Down:Connect(framehiddenChanged)

local yaxis = 0
local apps = {}

local basicapp = tscreen:CreateElement("ImageButton", {
    Position = UDim2.fromScale(1, 0);
    Size = UDim2.fromScale(1, 0.25);
    BackgroundColor = BrickColor.new("Bright red");
    
})

for i = 1, #appsToCreate, 1 do
    appArray = appsToCreate[i]

    local appsplitarray = string.split(appArray, "|")
    
    local name = appsplitarray[1]
    local color = appsplitarray[2]
    local imageid = appsplitarray[3]

    if i == 1 then
        yaxis = 0
    else
        yaxis += #appsToCreate / (#appsToCreate * #appsToCreate)
    end

    local clonedApp = basicapp:Clone()

    appListFrame:AddChild(clonedApp)

    clonedApp:ChangeProperties({
        Position = UDim2.fromScale(0, yaxis);
        BackgroundColor = BrickColor.new(color);
        Image = imageid;
    })

    table.insert(apps, clonedApp)
    clonedApp.MouseButton1Down:Connect(appcodetable[i])
end
