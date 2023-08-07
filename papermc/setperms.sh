#!/bin/sh

mcrcon -p mypassword "lp creategroup member"
mcrcon -p mypassword "lp creategroup vip"
mcrcon -p mypassword "lp creategroup moderator"
mcrcon -p mypassword "lp creategroup admin"
mcrcon -p mypassword "lp creategroup owner"

#GROUP PREFIXES
mcrcon -p mypassword 'lp group default meta addprefix 1 "&7[Guest] &7"'
mcrcon -p mypassword 'lp group member meta addprefix 3 "&a[Member] &7"'
mcrcon -p mypassword 'lp group vip meta addprefix 5 "&d[VIP] &7"'
mcrcon -p mypassword 'lp group moderator meta addprefix 10 "&4[Mod] &7"'
mcrcon -p mypassword 'lp group moderator meta addprefix 100 "&3[Op] &7"'
mcrcon -p mypassword 'lp group owner meta addprefix 999 "&e[Owner] &7"'

#GROUP INHERITANCE
mcrcon -p mypassword "lp group owner parent set admin"
mcrcon -p mypassword "lp group admin parent set moderator"
mcrcon -p mypassword "lp group moderator parent set vip"
mcrcon -p mypassword "lp group vip parent set member"
mcrcon -p mypassword "lp group member parent set default"

#DEFAULT GROUP
mcrcon -p mypassword "lp group default permission set essentials.help true"
mcrcon -p mypassword "lp group default permission set essentials.rules true"
mcrcon -p mypassword "lp group default permission set essentials.afk true"
mcrcon -p mypassword "lp group default permission set essentials.afk.auto true"

#MEMBER GROUP
mcrcon -p mypassword "lp group member permission set worldguard.region.wand true"
mcrcon -p mypassword "lp group member permission set worldguard.region.claim true"
mcrcon -p mypassword "lp group member permission set worldguard.region.info true"
mcrcon -p mypassword "lp group member permission set worldguard.region.redefine.own.* true"
mcrcon -p mypassword "lp group member permission set worldguard.region.remove.own.* true"
mcrcon -p mypassword "lp group member permission set worldguard.region.select.own.* true"
mcrcon -p mypassword "lp group member permission set worldguard.region.addmember.own.* true"
mcrcon -p mypassword "lp group member permission set worldguard.region.removemember.own.* true"
mcrcon -p mypassword "lp group member permission set worldguard.region.addowner.own.* true"
mcrcon -p mypassword "lp group member permission set worldguard.region.removeowner.own.* true"
mcrcon -p mypassword "lp group member permission set worldguard.region.flag.regions.own.* true"
mcrcon -p mypassword "lp group member permission set worldguard.region.flag.flags.*.*.own.* true"

mcrcon -p mypassword "lp group member permission set minecraft.say true"
mcrcon -p mypassword "lp group member permission set minecraft.tell true"
mcrcon -p mypassword "lp group member permission set minecraft.list true"
mcrcon -p mypassword "lp group member permission set essentials.playtime true"
mcrcon -p mypassword "lp group member permission set essentials.afk.message true"
mcrcon -p mypassword "lp group member permission set essentials.chat.format true"
mcrcon -p mypassword "lp group member permission set essentials.chat.color true"
mcrcon -p mypassword "lp group member permission set essentials.chat.<color> true"
mcrcon -p mypassword "lp group member permission set essentials.chat.question true"
mcrcon -p mypassword "lp group member permission set essentials.chat.url true"
mcrcon -p mypassword "lp group member permission set essentials.chat.local true"
mcrcon -p mypassword "lp group member permission set essentials.chat.receive.local true"
mcrcon -p mypassword "lp group member permission set essentials.chat.shout true"
mcrcon -p mypassword "lp group member permission set essentials.chat.receive.shout true"
mcrcon -p mypassword "lp group member permission set essentials.depth true"
mcrcon -p mypassword "lp group member permission set essentials.getpos true"
mcrcon -p mypassword "lp group member permission set essentials.suicide true"

#VIP GROUP

#MODERATOR GROUP
mcrcon -p mypassword "lp group moderator permission set essentials.ban true"
mcrcon -p mypassword "lp group moderator permission set essentials.tempban true"
mcrcon -p mypassword "lp group moderator permission set essentials.unban true"
mcrcon -p mypassword "lp group moderator permission set essentials.broadcast true"
mcrcon -p mypassword "lp group moderator permission set essentials.broadcastworld true"
mcrcon -p mypassword "lp group moderator permission set essentials.chat.ignoreexempt true"
mcrcon -p mypassword "lp group moderator permission set essentials.chat.receive.question true"
mcrcon -p mypassword "lp group moderator permission set essentials.chat.toggleshout.others true"
mcrcon -p mypassword "lp group moderator permission set essentials.getpos.others true"
mcrcon -p mypassword "lp group moderator permission set essentials.mute true"
mcrcon -p mypassword "lp group moderator permission set essentials.mute.exempt true"

#ADMIN GROUP
mcrcon -p mypassword "lp group admin permission set essentials.chat.spy true"
mcrcon -p mypassword "lp group admin permission set essentials.playtime.others true"
mcrcon -p mypassword "lp group admin permission set essentials.afk.kickexempt true"
mcrcon -p mypassword "lp group admin permission set essentials.ban.exempt true"
mcrcon -p mypassword "lp group admin permission set essentials.tempban.exempt true"
mcrcon -p mypassword "lp group admin permission set essentials.tempban.unlimited true"
mcrcon -p mypassword "lp group admin permission set essentials.chat.spy.exempt true"
mcrcon -p mypassword "lp group admin permission set essentials.gamemode true"
mcrcon -p mypassword "lp group admin permission set essentials.gamemode.all true"
mcrcon -p mypassword "lp group admin permission set essentials.gamemode.others true"
mcrcon -p mypassword "lp group admin permission set worldedit.* true"
mcrcon -p mypassword "lp group admin permission set worldguard.* true"

#OWNER GROUP

