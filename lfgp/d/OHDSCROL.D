BEGIN ~OHDSCROL~

IF ~  NumTimesTalkedTo(0) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 0 // from:
  SAY #92037 /* ~As you near the Scroll of Retribution, you can feel its power rolling over you in waves. The divine wrath it represents is a palpable energy that fills the air of the Pavilion.~ */
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #92038 /* ~The names of those despised by the gods radiate from the scroll—your own among them. In your hand you hold the quill that can see it erased.~ */
  IF ~~ THEN REPLY #92070 /* ~Do you erase your name?~ */ GOTO 3
  IF ~  IsValidForPartyDialogue("dorn")
~ THEN REPLY #92071 /* ~Do you erase Dorn's name?~ */ GOTO 6
  IF ~  IsValidForPartyDialogue("dorn")
~ THEN REPLY #92072 /* ~Do you erase your and Dorn's name?~ */ GOTO 9
END

IF ~~ THEN BEGIN 2 // from:
  SAY #92038 /* ~The names of those despised by the gods radiate from the scroll—your own among them. In your hand you hold the quill that can see it erased.~ */
  IF ~~ THEN REPLY #92070 /* ~Do you erase your name?~ */ GOTO 3
  IF ~  IsValidForPartyDialogue("dorn")
~ THEN REPLY #92071 /* ~Do you erase Dorn's name?~ */ GOTO 6
  IF ~  IsValidForPartyDialogue("dorn")
~ THEN REPLY #92072 /* ~Do you erase your and Dorn's name?~ */ DO ~EraseJournalEntry(91528)
AddJournalEntry(97745,QUEST_DONE)
~ GOTO 9
END

IF ~~ THEN BEGIN 3 // from: 1.0 2.0
  SAY #92039 /* ~Your name is no longer written in the Scroll of Retribution. The will of the gods has been defied.~ */
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY #92040 /* ~The air in the pavilion has changed somehow—your sacrilege has poisoned it, or so it seems to you. No one else seems to notice.~ */
  IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 4.0
  SAY #92041 /* ~With your name removed, there is a space in the scroll in which you could inscribe another.~ */
  IF ~~ THEN REPLY #92073 /* ~Do you erase Dorn's name?~ */ GOTO 11
  IF ~  !Dead("yaga01")
~ THEN REPLY #92075 /* ~Do you inscribe Yaga-Shura's name?~ */ DO ~SetGlobal("OHD_inscribed_yaga","GLOBAL",1)
~ GOTO 13
  IF ~  !Dead("sendai")
Global("SaradushSacked","GLOBAL",1)
~ THEN REPLY #92076 /* ~Do you inscribe Sendai's name?~ */ DO ~SetGlobal("OHD_inscribed_sendai","GLOBAL",1)
~ GOTO 13
  IF ~  !Dead("Abazigal")
Global("SaradushSacked","GLOBAL",1)
~ THEN REPLY #92077 /* ~Do you inscribe Abazigal's name?~ */ DO ~SetGlobal("OHD_inscribed_abazigal","GLOBAL",1)
~ GOTO 13
  IF ~  OR(2)
Dead("balth2")
Global("BalthazarFights","GLOBAL",1)
~ THEN REPLY #92079 /* ~Do you inscribe Melissan's name?~ */ DO ~SetGlobal("OHD_inscribed_melissan","GLOBAL",1)
~ GOTO 13
  IF ~~ THEN REPLY #92080 /* ~Do you inscribe Noober's name?~ */ DO ~SetGlobal("OHD_inscribed_noober","GLOBAL",1)
~ GOTO 13
  IF ~  !Dead("amsaemon")
~ THEN REPLY #92081 /* ~Do you inscribe Saemon Havarian's name?~ */ DO ~SetGlobal("OHD_inscribed_saemon","GLOBAL",1)
~ GOTO 13
  IF ~  Global("OHD_urgothoz_patron","GLOBAL",1)
~ THEN REPLY #92082 /* ~Do you inscribe Ur-Gothoz's name?~ */ DO ~SetGlobal("OHD_inscribed_urgothoz","GLOBAL",1)
~ GOTO 13
  IF ~  Global("OHD_azothet_patron","GLOBAL",1)
