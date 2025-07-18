// creator  : D:\Games\Baldur's Gate II Enhanced Edition\Data\00783\app\NearInfinity.jar (v2.4-20250611)
// game     : D:\Games\Baldur's Gate II Enhanced Edition\Data\00783
// resource : OHDNAIMA.DLG
// source   : data\25Dialog.bif
// dialog   : lang\en_US\dialog.tlk
// dialogF  : (none)

BEGIN ~OHDNAIMA~

IF ~  NumberOfTimesTalkedTo(0)
~ THEN BEGIN 0 // from:
  SAY #91959 /* ~Good evening to you. I am Naiman Alore.~ [OH91959] */
  IF ~~ THEN REPLY #91987 /* ~Good to meet you, Naiman. My name is <CHARNAME>. I bring you word from Tyr.~ */ GOTO 1
  IF ~~ THEN REPLY #91988 /* ~I am Rodesi Ponz. I bring word from Tyr.~ */ GOTO 3
  IF ~~ THEN REPLY #91989 /* ~You are the scribe of Righteous Wrath?~ */ GOTO 4
  IF ~  Dead("ohdrdef")
~ THEN REPLY #91990 /* ~Soon you will be the corpse of Naiman Alore.~ */ GOTO 2
  IF ~  !Dead("ohdrdef")
~ THEN REPLY #91990 /* ~Soon you will be the corpse of Naiman Alore.~ */ EXTERN ~OHDRDEF~ 35
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #91960 /* ~<CHARNAME>? Guards? GUARDS!~ [OH91960] */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 2 // from: 0.3 3.4 5.4 6.4 7.4 9.3 10.0 10.2 10.4 12.2 13.1 16.0
  SAY #91961 /* ~Guards! Help me! GUARDS!~ [OH91961] */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 3 // from: 0.1
  SAY #91962 /* ~It is good to meet you, Rodesi. What can I do for you?~ [OH91962] */
  IF ~  !Dead("dorn")
~ THEN REPLY #91991 /* ~I've come to see two names removed from the scroll. <CHARNAME> and Dorn Il-Khan. I destroyed them both in Tyr's name.~ */ GOTO 5
  IF ~  Dead("dorn")
~ THEN REPLY #91992 /* ~I've come to see a name removed from the scroll. <CHARNAME>. I slew <PRO_HIMHER> in Tyr's name.~ */ GOTO 5
  IF ~  OR(2)
