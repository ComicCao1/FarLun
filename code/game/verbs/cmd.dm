/************************************************************************************************
    CMD is a catch-all verb designed for toggling things in game, light debugging, and reverting
    the features brought by updates while they're fine tuned.
***********************************************************************************************/

/client/verb/cmd(command as text)
    set hidden = 1
    switch(command)
        if("help")
            var/res
            res += "----------CMD Help----------\n"
            res += "<b>toggle-context</b> - Toggle use of the context menus\n"
            res += "<b>helpme-mouse</b> - Tutorial on mouse controls\n"
            res += "<b>lore</b> - Open a link in your browser to the lore."
            to_chat(src, res)
            return
            
        if("toggle-context")  // toggles the context menu
            show_popup_menus = !show_popup_menus
            if(show_popup_menus)    to_chat(src, "Context menus have been enabled.")
            else                    to_chat(src, "Context menus have been disabled.")
            return

        if("helpme-mouse")  // shows tutorial on how to play without ctx menu
            var/helptext = ""
            helptext += "<table border=1>"
            helptext += "<tr><th>Action</th><th>Consequence</th></tr>"
            helptext += "<tr><td><b>Drag your sprite onto another player</b></td><td>Open their interaction panel</td></tr>"
            helptext += "<tr><td><b>Control click an item</b></td><td>Use secondary action, pull if no secondary action</td></tr>"
            helptext += "<tr><td><b>Right click + help + empty hand, on human</b></td><td>Check pulse</td></tr>"
            helptext += "<tr><td><b>Alt click an item</b></td><td>Use third possible action, or view item in info panel</td></tr>"
            helptext += "<tr><td><b>Middle Click</b></td><td>Point at</td></tr>"
            helptext += "<tr><td><b>Shift + Right Click on Human <i>OR</i> Right click + grab + empty hand</b></td><td>Yank out embedded object</td></tr>"
            helptext += "<tr><td><b>Drag another player's sprite onto yours</b></td><td>View and interact with their inventory</td></tr>"
            helptext += "</table>"
            var/datum/browser/popup = new(usr, "Mouse Help", "Mouse Help", 340, 480)
            popup.set_content(helptext)
            popup.open()
            return
        
        if("lore")
            if(alert("This will open the forum in your browser. Are you sure?",,"Yes","No")!="Yes")
                return
            src << link(config.lore_link)
            return


    to_chat(src, "Command not found.")
    return