~ THEN REPLY #92083 /* ~Do you inscribe Azothet's name?~ */ DO ~SetGlobal("OHD_inscribed_azothet","GLOBAL",1)
~ GOTO 13
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ GOTO 13
END

IF ~~ THEN BEGIN 6 // from: 1.1 2.1
  SAY #92044 /* ~Dorn's name is no longer written in the Scroll of Retribution. The will of the gods has been defied.~ */
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7 // from: 6.0
  SAY #92045 /* ~The air in the pavilion has changed somehow—your sacrilege has poisoned it, or so it seems to you. No one else seems to notice.~ */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY #92046 /* ~With Dorn's name removed, there is a space in the scroll in which you could inscribe another.~ */
  IF ~~ THEN REPLY #92087 /* ~Do you erase your name?~ */ GOTO 11
  IF ~~ THEN REPLY #92075 /* ~Do you inscribe Yaga-Shura's name?~ */ DO ~SetGlobal("OHD_inscribed_yaga","GLOBAL",1)
~ GOTO 16
  IF ~~ THEN REPLY #92076 /* ~Do you inscribe Sendai's name?~ */ DO ~SetGlobal("OHD_inscribed_sendai","GLOBAL",1)
~ GOTO 16
  IF ~~ THEN REPLY #92077 /* ~Do you inscribe Abazigal's name?~ */ DO ~SetGlobal("OHD_inscribed_abazigal","GLOBAL",1)
~ GOTO 16
  IF ~  OR(2)
Dead("balth2")
Global("BalthazarFights","GLOBAL",1)
~ THEN REPLY #92079 /* ~Do you inscribe Melissan's name?~ */ DO ~SetGlobal("OHD_inscribed_melissan","GLOBAL",1)
~ GOTO 16
  IF ~~ THEN REPLY #92080 /* ~Do you inscribe Noober's name?~ */ DO ~SetGlobal("OHD_inscribed_noober","GLOBAL",1)
~ GOTO 16
  IF ~  !Dead("amsaemon")
~ THEN REPLY #92081 /* ~Do you inscribe Saemon Havarian's name?~ */ DO ~SetGlobal("OHD_inscribed_saemon","GLOBAL",1)
~ GOTO 16
  IF ~  Global("OHD_urgothoz_patron","GLOBAL",1)
~ THEN REPLY #92082 /* ~Do you inscribe Ur-Gothoz's name?~ */ DO ~SetGlobal("OHD_inscribed_urgothoz","GLOBAL",1)
~ GOTO 16
  IF ~  Global("OHD_azothet_patron","GLOBAL",1)
~ THEN REPLY #92083 /* ~Do you inscribe Azothet's name?~ */ DO ~SetGlobal("OHD_inscribed_azothet","GLOBAL",1)
~ GOTO 16
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ GOTO 16
END

IF ~~ THEN BEGIN 9 // from: 1.2 2.2
  SAY #92052 /* ~Your names are no longer written in the Scroll of Retribution. The will of the gods has been defied.~ */
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10 // from: 9.0
  SAY #92053 /* ~The air in the pavilion has changed somehow—your sacrilege has poisoned it, or so it seems to you. No one else seems to notice.~ */
  IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11 // from: 5.0 8.0 10.0
  SAY #92055 /* ~With your and Dorn's names removed, there are spaces in the scroll in which you could inscribe others.~ */
  IF ~~ THEN REPLY #92075 /* ~Do you inscribe Yaga-Shura's name?~ */ DO ~SetGlobal("OHD_inscribed_yaga","GLOBAL",1)
~ GOTO 12
  IF ~~ THEN REPLY #92076 /* ~Do you inscribe Sendai's name?~ */ DO ~SetGlobal("OHD_inscribed_sendai","GLOBAL",1)
~ GOTO 12
  IF ~~ THEN REPLY #92077 /* ~Do you inscribe Abazigal's name?~ */ DO ~SetGlobal("OHD_inscribed_abazigal","GLOBAL",1)
~ GOTO 12
  IF ~  OR(2)
