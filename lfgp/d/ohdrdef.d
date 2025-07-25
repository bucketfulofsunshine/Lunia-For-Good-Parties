BEGIN ~OHDRDEF~

IF ~NumberOfTimesTalkedTo(0) !Global("bfsluniaaccepted","GLOBAL",1)~ THEN BEGIN 0
  SAY ~Halt! Who would enter the Pavilion of Wrath?~
  IF ~~ THEN DO ~AddJournalEntry(91528,QUEST)
~ GOTO 1
  IF ~  IfValidForPartyDialogue("hexxat")
~ THEN DO ~AddJournalEntry(91528,QUEST)
~ EXTERN ~HEXXA25J~ 16
END

IF ~NumberOfTimesTalkedTo(0) Global("bfsluniaaccepted","GLOBAL",1)~ THEN BEGIN 0
  SAY ~Halt! Who would enter the Pavilion of Wrath?~
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1 
  SAY ~Identify yourself.~
  IF ~Global("bfsluniaaccepted","GLOBAL",1)~ THEN REPLY ~I am <CHARNAME>. I was sent here to speak with Naiman Alore.~ GOTO bfs.beourguest
  IF ~PartyHasItem("OHDSIGIL") !Global("bfsluniaaccepted","GLOBAL",1)~ THEN REPLY ~I am <CHARNAME>, servant of Tyr.~ GOTO 2
  IF ~PartyHasItem("OHDSIGIL") !Global("bfsluniaaccepted","GLOBAL",1)~ THEN REPLY ~I am Rodesi Ponz, servant of Tyr.~ GOTO 9
  IF ~!IfValidForPartyDialogue("hexxat") !Global("bfsluniaaccepted","GLOBAL",1)~ THEN REPLY ~Of Righteous Wrath, you mean.~ GOTO 25
  IF ~!PartyHasItem("OHDSIGIL") !Global("bfsluniaaccepted","GLOBAL",1)~ THEN REPLY ~Stand aside. I've business with the scribe.~ GOTO 30
  IF ~PartyHasItem("OHDSIGIL") !Global("bfsluniaaccepted","GLOBAL",1)~ THEN REPLY ~Stand aside. I've business with the scribe.~ GOTO 32
END

IF ~~ THEN BEGIN 2 // from: 1.0 29.0
  SAY ~Your name is familiar to me, <CHARNAME>.~
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~I can't imagine why.~ GOTO 6
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~I can't imagine why.~ GOTO 4
  IF ~  CheckStatLT(Player1,14,CHR)
!IfValidForPartyDialogue("dorn")
~ THEN REPLY ~I wish I could say I'm surprised. Back in the Material Plane, there's a total and complete scoundrel whose name I have the misfortune to share.~ GOTO 5
  IF ~  CheckStatLT(Player1,14,CHR)
IfValidForPartyDialogue("dorn")
~ THEN REPLY ~I wish I could say I'm surprised. Back in the Material Plane, there's a total and complete scoundrel whose name I have the misfortune to share.~ GOTO 4
  IF ~  CheckStatGT(Player1,13,CHR)
~ THEN REPLY ~I wish I could say I'm surprised. Back in the Material Plane, there's a total and complete scoundrel whose name I have the misfortune to share.~ GOTO 3
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~That's fitting, as it's the name of the <PRO_MANWOMAN> who will kill you.~ GOTO 26
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~That's fitting, as it's the name of the <PRO_MANWOMAN> who will kill you.~ EXTERN ~DORN25J~ 167
END

IF ~~ THEN BEGIN 3 // from: 2.4
  SAY ~Ah. That would explain it. You may pass.~
  IF ~~ THEN DO ~AddJournalEntry(91525,INFO)
~ EXIT
END