CheckStatLT(Player1,14,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY #91993 /* ~I am on a holy quest to gather several items—among them, ink and sand used in the writing of the Scroll of Retribution.~ */ GOTO 12
  IF ~  CheckStatGT(Player1,13,CHR)
OR(2)
PartyHasItem("OHDSIGIL")
CheckStatGT(Player1,17,CHR)
~ THEN REPLY #91993 /* ~I am on a holy quest to gather several items—among them, ink and sand used in the writing of the Scroll of Retribution.~ */ GOTO 11
  IF ~~ THEN REPLY #91994 /* ~You can die for a start. Actually, that'll do for an end as well.~ */ GOTO 2
END

IF ~~ THEN BEGIN 4 // from: 0.2
  SAY #91963 /* ~I do not consider myself particularly wrathful. I do have the honor of inscribing names in the Scroll of Divine Retribution.~ [OH91963] */
  IF ~  !Dead("dorn")
~ THEN REPLY #91995 /* ~I've come to see two names removed from the scroll. <CHARNAME> and Dorn Il-Khan. I destroyed them both in Tyr's name.~ */ GOTO 5
  IF ~  Dead("dorn")
~ THEN REPLY #91996 /* ~I've come to see a name removed from the scroll. <CHARNAME>. I slew <PRO_HIMHER> in Tyr's name.~ */ GOTO 5
  IF ~  OR(2)
CheckStatLT(Player1,14,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY #91997 /* ~Tyr has sent me on a holy quest to gather several items, including ink and sand used in the writing of the Scroll of Retribution.~ */ GOTO 12
  IF ~  CheckStatGT(Player1,13,CHR)
OR(2)
PartyHasItem("OHDSIGIL")
CheckStatGT(Player1,17,CHR)
~ THEN REPLY #91997 /* ~Tyr has sent me on a holy quest to gather several items, including ink and sand used in the writing of the Scroll of Retribution.~ */ GOTO 11
  IF ~~ THEN REPLY #91998 /* ~You'll also have the honor of striking a name or two.~ */ GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 3.0 3.1 4.0 4.1 4.4
  SAY #91964 /* ~You would have me remove names from the Scroll of Retribution?~ [OH91964] */
  IF ~  Dead("dorn")
~ THEN REPLY #91999 /* ~Just one name.~ */ GOTO 6
  IF ~  !Dead("dorn")
~ THEN REPLY #92000 /* ~Precisely.~ */ GOTO 6
  IF ~~ THEN REPLY #92001 /* ~That is the gods' will.~ */ GOTO 7
  IF ~~ THEN REPLY #92002 /* ~I'll do it myself if you'd like. Just give me some ink and sand.~ */ GOTO 13
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92003 /* ~Never mind. I'll do it myself.~ */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92003 /* ~Never mind. I'll do it myself.~ */ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 6 // from: 5.0 5.1
  SAY #91965 /* ~None but the gods can bid me do that.~ [OH91965] */
  IF ~  PartyHasItem("OHDSIGIL")
CheckStatLT(Player1,16,CHR)
~ THEN REPLY #92004 /* ~I am here on their behalf. See, I have a sigil.~ */ GOTO 7
  IF ~  PartyHasItem("OHDSIGIL")
CheckStatGT(Player1,15,CHR)
~ THEN REPLY #92004 /* ~I am here on their behalf. See, I have a sigil.~ */ GOTO 9
  IF ~  !PartyHasItem("OHDSIGIL")
~ THEN REPLY #92005 /* ~I am here on their behalf.~ */ GOTO 7
  IF ~~ THEN REPLY #92006 /* ~Give me some ink and sand, then. I'll make the changes myself.~ */ GOTO 13
  IF ~~ THEN REPLY #92007 /* ~I am your god now, scribe. Do as I command.~ */ GOTO 2
END

IF ~~ THEN BEGIN 7 // from: 5.2 6.0 6.2
  SAY #91966 /* ~Why would they not contact me directly?~ [OH91966] */
  IF ~  CheckStatLT(Player1,18,CHR)
~ THEN REPLY #92008 /* ~I know only what Tyr commanded me to do. Would you deny him?~ */ GOTO 8
  IF ~  CheckStatGT(Player1,17,CHR)
~ THEN REPLY #92008 /* ~I know only what Tyr commanded me to do. Would you deny him?~ */ GOTO 18
  IF ~  CheckStatLT(Player1,17,CHR)
~ THEN REPLY #92009 /* ~You'd have to ask them.~ */ GOTO 9
  IF ~  CheckStatGT(Player1,16,CHR)
~ THEN REPLY #92009 /* ~You'd have to ask them.~ */ GOTO 18
  IF ~~ THEN REPLY #92010 /* ~I am contacting you directly, scribe. Do as you're told or even the gods won't be able to save you.~ */ GOTO 2
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY #91967 /* ~First you said you were here at the behest of the gods. Then you say you're here at Tyr's command.~ [OH91967] */
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 9 // from: 6.1 7.2 8.0
  SAY #91968 /* ~This doesn't feel right.~ [OH91968] */
  IF ~~ THEN REPLY #92011 /* ~If it makes you feel better, give me some ink and sand, and I'll make the changes.~ */ GOTO 12
  IF ~  CheckStatLT(Player1,17,CHR)
~ THEN REPLY #92012 /* ~I cannot disagree. But when the gods command, I must obey.~ */ GOTO 10
  IF ~  CheckStatGT(Player1,16,CHR)
~ THEN REPLY #92012 /* ~I cannot disagree. But when the gods command, I must obey.~ */ GOTO 18
  IF ~  OR(2)
CheckStatLT(Player1,16,STR)
CheckStatLT(Player1,16,CHR)
~ THEN REPLY #92013 /* ~You're going to feel substantially less right if you don't do what I tell you.~ */ GOTO 2
  IF ~  CheckStatGT(Player1,15,STR)
CheckStatGT(Player1,15,CHR)
~ THEN REPLY #92013 /* ~You're going to feel substantially less right if you don't do what I tell you.~ */ GOTO 19
END

IF ~~ THEN BEGIN 10 // from: 9.1
  SAY #91969 /* ~No. No, I'm sorry, but I cannot do what you ask.~ [OH91969] */
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92014 /* ~And I'm sorry for what happens now.~ */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92014 /* ~And I'm sorry for what happens now.~ */ EXTERN ~DORN25J~ 162
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92015 /* ~You're going to be considerably more sorry in a couple seconds, I fear.~ */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92015 /* ~You're going to be considerably more sorry in a couple seconds, I fear.~ */ EXTERN ~DORN25J~ 162
  IF ~~ THEN REPLY #92016 /* ~I'm not asking, scribe. You will do as I command.~ */ GOTO 2
END

IF ~~ THEN BEGIN 11 // from: 3.3 4.3
  SAY #91971 /* ~For a crusader of Tyr, I've plenty of each. Here, take them with my blessing.~ [OH91971] */
  IF ~~ THEN REPLY #92017 /* ~Tyr's blessing be upon you, Naiman Alore.~ */ DO ~GiveItem("OHDINK",Player1)
~ GOTO 17
  IF ~~ THEN REPLY #92018 /* ~Many thanks, scribe. You've served Tyr well this day. Evening. You know what I mean.~ */ DO ~GiveItem("OHDINK",Player1)
~ GOTO 17
  IF ~~ THEN REPLY #92019 /* ~I have blessings enough. It's ink and sand I need.~ */ DO ~GiveItem("OHDINK",Player1)
~ GOTO 17
END

IF ~~ THEN BEGIN 12 // from: 3.2 4.2 9.0
  SAY #91972 /* ~Would that I could help you. But I am to use the ink and sand for nothing but the scroll.~ [OH91972] */
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92020 /* ~You're making a mistake, scribe. I beg you reconsider.~ */ GOTO 16
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92020 /* ~You're making a mistake, scribe. I beg you reconsider.~ */ EXTERN ~DORN25J~ 162
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92021 /* ~If I can't have the ink, I'll take your blood, scribe.~ */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92021 /* ~If I can't have the ink, I'll take your blood, scribe.~ */ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 13 // from: 5.3 6.3
  SAY #91973 /* ~I cannot allow that. Only I am permitted to use the ink and sand.~ [OH91973] */
  IF ~~ THEN REPLY #92022 /* ~Is that your final word on the matter?~ */ GOTO 14
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92023 /* ~If I can't have the ink, I'll take your blood, scribe.~ */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92023 /* ~If I can't have the ink, I'll take your blood, scribe.~ */ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 14 // from: 13.0
  SAY #91975 /* ~It is.~ [OH91975] */
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92024 /* ~Then you leave me no choice. You brought this on yourself.~ */ GOTO 15
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92024 /* ~Then you leave me no choice. You brought this on yourself.~ */ EXTERN ~DORN25J~ 162
END

IF ~~ THEN BEGIN 15 // from: 14.0
  SAY #91976 /* ~The pavilion is defiled! Guards, destroy them!~ [OH91976] */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 16 // from: 12.0
  SAY #91977 /* ~You threaten me?~ [OH91977] */
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 17 // from: 11.0 11.1 11.2
  SAY #91978 /* ~May you fare well on the remainder of your quest.~ [OH91978] */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 18 // from: 7.1 7.3 9.2
  SAY #91979 /* ~In my years of service, I've learned better than to second-guess those above. Which names would you see stricken from the record?~ [OH91979] */
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92025 /* ~<CHARNAME> and Dorn Il-Khan.~ */ DO ~AddJournalEntry(92032,INFO)
~ GOTO 20
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92026 /* ~<CHARNAME>.~ */ DO ~AddJournalEntry(97743,INFO)
SetGlobal("OHD_inscribed_dorn","GLOBAL",1)
~ GOTO 20
END

IF ~~ THEN BEGIN 19 // from: 9.4
  SAY #91980 /* ~V-very well. Whose name do you wish to see stricken from the scroll?~ [OH91980] */
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92025 /* ~<CHARNAME> and Dorn Il-Khan.~ */ DO ~AddJournalEntry(92033,INFO)
~ GOTO 20
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92026 /* ~<CHARNAME>.~ */ DO ~AddJournalEntry(97744,INFO)
SetGlobal("OHD_inscribed_dorn","GLOBAL",1)
~ GOTO 20
END

IF ~~ THEN BEGIN 20 // from: 18.0 18.1 19.0 19.1
  SAY #91981 /* ~It is done.~ [OH91981] */
  IF ~~ THEN REPLY #92027 /* ~Many thanks, scribe. You've done the gods a great service this evening. You should be proud of yourself.~ */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ GOTO 26
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92028 /* ~It's not all that's done.~ */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ GOTO 25
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92028 /* ~It's not all that's done.~ */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
DestroyItem("ohdink")
~ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 21 // from:
  SAY #91981 /* ~It is done.~ [OH91981] */
  IF ~~ THEN REPLY #92029 /* ~I thank you for your efforts and your discretion. Good evening.~ */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
SetGlobal("OHD_naimanalerts","OH5500",1)
~ EXIT
  IF ~~ THEN REPLY #92030 /* ~You've done well. Now be a good little weasel and don't mention this to anyone else. All right? I'd hate for us to meet again under less pleasant circumstances.~ */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ GOTO 23
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92031 /* ~And so are you.~ */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ GOTO 22
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92031 /* ~And so are you.~ */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
DestroyItem("ohdink")
~ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 22 // from: 21.2
  SAY #91982 /* ~No, please! I did what you asked! Guards, help me! GUARDS!~ [OH91982] */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 23 // from: 21.1
  SAY #91983 /* ~I shall tell no one, m'<PRO_LADYLORD>.~ [OH91983] */
  IF ~~ THEN DO ~SetGlobal("OHD_naimanalerts","OH5500",1)
~ EXIT
  IF ~  CheckStatGT(Player1,16,STR)
CheckStatGT(Player1,17,CHR)
~ THEN EXIT
END

IF ~  Global("OHD_naimanalerts","OH5500",2)
~ THEN BEGIN 24 // from:
  SAY #91984 /* ~Blasphemers are among us! Guards, kill them! Now, before they escape!~ [OH91984] */
  IF ~~ THEN DO ~SetGlobal("OHD_naimanalerts","OH5500",3)
ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 25 // from: 20.1
  SAY #91985 /* ~What—? No! Guards! Help me! GUARDS!~ [OH91985] */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 26 // from: 20.0
  SAY #91986 /* ~I am unworthy of your praise—but that won't stop me from accepting it. Good evening to you.~ [OH91986] */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 27 // from:
  SAY #91456 /* ~I've never set eyes on this person before.~ [OH91456] */
  IF ~~ THEN REPLY #91519 /* ~And seeing you up close now, I realize I was mistaken. Forgive me. I'll waste no more of your time.~ */ EXTERN ~OHDRDEF~ 35
  IF ~~ THEN REPLY #91520 /* ~I was but a child when last you saw me, Uncle.~ */ GOTO 28
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #91521 /* ~You'll soon wish you had, you simpering fop!~ */ EXTERN ~OHDRDEF~ 34
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #91521 /* ~You'll soon wish you had, you simpering fop!~ */ EXTERN ~DORN25J~ 170
END

IF ~~ THEN BEGIN 28 // from: 27.1
  SAY #91458 /* ~You're mistaken. I have no siblings and never married.~ [OH91458] */
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #91522 /* ~You're right. I am mistaken. Please excuse me.~ */ EXTERN ~OHDRDEF~ 35
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #91522 /* ~You're right. I am mistaken. Please excuse me.~ */ EXTERN ~DORN25J~ 168
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #91523 /* ~Well, I tried.~ */ EXTERN ~OHDRDEF~ 34
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #91523 /* ~Well, I tried.~ */ EXTERN ~DORN25J~ 167
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #91524 /* ~That's unfortunate. If you had, you might have survived the next few minutes.~ */ EXTERN ~OHDRDEF~ 34
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #91524 /* ~That's unfortunate. If you had, you might have survived the next few minutes.~ */ EXTERN ~DORN25J~ 169
END