Dead("balth2")
Global("BalthazarFights","GLOBAL",1)
~ THEN REPLY #92079 /* ~Do you inscribe Melissan's name?~ */ DO ~SetGlobal("OHD_inscribed_melissan","GLOBAL",1)
~ GOTO 12
  IF ~~ THEN REPLY #92080 /* ~Do you inscribe Noober's name?~ */ DO ~SetGlobal("OHD_inscribed_noober","GLOBAL",1)
~ GOTO 12
  IF ~  !Dead("amsaemon")
~ THEN REPLY #92081 /* ~Do you inscribe Saemon Havarian's name?~ */ DO ~SetGlobal("OHD_inscribed_saemon","GLOBAL",1)
~ GOTO 12
  IF ~  Global("OHD_urgothoz_patron","GLOBAL",1)
~ THEN REPLY #92082 /* ~Do you inscribe Ur-Gothoz's name?~ */ DO ~SetGlobal("OHD_inscribed_urgothoz","GLOBAL",1)
~ GOTO 12
  IF ~  Global("OHD_azothet_patron","GLOBAL",1)
~ THEN REPLY #92083 /* ~Do you inscribe Azothet's name?~ */ DO ~SetGlobal("OHD_inscribed_azothet","GLOBAL",1)
~ GOTO 12
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ GOTO 18
END

IF ~~ THEN BEGIN 12 // from: 11.0 11.1 11.2 11.3 11.4 11.5 11.6 11.7
  SAY #92056 /* ~Again, you feel the air itself change as you thwart the will of the gods. Yet another empty space remains in the Scroll of Retribution, and you still hold the quill.~ */
  IF ~  !Global("OHD_inscribed_yaga","GLOBAL",1)
~ THEN REPLY #92075 /* ~Do you inscribe Yaga-Shura's name?~ */ DO ~SetGlobal("OHD_inscribed_yaga","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_sendai","GLOBAL",1)
~ THEN REPLY #92076 /* ~Do you inscribe Sendai's name?~ */ DO ~SetGlobal("OHD_inscribed_sendai","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_abazigal","GLOBAL",1)
~ THEN REPLY #92077 /* ~Do you inscribe Abazigal's name?~ */ DO ~SetGlobal("OHD_inscribed_abazigal","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_melissan","GLOBAL",1)
OR(2)
Dead("balth2")
Global("BalthazarFights","GLOBAL",1)
~ THEN REPLY #92079 /* ~Do you inscribe Melissan's name?~ */ DO ~SetGlobal("OHD_inscribed_melissan","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_noober","GLOBAL",1)
~ THEN REPLY #92080 /* ~Do you inscribe Noober's name?~ */ DO ~SetGlobal("OHD_inscribed_noober","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_saemon","GLOBAL",1)
!Dead("amsaemon")
~ THEN REPLY #92081 /* ~Do you inscribe Saemon Havarian's name?~ */ DO ~SetGlobal("OHD_inscribed_saemon","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_urgothoz","GLOBAL",1)
Global("OHD_urgothoz_patron","GLOBAL",1)
~ THEN REPLY #92082 /* ~Do you inscribe Ur-Gothoz's name?~ */ DO ~SetGlobal("OHD_inscribed_urgothoz","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_azothet","GLOBAL",1)
Global("OHD_azothet_patron","GLOBAL",1)
~ THEN REPLY #92083 /* ~Do you inscribe Azothet's name?~ */ DO ~SetGlobal("OHD_inscribed_azothet","GLOBAL",1)
~ GOTO 15
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ GOTO 18
END

IF ~~ THEN BEGIN 13 // from: 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9
  SAY #92057 /* ~Dorn's name is still inscribed in the Scroll of Retribution.~ */
  IF ~~ THEN REPLY #92088 /* ~Do you erase the half-orc's name?~ */ GOTO 14
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ DO ~EraseJournalEntry(91528)
AddJournalEntry(97745,QUEST_DONE)
SetGlobal("OHD_inscribed_dorn","GLOBAL",1)
~ GOTO 18
END

IF ~~ THEN BEGIN 14 // from: 13.0
  SAY #92058 /* ~With Dorn's name removed, the scroll has another blank space you could fill... if you dare.~ */
  IF ~  !Global("OHD_inscribed_yaga","GLOBAL",1)
