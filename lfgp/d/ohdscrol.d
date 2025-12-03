/* lfgp */ 

APPEND OHDSCROL

IF WEIGHT #-1 ~NumTimesTalkedTo(0) Global("bfsluniaaccepted","GLOBAL",1)~ THEN BEGIN bfs.scroll
  SAY @395 /* As you near the Scroll of Retribution, you can feel its power rolling over you in waves. The divine wrath it represents is a palpable energy that fills the air of the Pavilion. */
  IF ~~ THEN GOTO bfs.scroll1
END

IF ~~ THEN BEGIN bfs.scroll1
  SAY @425 /* With the sacred sand entrusted to you, the ink upon the scroll fades, leaving its surface unblemished. */ 
IF ~~ THEN GOTO bfs.scroll2
END

IF ~~ THEN BEGIN bfs.scroll2
  SAY @426 /* There is a space in which you could inscribe another name in your stead. */
IF ~  !Dead("sendai")
Global("SaradushSacked","GLOBAL",1)
~ THEN REPLY @404 /* Do you inscribe Sendai's name? */ DO ~SetGlobal("OHD_inscribed_sendai","GLOBAL",1)
~ GOTO bfs.scrollaltered
  IF ~  !Dead("Abazigal")
Global("SaradushSacked","GLOBAL",1)
~ THEN REPLY @405 /* Do you inscribe Abazigal's name? */ DO ~SetGlobal("OHD_inscribed_abazigal","GLOBAL",1)
~ GOTO bfs.scrollaltered
  IF ~  OR(2)
Dead("balth2")
Global("BalthazarFights","GLOBAL",1)
~ THEN REPLY @406 /* Do you inscribe Melissan's name? */ DO ~SetGlobal("OHD_inscribed_melissan","GLOBAL",1)
~ GOTO 13
  IF ~~ THEN REPLY @407 /* Do you inscribe Noober's name? */ DO ~SetGlobal("OHD_inscribed_noober","GLOBAL",1)
~ GOTO bfs.scrollaltered
  IF ~  !Dead("amsaemon")
~ THEN REPLY @408 /* Do you inscribe Saemon Havarian's name? */ DO ~SetGlobal("OHD_inscribed_saemon","GLOBAL",1)
~ GOTO bfs.scrollaltered
  IF ~~ THEN REPLY @411 /* Do you leave the Pavilion of Righteous Wrath? */ GOTO bfs.scrollunaltered
END

IF ~~ THEN BEGIN bfs.scrollaltered
  SAY @427 /* The air around you curdles like milk, yet no one else seems to notice. Whether doom or deliverance awaits, a new die has been cast. */
  IF ~~ THEN DO ~TakePartyItem("OHDINK") SetGlobal("OHD_finished","GLOBAL",1)
~ EXIT
END

IF ~~ THEN BEGIN bfs.scrollunaltered
  SAY @428 /* You step away in solemn silence, leaving the Scroll in its intended state. */
  IF ~~ THEN DO ~TakePartyItem("OHDINK") SetGlobal("OHD_finished","GLOBAL",1)
~ EXIT
END

END // FOR APPEND
