BEGIN ~BFDOLR~

IF ~~ THEN BEGIN 4 
  SAY ~Do you truly believe you can defeat us?~
  ++ ~Come and see, dragon.~ DO ~ActionOverride("BFDOLR",Enemy())
ActionOverride("BFDIXTH",Enemy())
~ EXIT
  IF ~ CheckStatGT(Player1,15,CHR)
~ THEN REPLY #92158 /* ~The <PRO_SONDAUGHTER> of Bhaal doesn't answer to you, dragon.~ */ EXTERN ~BFDIXTH~ 2
END

IF ~  Global("OHD_silver","OH5500",3)
!IfValidForPartyDialogue("dorn")
~ THEN BEGIN 5 
  SAY #92183 /* ~So! It is you who would defile this holy realm.~ */
  IF ~~ THEN REPLY #92165 /* ~You heard the dragons. Stand aside.~ */ DO ~SetGlobal("OHD_silver","OH5500",4)
SetGlobalTimer("OHD_finaltimer","OH5500",600)
~ GOTO 0
  IF ~~ THEN REPLY #92196 /* ~Me? No, no, I don't think so. You've mistaken me for someone else.~ */ DO ~SetGlobal("OHD_silver","OH5500",4)
SetGlobalTimer("OHD_finaltimer","OH5500",600)
~ EXTERN ~BFDIXTH~ 1
  IF ~~ THEN REPLY #92197 /* ~And you are the fools who think you can stop me.~ */ DO ~SetGlobal("OHD_silver","OH5500",4)
SetGlobalTimer("OHD_finaltimer","OH5500",600)
~ GOTO 0
END

IF ~~ THEN BEGIN 6 // from:
  SAY #92126 /* ~You're wrong, Ixthezzys. Truth dies in their mouth.~ [OH92126] */
  IF ~~ THEN EXTERN ~BFDIXTH~ 3
END

IF ~~ THEN BEGIN 7 // from:
  SAY #92128 /* ~Then it's fortunate we are not gods.~ [OH92128] */
  IF ~~ THEN REPLY #92160 /* ~No. You just represent one.~ */ EXTERN ~BFDIXTH~ 4
  IF ~~ THEN REPLY #92162 /* ~Do you seriously want to cross Ao?~ */ EXTERN ~BFDIXTH~ 4
  IF ~~ THEN REPLY #92163 /* ~You think so? Gods might have survived this encounter.~ */ GOTO 9
END

IF ~~ THEN BEGIN 8 // from:
  SAY #92132 /* ~Ugh! Get out of my sight, Bhaalspawn. And pray you never meet me without my better half to stay my holy flame.~ [OH92132] */
  IF ~~ THEN DO ~SetGlobal("OHD_silver","OH5500",5)
~ EXIT
END

IF ~~ THEN BEGIN 9 // from: 7.2
  SAY #92194 /* ~Death to the defiler!~ */
  IF ~~ THEN DO ~ActionOverride("BFDIXTH",Enemy())
Enemy()
~ EXIT
END

IF ~ Global("OHD_silver","OH5500",1)
~ THEN BEGIN 10 
  SAY ~Your little warband scrambles like rats, Baldwin. When you asked us to assist your cause, you offered us riches, and we have kept your path clear with claw and fang. We have earned our tithe in blood. *Where* is our reward?~
  IF ~~ THEN EXTERN ~BFBALD~ 7
END

IF ~~ THEN BEGIN 11 
  SAY ~This is beyond the scope of our agreement. Ixthezzys and I have no intention of....~ 
  IF ~~ THEN EXTERN ~BFDIXTH~ 5
END

IF ~~ THEN BEGIN 12 // from: 17.0 17.2
  SAY #92120 /* ~You will answer for your crimes. Your presence in this place is an affront to Tyr.~ [OH92120] */
  IF ~~ THEN GOTO 16
  IF ~  Dead("OHDNAIMA")
~ THEN GOTO 15
  IF ~  OR(2)
GlobalGT("OHD_playerkillstree","OH5500",3)
Global("OHD_dornkillstree","OH5500",3)
~ THEN GOTO 14
  IF ~  Dead("OHDBOLL")
~ THEN GOTO 13
END

IF ~~ THEN BEGIN 13 // from: 12.3
  SAY #92121 /* ~You murdered Bollard Firejaw.~ [OH92121] */
  IF ~~ THEN GOTO 16
  IF ~  Dead("OHDNAIMA")
~ THEN GOTO 15
  IF ~  OR(2)
GlobalGT("OHD_playerkillstree","OH5500",3)
Global("OHD_dornkillstree","OH5500",3)
~ THEN GOTO 14
END

IF ~~ THEN BEGIN 14 // from: 12.2 13.2
  SAY #92122 /* ~You corrupted the Silver Tree of Life.~ [OH92122] */
  IF ~~ THEN GOTO 16
  IF ~  Dead("OHDNAIMA")
~ THEN GOTO 15
END

IF ~~ THEN BEGIN 15 // from: 12.1 13.1 14.1
  SAY #92123 /* ~You slew the scribe Naiman Alore and countless others at the Pavilion of Righteousness.~ [OH92123] */
  IF ~~ THEN GOTO 16
END

IF ~~ THEN BEGIN 16 // from: 12.0 13.0 14.0 15.0
  SAY #92124 /* ~How do you defend yourself, <PRO_RACE>? Can you defend yourself?~ [OH92124] */
  IF ~~ THEN REPLY #92155 /* ~When you put it that way, not really.~ */ DO ~ActionOverride("BFDOLR",Enemy())
ActionOverride("BFDIXTH",Enemy())
~ EXIT
  IF ~~ THEN REPLY #92156 /* ~Come and see, dragon.~ */ DO ~ActionOverride("BFDOLR",Enemy())
ActionOverride("BFDIXTH",Enemy())
~ EXIT
  IF ~  CheckStatGT(Player1,15,CHR)
~ THEN REPLY #92158 /* ~The <PRO_SONDAUGHTER> of Bhaal doesn't answer to you, dragon.~ */ EXTERN ~BFDIXTH~ 8
END
