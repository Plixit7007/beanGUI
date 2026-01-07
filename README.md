# beanGUI
GUI system for a Roblox game called Waste of Space: https://www.roblox.com/games/4490046941/Waste-of-Space-ALPHA

USE THE MAIN VERSION, UNSTABLE IS OLD AND UNFUNCTIONAL

This effectively acts as a tablet-esque program loader, allowing you to run various standalone programs on a single microcontroller, with minimal effort to make them compatible.

Add bugs and app ideas and app code in issues if you want, but I no longer play Waste of Space (or Roblox for that matter after I learned about the August situation), so I will most likely not implement anything.

Currently comes with 3 (I think?) "apps", one of which is a background image selector (you give it the imageid and it displays it on the background), one being a modem chat application called "Lima" (currently has problems with double messages), and the last one being a non-functional terminal app, meant to have the ability to trigger ports.

I would rewrite this for WoS, but as mentioned above, I don't play Roblox anymore. If I were able to rewrite it, I would add the ability to run more than one app at a time (which would require collision detection, and behave more like a desktop system rather than a tablet), port recognition for several devices(doable with ```Get_Parts_From_Port(portid)``` instead of the normal get_part_from_port function), ingame website viewing and hosting functionality, easier app development (softcoding apps inside of the OS), a proper file system (using the new library), add better modemchat support (adding custom chat formatting, and better commands), and better terminal support for spaceship computers (e.g custom files for running ship sequences, power management, reactor monitoring, perhaps universe starmap with mapped json files?).

# Custom Hardcoded Apps

You can add applications to beanGUI by editing the code, as custom apps can be added to the GUI on the "appsToCreate" table, and you can add code for when you press the button for them (examples for background stuff and things like that are in the code already, as applications). If you are going to write an app, first make sure you called ```showFrame()``` at the start, then make sure you add an if statement at the end that calls ```:Destroy()``` on all ```ScreenObject```s created in the app, and call ```:Disconnect()``` on all parts you binded an event to, AND call ```hideFrame()``` e.g: 
```
if appframeHidden == false then
    keyboard:Disconnect()

    frameThatIMadeToPutScreenObjectsIn:Destroy()
    hideFrame()
end
```
