/obj/item/weapon/propaganda_pamphlet
    name = "Pamphlet"
    desc = "Educational pamphlets given to crew by Nanotrasen."
    icon = 'icons/obj/paper.dmi'
    icon_state = "paper_talisman"
    var/html = ""
    var/deptcolor = ""
    var/department = ""
    var/body_content = list()

/obj/item/weapon/propaganda_pamphlet/New()
    html = file2text('code/game/objects/propaganda_pamphlets/template.html')  // template
    html = replacetext(html, "%department%", department)
    html = replacetext(html, "%color%", deptcolor)
    
    var/toc = ""
    for(var/section in body_content)
        toc += "<p><a href='#[section]'>[section]</a></p>\n"
    html = replacetext(html, "%toc%", toc)

    var/main_content = ""
    for(var/section in body_content)
        main_content += "<h3 name='[section]'>[section]</h4>\n"
        main_content += "<p>[body_content[section]]</p>\n"
    html = replacetext(html, "%content%", main_content)

    SetName("NT Education Pamphlet: [department]")


/obj/item/weapon/propaganda_pamphlet/examine(mob/user)
    user << browse(html, "window=[name];size=450x550;can_resize=0")