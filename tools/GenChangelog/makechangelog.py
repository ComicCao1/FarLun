import yaml
msg = ""
print("reading changelog")

with open("../../html/changelogs/changelog.yml", "r") as r:
    json = yaml.load(r)

with open("../../html/templates/header.html", "r") as r:
    header = r.read()

with open("../../html/templates/footer.html", "r") as r:
    footer = r.read()

msg += "<h1>Genesis: \"%s\" </h1>\n" % (json['version name'])
msg += "<i><h2> Version: %s </h2>\n</i>" % (json['version number'])
msg += "<hr>\n"
msg += "<h3> Developers </h3>\n<br><b><i>"

for coder in json['coderlist']:
    if coder == json['coderlist'][-1] and len(json['coderlist']) > 1:
        msg += f"and {coder}."
    elif len(json['coderlist']) <= 1:
        msg += coder
    else:
        msg += f"{coder}, "

msg += "</b></i><hr>\n"
msg += "<h3>Changes</h3><br>\n"
msg += "<div class='changes'>"
for x in json['changes']:
    if 'add' in x:
        msg += "<span class='add'><img src='tick-circle.png'>%s</span><br><br>\n" % (x['add'])
    if 'tweak' in x:
        msg += "<span class='change'><img src='wrench-screwdriver.png'> %s</span><br><br>\n" % (x['tweak'])
    if 'remove' in x:
        msg += "<span class='remove'><img src='cross-circle.png'> %s</span><br><br>\n" % (x['remove'])
    if 'bugfix' in x:
        msg += "<span class='improve'><img src='bug-minus.png'>%s</span><br><br>\n" % (x['bugfix'])
    if 'map' in x:
        msg += "<span class='change'><img src='map-pencil.png'> %s</span><br><br>\n" % (x['map'])
    if 'spriteadd' in x:
        msg += "<span class='add'><img src='image-plus.png'> %s</span><br><br>\n" % (x['spriteadd'])
    if 'soundadd' in x:
        msg += "<span class='add'><img src='music-plus.png'> %s</span><br><br>\n" % (x['soundadd'])
    if 'spritedel' in x:
        msg += "<span class='remove'><img src='image-minus.png'> %s</span><br><br>\n" % (x['spritedel'])
    if 'sounddel' in x:
        msg += "<span class='remove'><img src='image-minus.png'> %s</span><br><br>\n" % (x['sounddel'])
    if 'balance' in x:
        msg += "<span class='change'><img src='scales.png'> %s</span><br><br>\n" % (x['balance'])
    if 'grammar' in x:
        msg += "<span class='improve'><img src='spell-check.png'> %s</span><br><br>\n" % (x['grammar'])
    if 'wip' in x:
        msg += "<span class='improve'><img src='hard-hat-exclamation.png'> %s</span><br><br>\n" % (x['wip'])
msg += "</div>"

print(header+msg+footer)

with open("../../html/changelog.html", "w") as w:
    w.write(header+msg+footer)

print("Done!")
print("Replacing changelog with template...")
template = ""
template += "version name: \n"
template += "version number: \n" 
template += "coderlist: \n"
template += "  - Coder Name\n"
template += "changes: \n"
template += "  - foo: changes.\n"

with open("../../html/changelogs/changelog.yml", "w") as w:
    w.write(template)
