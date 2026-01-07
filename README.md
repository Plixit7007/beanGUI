# beanGUI
More of a gui system than operating system, program for a Roblox game called Waste of Space: https://www.roblox.com/games/4490046941/Waste-of-Space-ALPHA

Use the stable version as it is the more recently updated system

Add bugs and app ideas and app code in issues if you want, but I no longer play Waste of Space (or Roblox for that matter after I learned about the August situation), so I will most likely not implement anything.

Currently comes with 3 (I think?) "apps", one of which is a background image selector (you give it the imageid and it displays it on the background), one being a modem chat application called "Lima", and the last one being a non-functional terminal app, meant to have the ability to trigger ports.

I would rewrite this for WoS, but as mentioned above, I don't play Roblox anymore. If I were able to rewrite it, I would add the ability to run more than one app at a time (which would require collision detection, and behave more like a desktop system rather than a tablet), port recognition for several devices(doable with ```Get_Parts_From_Port(portid)``` instead of the normal get_part_from_port function), ingame website viewing and hosting functionality, easier app development (softcoding apps inside of the OS), and 

# Custom Hardcoded Apps

This gui system has the capability for people to write code for it, as apps can be added to the GUI on the "appsToCreate" table, and you can add code for when you press the button for them (examples for background stuff and things like that in the code). If you are going to write an app, first make sure you called ```showFrame()``` at the start, then make sure you add an if statement at the end that calls ```:Destroy()``` on all ```ScreenObject```s created in the app, and call ```:Disconnect()``` on all parts you binded an event to, AND call ```hideFrame()``` e.g: 
```
if appframeHidden == false then
    keyboard:Disconnect()

    frameThatIMadeToPutScreenObjectsIn:Destroy()
    hideFrame()
end
```
