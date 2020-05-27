var/list/donators = list()

proc/load_donators()
    establish_db_connection()
    
    if(dbcon.IsConnected())
        var/DBQuery/query = dbcon.NewQuery("SELECT ckey, level FROM erro_donators")
        query.Execute()
        while(query.NextRow())
            var/ckey = ckey(query.item[1])
            var/level = query.item[2]
            if(istext(level))        level = text2num(level)
            if(ckey && level)
                donators[ckey] = level

    else // legacy shid
        var/list/lines = file2list("config/donators.txt")
        for(var/line in lines)
            if(!length(line))                continue
            if(copytext(line,1,2) == "#")    continue

            //Split the line at every "-"
            var/list/List = splittext(line, "-")
            if(!List.len)                    continue

            var/ckey = ckey(List[1])
            if(!ckey)                        continue

            var/level = ""
            if(List.len >= 2)
                level = List[2]
            if(istext(level))        level = text2num(level)
            
            if(ckey && level)
                donators[ckey] = level

/client/New()
    if(global.donators[ckey(key)])
        donator = global.donators[ckey(key)]
    ..()

/hook/startup/proc/loadDonators()
	load_donators()
	return 1