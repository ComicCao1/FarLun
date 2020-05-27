GLOBAL_LIST_EMPTY(whitelist)

/hook/startup/proc/loadWhitelist()
    load_whitelist()
    return 1

/proc/load_whitelist()
    for(var/line in file2list("config/whitelist.txt"))
        if(!length(line))				continue
        if(copytext(line,1,2) == "#")	continue
        GLOB.whitelist.Add(ckey(line))

/proc/is_whitelisted(key)
    if(ckey(key) in GLOB.whitelist)
        return 1
    if(ckey(key) in admin_datums)
        return 1
    return 0