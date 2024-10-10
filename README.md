# beanGUI
More of a gui system than operating system, but still a thing for a roblox game called waste of space: https://www.roblox.com/games/4490046941/Waste-of-Space-ALPHA

Use the stable version as it is the more recently updated system

Add bugs and app ideas and app code in issues if you want

Currently comes with 2 "apps", one of which is a background image selector (you give it the imageid and it displays it on the background), and the other being a modem chat application called "Lima".

This gui system has the capability for people to write code for it, as apps can be added to the GUI on the "appsToCreate" table, and you can add code for when you press the button for them (examples for background stuff and things like that in the code). If you are going to write an app, first make sure you called showFrame() at the start, then make sure you add an if statement at the end that calls :Destroy() on all ScreenObjects created in the app, and call :Disconnect() on all parts you binded an event to, AND call hideFrame() e.g: 
```
if appframeHidden == false then
    keyboard:Disconnect()

    frameThatIMadeToPutScreenObjectsIn:Destroy()
    hideFrame()
end
```

Gonna rewrite this whole thing at some point to work with multiple apps at one time, and to program apps in the OS, with the ability of port recognition, and custom erroring on screen when no parts on ports found. Gonna take a while because collision detection in pilot.lua isn't a built in feature
