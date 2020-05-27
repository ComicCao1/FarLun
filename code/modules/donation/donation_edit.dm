/client/proc/edit_donators()
    set category = "Admin"
    set name = "Donators Panel"
    set desc = "Edit donators"
    if(!check_rights(R_PERMISSIONS))    return
    if(!dbcon.IsConnected())
        to_chat(usr, "There is no db connection!")
        return
    donator_edit_panel()

/client/proc/donator_edit_panel()
    var/panel = {"<html>
    <head>
    <title>Donator Panel</title>
    </head>
    <body>
    <p><a href='?edit_donators=1;edit=add'>Add a Donator</a></p>
    <table style="width:100%" border=1>
    <tr><th>Ckey</th><th>Level</th><th>Edit</th></tr>
    %table%
    </table>
    </body>
    </html>
    "}
    var/table = ""

    var/DBQuery/query = dbcon.NewQuery("SELECT ckey, level FROM erro_donators")
    query.Execute()
    while(query.NextRow())
        var/ckey = query.item[1]
        var/level = query.item[2]
        table += "<tr><td>[ckey]</td><td>[level]</td><td><a href='?edit_donators=1;edit=edit;ckey=[ckey]'>E</a>|<a href='?edit_donators=1;edit=remove;ckey=[ckey]'>X</a></td></tr>"
    
    panel = replacetext(panel, "%table%", table)

    var/datum/browser/popup = new(usr, "Donator Panel", "Donator Panel", 340, 480)
    popup.set_content(panel)
    popup.open()


/client/Topic(href, href_list)
    ..()
    if(href_list["edit_donators"])
        if(!check_rights(R_PERMISSIONS))        return

        if(href_list["edit"])
            switch(href_list["edit"])
                if("add")
                    var/ckey = ckey(input(usr, "Enter the donator's ckey:"))
                    var/level = text2num(input(usr, "Enter the donator's level:"))
                    if(!level)  return
                    
                    var/DBQuery/query = dbcon.NewQuery("SELECT ckey FROM erro_donators WHERE ckey='[ckey]'")
                    query.Execute()
                    
                    if(query.NextRow())
                        to_chat(usr, "This person is already in the database!")
                        return
                    
                    var/DBQuery/insert_query = dbcon.NewQuery("INSERT INTO erro_donators (ckey, level) VALUES ('[ckey]', [level])")
                    insert_query.Execute()
            
                if("edit")
                    if(href_list["ckey"])
                        var/ckey = href_list["ckey"]
                        var/DBQuery/query = dbcon.NewQuery("SELECT ckey FROM erro_donators WHERE ckey='[ckey]'")
                        query.Execute()
                        if(!query.NextRow())
                            to_chat(usr, "This person is not in the database!")
                            return
                        var/level = text2num(input(usr, "Enter the new level:"))
                        if(!level)  return
                        var/DBQuery/update_query = dbcon.NewQuery("UPDATE erro_donators SET level = [level] WHERE ckey = '[ckey]'")
                        update_query.Execute()

                if("remove")
                    if(href_list["ckey"])
                        var/ckey = href_list["ckey"]
                        if(alert("Are you sure you wish to remove [ckey] as donator?","Remove Donator?","Yes","No") != "Yes")
                            return
                        var/DBQuery/query = dbcon.NewQuery("SELECT ckey FROM erro_donators WHERE ckey='[ckey]'")
                        query.Execute()
                        if(!query.NextRow())
                            to_chat(usr, "This person is not in the database!")
                            return
                        var/DBQuery/delete_query = dbcon.NewQuery("DELETE FROM erro_donators WHERE ckey='[ckey]'")
                        delete_query.Execute()
        
        to_chat(usr, "Changes will take effect next round. Reload the panel to see your changes.")