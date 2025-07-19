BEGIN ~OHDSCROL~

IF ~  NumTimesTalkedTo(0)
~ THEN BEGIN 0 
  SAY #92037 /* ~As you near the Scroll of Retribution, you can feel its power rolling over you in waves. The divine wrath it represents is a palpable energy that fills the air of the Pavilion.~ */
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1 
  SAY ~The names of those despised by the gods radiate from the scroll. With the item handed to you by NAME you carefully set to your task.~ 
IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 2 
  SAY #92041 /* ~With your name removed, there is a space in the scroll in which you could inscribe another.~ */
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
  IF ~~ THEN REPLY #92086 /* ~Do you leave the Pavilion of Righteous Wrath?~ */ GOTO 14
END

IF ~~ THEN BEGIN 13
  SAY #92059 /* ~The name is inscribed, and with it comes the knowledge that you must leave this place immediately. A dark hole is forming in the pit of your stomach as the air around you seems to curdle like milk. While no one else seems affected, in every fiber of your being you know that to remain in this place is certain doom.~ */
  IF ~~ THEN DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ EXIT
END

IF ~~ THEN BEGIN 14
  SAY ~You step away, leaving the Scroll in it's intended state.~
  IF ~~ THEN DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ EXIT
END