~ THEN REPLY #92075 /* ~Do you inscribe Yaga-Shura's name?~ */ DO ~SetGlobal("OHD_inscribed_yaga","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_sendai","GLOBAL",1)
~ THEN REPLY #92076 /* ~Do you inscribe Sendai's name?~ */ DO ~SetGlobal("OHD_inscribed_sendai","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_abazigal","GLOBAL",1)
~ THEN REPLY #92077 /* ~Do you inscribe Abazigal's name?~ */ DO ~SetGlobal("OHD_inscribed_abazigal","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_melissan","GLOBAL",1)
OR(2)
Dead("balth2")
Global("BalthazarFights","GLOBAL",1)
~ THEN REPLY #92079 /* ~Do you inscribe Melissan's name?~ */ DO ~SetGlobal("OHD_inscribed_melissan","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_noober","GLOBAL",1)
~ THEN REPLY #92080 /* ~Do you inscribe Noober's name?~ */ DO ~SetGlobal("OHD_inscribed_noober","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_saemon","GLOBAL",1)
!Dead("amsaemon")
~ THEN REPLY #92081 /* ~Do you inscribe Saemon Havarian's name?~ */ DO ~SetGlobal("OHD_inscribed_saemon","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_urgothoz","GLOBAL",1)
Global("OHD_urgothoz_patron","GLOBAL",1)
~ THEN REPLY #92082 /* ~Do you inscribe Ur-Gothoz's name?~ */ DO ~SetGlobal("OHD_inscribed_urgothoz","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_azothet","GLOBAL",1)
Global("OHD_azothet_patron","GLOBAL",1)
~ THEN REPLY #92083 /* ~Do you inscribe Azothet's name?~ */ DO ~SetGlobal("OHD_inscribed_azothet","GLOBAL",1)
~ GOTO 15
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ GOTO 18
END

IF ~~ THEN BEGIN 15 // from: 12.0 12.1 12.2 12.3 12.4 12.5 12.6 12.7 14.0 14.1 14.2 14.3 14.4 14.5 14.6 14.7 17.0 17.1 17.2 17.3 17.4 17.5 17.6 17.7
  SAY #92059 /* ~The name is inscribed, and with it comes the knowledge that you must leave this place immediately. A dark hole is forming in the pit of your stomach as the air around you seems to curdle like milk. While no one else seems affected, in every fiber of your being you know that to remain in this place is certain doom.~ */
  IF ~~ THEN DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ EXIT
END

IF ~~ THEN BEGIN 16 // from: 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9
  SAY #92061 /* ~Your name is still written in the Scroll of Retribution.~ */
  IF ~~ THEN REPLY #92089 /* ~Do you erase it?~ */ DO ~EraseJournalEntry(91528)
AddJournalEntry(97745,QUEST_DONE)
~ GOTO 17
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ GOTO 18
END

IF ~~ THEN BEGIN 17 // from: 16.0
  SAY #92062 /* ~With your name removed, the scroll has another blank space you could fill... if you dare.~ */
  IF ~  !Global("OHD_inscribed_yaga","GLOBAL",1)
~ THEN REPLY #92075 /* ~Do you inscribe Yaga-Shura's name?~ */ DO ~SetGlobal("OHD_inscribed_yaga","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_sendai","GLOBAL",1)
~ THEN REPLY #92076 /* ~Do you inscribe Sendai's name?~ */ DO ~SetGlobal("OHD_inscribed_sendai","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_abazigal","GLOBAL",1)
~ THEN REPLY #92077 /* ~Do you inscribe Abazigal's name?~ */ DO ~SetGlobal("OHD_inscribed_abazigal","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_melissan","GLOBAL",1)
OR(2)
Dead("balth2")
Global("BalthazarFights","GLOBAL",1)
~ THEN REPLY #92079 /* ~Do you inscribe Melissan's name?~ */ DO ~SetGlobal("OHD_inscribed_melissan","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_noober","GLOBAL",1)
~ THEN REPLY #92080 /* ~Do you inscribe Noober's name?~ */ DO ~SetGlobal("OHD_inscribed_noober","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_saemon","GLOBAL",1)
!Dead("amsaemon")
~ THEN REPLY #92081 /* ~Do you inscribe Saemon Havarian's name?~ */ DO ~SetGlobal("OHD_inscribed_saemon","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_urgothoz","GLOBAL",1)
Global("OHD_urgothoz_patron","GLOBAL",1)
~ THEN REPLY #92082 /* ~Do you inscribe Ur-Gothoz's name?~ */ DO ~SetGlobal("OHD_inscribed_urgothoz","GLOBAL",1)
~ GOTO 15
  IF ~  !Global("OHD_inscribed_azothet","GLOBAL",1)