IF ~~ THEN BEGIN 4 // from: 2.1 2.3
  SAY ~Yes, I recognize it now. At the bidding of one of our planetars, Alore recently inscribed the name in the Scroll of Retribution. Something about siding with a murderous half-oblackguard. And who is this I see beside you...?~
  IF ~  CheckStatLT(Player1,12,CHR)
~ THEN REPLY ~This is Herth Il-Khan, cousin and sworn enemy of the blackguard. He is a crusader of Tyr who wishes to see Dorn's name in the Scroll of Retribution—it will give him the strength to slay the monster and redeem his family name.~ GOTO 10
  IF ~  CheckStatGT(Player1,11,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~This is Herth Il-Khan, cousin and sworn enemy of the blackguard. He is a crusader of Tyr who wishes to see Dorn's name in the Scroll of Retribution—it will give him the strength to slay the monster and redeem his family name.~ GOTO 19
  IF ~~ THEN REPLY ~Him? That's Dorn Il-Khan.~ EXTERN ~DORN25J~ 161
END

IF ~~ THEN BEGIN 5 // from: 2.2
  SAY ~Ah yes, I recognize the name now. A planetar recently had Alore inscribe the name in the Scroll of Retribution.~
  IF ~  CheckStatLT(Player1,14,CHR)
~ THEN REPLY ~A terrible person, <CHARNAME>. They shame me.~ GOTO 23
  IF ~  CheckStatGT(Player1,13,CHR)
~ THEN REPLY ~A terrible person, <CHARNAME>. They shame me.~ GOTO 14
  IF ~  !PartyHasItem("OHDSIGIL")
~ THEN REPLY ~You can imagine my dismay to learn that someone was doing such horrible things in my name.~ GOTO 23
  IF ~  PartyHasItem("OHDSIGIL")
~ THEN REPLY ~You can imagine my dismay to learn that someone was doing such horrible things in my name.~ GOTO 14
  IF ~~ THEN REPLY ~And rightly so, as you'll soon discover.~ GOTO 7
END

IF ~~ THEN BEGIN 6 // from: 2.0
  SAY ~That's the name the planetar had Naiman inscribe on the— By the gods, you're <PRO_HIMHER>!~
  IF ~~ THEN GOTO 26
END

IF ~~ THEN BEGIN 7 // from: 5.4
  SAY ~By the gods, you're <PRO_HIMHER>!~
  IF ~~ THEN GOTO 26
END

IF ~~ THEN BEGIN 8 // from: 16.3
  SAY ~Who would have the audacity—?~
  IF ~~ THEN DO ~AddJournalEntry(91526,INFO)
Enemy()
~ EXIT
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN EXTERN ~DORN25J~ 161
END

IF ~~ THEN BEGIN 9 // from: 1.1 29.1
  SAY ~Good evening to you, Rodesi Ponz.~
  IF ~~ THEN REPLY ~I seek the Scribe of Righteous Wrath.~ GOTO 32
  IF ~~ THEN REPLY ~I hope you're right, but we'll see how good it is shortly.~ GOTO 14
  IF ~~ THEN REPLY ~I've business in the pavilion. Let me pass.~ GOTO 13
END

IF ~~ THEN BEGIN 10 // from: 4.0
  SAY ~A cousin of a half-orc blackguard and a <PRO_MANWOMAN> with the same name as the blackguard's companion. That's quite a coincidence, <CHARNAME>.~
  IF ~  PartyHasItem("OHDSIGIL")
~ THEN REPLY ~Believe me, I'm well aware of that. Sometimes I wonder which god of mischief I inadvertently wronged to be inflicted with such a namesake.~ GOTO 11
  IF ~  CheckStatLT(Player1,16,CHR)
~ THEN REPLY ~Tyr moves in mysterious ways.~ GOTO 12
  IF ~  CheckStatGT(Player1,15,CHR)
~ THEN REPLY ~Tyr moves in mysterious ways.~ GOTO 11
  IF ~~ THEN REPLY ~It is, and it's one I've little interest in discussing further. Stand aside.~ GOTO 22
END

IF ~~ THEN BEGIN 11 // from: 10.0 10.2
  SAY ~The gods are not without a sense of humor, it's true.~
  IF ~  PartyHasItem("OHDSIGIL")
~ THEN GOTO 19
  IF ~  !PartyHasItem("OHDSIGIL")
~ THEN DO ~AddJournalEntry(91526,INFO)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 12 // from: 10.1
  SAY ~That is not my experience.~
  IF ~~ THEN DO ~AddJournalEntry(91526,INFO)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 13 // from: 9.2
  SAY ~Of course.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 14 // from: 5.1 5.3 9.1
  SAY ~What is your business here?~
  IF ~~ THEN REPLY ~I need to speak with the Scribe of Righteous Wrath.~ GOTO 32
  IF ~~ THEN REPLY ~I have new names that need inclusion in the Scroll of Divine Retribution.~ GOTO 16
  IF ~  !Race(Player1,DWARF)
OR(2)
CheckStatLT(Player1,15,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY ~No business of yours, dwarf.~ GOTO 15
  IF ~  Race(Player1,DWARF)
CheckStatGT(Player1,14,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~No business of yours, dwarf.~ GOTO 19
  IF ~  !Race(Player1,DWARF)
OR(2)
CheckStatLT(Player1,15,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY ~No business of yours.~ GOTO 15
  IF ~  Race(Player1,DWARF)
CheckStatGT(Player1,14,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~No business of yours.~ GOTO 19
END

IF ~~ THEN BEGIN 15 // from: 14.2 14.4
  SAY ~You would lecture me on my duties, <PRO_RACE>?~
  IF ~  !Race(Player1,DWARF)
OR(2)
CheckStatLT(Player1,12,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY ~I meant no offense, dwarf. But I am to speak to the scribe, and no one but the scribe.~ GOTO 23
  IF ~  !Race(Player1,DWARF)
CheckStatGT(Player1,11,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~I meant no offense, dwarf. But I am to speak to the scribe, and no one but the scribe.~ GOTO 19
  IF ~  Race(Player1,DWARF)
OR(2)
CheckStatLT(Player1,12,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY ~I meant no offense. But I am to speak to the scribe, and no one but the scribe.~ GOTO 23
  IF ~  Race(Player1,DWARF)
CheckStatGT(Player1,11,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~I meant no offense. But I am to speak to the scribe, and no one but the scribe.~ GOTO 19
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Forgive me if I seemed harsh. I can see that you know your duties well and perform them with integrity and poise. I'll leave you to them.~ GOTO 35
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Forgive me if I seemed harsh. I can see that you know your duties well and perform them with integrity and poise. I'll leave you to them.~ EXTERN ~DORN25J~ 166
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Stand aside. My business is not with you.~ GOTO 22
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Stand aside. My business is not with you.~ EXTERN ~DORN25J~ 165
END

IF ~~ THEN BEGIN 16 // from: 14.1 30.2
  SAY ~Really? That's odd.~
  IF ~~ THEN REPLY ~How so?~ GOTO 17
  IF ~  OR(2)
CheckStatLT(Player1,14,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY ~These are odd times.~ GOTO 17
  IF ~  CheckStatGT(Player1,13,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~These are odd times.~ GOTO 18
  IF ~~ THEN REPLY ~Less odd than one who is inscribed in the Scroll of Retribution infiltrating Lunia and attempting to have their name removed?~ GOTO 8
END

IF ~~ THEN BEGIN 17 // from: 16.0 16.1
  SAY ~Normally, Alore receives new names from divine inspiration. Occasionally, a planetar will offer an addition, but I can't recall a champion ever doing so.~
  IF ~  !IfValidForPartyDialogue("dorn")
OR(2)
CheckStatLT(Player1,14,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY ~ 'Tis an unusual situation, I'll grant you that. But I am helpless before the will of Tyr. Please, let me pass.~ GOTO 24
  IF ~  IfValidForPartyDialogue("dorn")
OR(2)
CheckStatLT(Player1,14,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY ~ 'Tis an unusual situation, I'll grant you that. But I am helpless before the will of Tyr. Please, let me pass.~ EXTERN ~DORN25J~ 165
  IF ~  CheckStatGT(Player1,13,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~ 'Tis an unusual situation, I'll grant you that. But I am helpless before the will of Tyr. Please, let me pass.~ GOTO 19
  IF ~  CheckStatLT(Player1,12,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~Strictly 'twixt you and me, you can expect more of this sort of thing in the near future. Times are changing, my friend, and not for the better.~ GOTO 21
  IF ~  CheckStatGT(Player1,11,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~Strictly 'twixt you and me, you can expect more of this sort of thing in the near future. Times are changing, my friend, and not for the better.~ GOTO 20
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~What you recall is of no consequence. Let me through, now.~ GOTO 22
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~What you recall is of no consequence. Let me through, now.~ EXTERN ~DORN25J~ 165
END

IF ~~ THEN BEGIN 18 // from: 16.2
  SAY ~True enough. Pass.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 19 // from: 4.1 11.0 14.3 14.5 15.1 15.3 17.2 28.3
  SAY ~I'll not stand between a champion and their calling. Pass.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 20 // from: 17.4
  SAY ~These are dark days, right enough. Pass.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 21 // from: 17.3
  SAY ~You are right in that. But something's not right here...~
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~I can see there'll be no getting past you, O righteous defender. I applaud your diligence and will take my leave of you now.~ GOTO 35
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~I can see there'll be no getting past you, O righteous defender. I applaud your diligence and will take my leave of you now.~ EXTERN ~DORN25J~ 166
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~You're right about that. You've no idea how right.~ EXTERN ~DORN25J~ 165
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Last chance. Let me through, now.~ GOTO 22
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Last chance. Let me through, now.~ EXTERN ~DORN25J~ 165
END

IF ~~ THEN BEGIN 22 // from: 10.3 15.6 17.5 21.3 29.2
  SAY ~Wrong move, <PRO_RACE>.~
  IF ~~ THEN DO ~AddJournalEntry(91526,INFO)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 23 // from: 5.0 5.2 15.0 15.2 28.2
  SAY ~You speak well enough, but your words ring false. Something's not right here...~
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~You're right about that, my friend. These are dark days indeed. I commend you for your vigilance—I'll be on my way now.~ GOTO 24
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~You're right about that, my friend. These are dark days indeed. I commend you for your vigilance—I'll be on my way now.~ EXTERN ~DORN25J~ 165
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~I'll grant you it's an unusual situation. But I am helpless before the will of Tyr. Please, let me pass.~ GOTO 24
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~I'll grant you it's an unusual situation. But I am helpless before the will of Tyr. Please, let me pass.~ EXTERN ~DORN25J~ 165
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Last chance. Let me through, now.~ GOTO 24
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Last chance. Let me through, now.~ EXTERN ~DORN25J~ 165
END

IF ~~ THEN BEGIN 24 // from: 17.0 23.0 23.2 23.4
  SAY ~I cannot, not until I'm sure.~
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Then I will be on my way.~ GOTO 34
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Then I will be on my way.~ EXTERN ~DORN25J~ 166
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~You brought this on yourself.~ GOTO 34
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~You brought this on yourself.~ EXTERN ~DORN25J~ 166
END

IF ~~ THEN BEGIN 25 // from: 1.2
  SAY ~There's no other kind, here.~
  IF ~  !PartyHasItem("OHDSIGIL")
~ THEN REPLY ~Heh. True enough. I would speak with the person responsible for the Scroll of Retribution.~ GOTO 30
  IF ~  PartyHasItem("OHDSIGIL")
~ THEN REPLY ~Heh. True enough. I would speak with the person responsible for the Scroll of Retribution.~ GOTO 31
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~You're about to find how wrong you are, fool.~ GOTO 26
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~You're about to find how wrong you are, fool.~ EXTERN ~DORN25J~ 167
END

IF ~~ THEN BEGIN 26 // from: 2.5 6.0 7.0 25.2
  SAY ~Feel my wrath, <PRO_RACE>!~
  IF ~~ THEN DO ~AddJournalEntry(91526,INFO)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 27 // from:
  SAY ~Face the gods' wrath, fiend!~
  IF ~~ THEN DO ~AddJournalEntry(91526,INFO)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 28 // from: 30.0
  SAY ~Only Naiman can cross a name off the Scroll. And then only via divine inspiration. Why are you really here?~
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~You wouldn't believe me if I told you.~ GOTO 34
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~You wouldn't believe me if I told you.~ EXTERN ~DORN25J~ 167
  IF ~  OR(2)
CheckStatLT(Player1,14,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY ~I was divinely inspired to seek Naiman. Will you truly stand in my way?~ GOTO 23
  IF ~  CheckStatGT(Player1,13,CHR)
PartyHasItem("OHDSIGIL")
~ THEN REPLY ~I was divinely inspired to seek Naiman. Will you truly stand in my way?~ GOTO 19
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~I've received some divine inspiration of my own—my god says you must die.~ EXTERN ~DORN25J~ 170
END

IF ~~ THEN BEGIN 29 // from: 30.3
  SAY ~What is your name, again?~
  IF ~  PartyHasItem("OHDSIGIL")
~ THEN REPLY ~I am <CHARNAME>, servant of Tyr.~ GOTO 2
  IF ~  PartyHasItem("OHDSIGIL")
~ THEN REPLY ~I am Rodesi Ponz, servant of Tyr.~ GOTO 9
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Last chance. Let me through, now.~ GOTO 22
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY ~Last chance. Let me through, now.~ EXTERN ~DORN25J~ 165
END

IF ~~ THEN BEGIN 30 // from: 1.3 25.0
  SAY ~What business do you have with Alore?~
  IF ~~ THEN REPLY ~I've a couple names he can cross off the scroll. I took divine retribution upon them.~ GOTO 28
  IF ~~ THEN REPLY ~He's my uncle.~ GOTO 33
  IF ~~ THEN REPLY ~I have new names that need inclusion in the Scroll of Divine Retribution.~ GOTO 16
  IF ~~ THEN REPLY ~Personal business. Let me pass.~ GOTO 29
END

IF ~~ THEN BEGIN 31 // from: 25.1
  SAY ~That would be Naiman.~
  IF ~~ THEN GOTO 32
END

IF ~~ THEN BEGIN 32 // from: 1.4 9.0 14.0 31.0
  SAY ~Ho there, scribe! This <PRO_RACE> says <PRO_HESHE> has business with you.~
  IF ~~ THEN EXTERN ~OHDNAIMA~ 0
END

IF ~~ THEN BEGIN 33 // from: 30.1
  SAY ~Ho there, scribe! This <PRO_RACE> says you're <PRO_HISHER> uncle!~
  IF ~~ THEN EXTERN ~OHDNAIMA~ 27
END

IF ~~ THEN BEGIN 34 // from: 24.0 24.2 28.0
  SAY ~Defend yourself, intruder!~
  IF ~~ THEN DO ~AddJournalEntry(91526,INFO)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 35 // from: 15.4 21.0
  SAY ~You're going nowhere, <PRO_RACE>. ~
  IF ~~ THEN DO ~AddJournalEntry(91526,INFO)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN bfs.beourguest
SAY ~Oh, aye, we've been expecting you.~
= ~Never thought I'd speak with one of the condemned...but there's been a shadow over these proceedings from the start.~ 
IF ~~ THEN EXIT
END