Global("OHD_azothet_patron","GLOBAL",1)
~ THEN REPLY #92083 /* ~Do you inscribe Azothet's name?~ */ DO ~SetGlobal("OHD_inscribed_azothet","GLOBAL",1)
~ GOTO 15
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ GOTO 18
END

IF ~~ THEN BEGIN 18 // from: 11.8 12.8 13.1 14.8 16.1 17.8
  SAY #92064 /* ~A good idea, or so you think. Though no one else seems to have noticed, to you the atmosphere in the pavilion has been tainted in some way. It is only a matter of time before someone realizes that all is not right in the sphere of Lunia, and then all eyes will turn to you...~ */
  IF ~~ THEN DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ EXIT
END


/* lfgp */ 

IF ~ NumTimesTalkedTo(0) Global("bfsluniaaccepted","GLOBAL",1)~ THEN BEGIN bfs.scroll
  SAY #92037 /* ~As you near the Scroll of Retribution, you can feel its power rolling over you in waves. The divine wrath it represents is a palpable energy that fills the air of the Pavilion.~ */
  IF ~~ THEN GOTO bfs.scroll1
END

IF ~~ THEN BEGIN bfs.scroll1
  SAY ~With the sacred sand entrusted to you, the ink upon the scroll fades, leaving its surface unblemished.~ 
IF ~~ THEN GOTO bfs.scroll2
END

IF ~~ THEN BEGIN bfs.scroll2
  SAY ~There is a space in which you could inscribe another name in your stead.~
IF ~  !Dead("sendai")
Global("SaradushSacked","GLOBAL",1)
~ THEN REPLY #92076 /* ~Do you inscribe Sendai's name?~ */ DO ~SetGlobal("OHD_inscribed_sendai","GLOBAL",1)
~ GOTO bfs.scrollaltered
  IF ~  !Dead("Abazigal")
Global("SaradushSacked","GLOBAL",1)
~ THEN REPLY #92077 /* ~Do you inscribe Abazigal's name?~ */ DO ~SetGlobal("OHD_inscribed_abazigal","GLOBAL",1)
~ GOTO bfs.scrollaltered
  IF ~  OR(2)
Dead("balth2")
Global("BalthazarFights","GLOBAL",1)
~ THEN REPLY #92079 /* ~Do you inscribe Melissan's name?~ */ DO ~SetGlobal("OHD_inscribed_melissan","GLOBAL",1)
~ GOTO 13
  IF ~~ THEN REPLY #92080 /* ~Do you inscribe Noober's name?~ */ DO ~SetGlobal("OHD_inscribed_noober","GLOBAL",1)
~ GOTO bfs.scrollaltered
  IF ~  !Dead("amsaemon")
~ THEN REPLY #92081 /* ~Do you inscribe Saemon Havarian's name?~ */ DO ~SetGlobal("OHD_inscribed_saemon","GLOBAL",1)
~ GOTO bfs.scrollaltered
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ GOTO bfs.scrollunaltered
END

IF ~~ THEN BEGIN bfs.scrollaltered
  SAY ~The air around you curdles like milk, yet no one else seems to notice. Whether doom or deliverance awaits, a new die has been cast.~
  IF ~~ THEN DO ~TakePartyItem("OHDINK") SetGlobal("OHD_finished","GLOBAL",1)
~ EXIT
END

IF ~~ THEN BEGIN bfs.scrollunaltered
  SAY ~You step away in solemn silence, leaving the Scroll in its intended state.~
  IF ~~ THEN DO ~TakePartyItem("OHDINK") SetGlobal("OHD_finished","GLOBAL",1)
~ EXIT
END
