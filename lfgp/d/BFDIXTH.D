BEGIN ~BFDIXTH~

IF ~~ THEN BEGIN 0 
  SAY #92119 /* ~You were mad to come here, and madder still if you think you'll leave.~ [OH92119] */
  IF ~~ THEN EXTERN ~BFDOLR~ 0
END

IF ~~ THEN BEGIN 1 // from:
  SAY #92184 /* ~You stink of lies, spawn of Bhaal.~ [OH92184] */
  IF ~~ THEN REPLY #92143 /* ~Your sense of smell is keener than I had hoped.~ */ EXTERN ~BFDOLR~ 0
  IF ~~ THEN REPLY #92145 /* ~I prefer to think of it as exuding an air of exaggeration, but opinions vary.~ */ EXTERN ~BFDOLR~ 0
  IF ~~ THEN REPLY #92147 /* ~If you know my father, you know what I can do. Stand aside and I'll let you live.~ */ GOTO 0
END

IF ~~ THEN BEGIN 2 // from:
  SAY #92125 /* ~They speak the truth, Dolrassa.~ [OH92125] */
  IF ~~ THEN EXTERN ~BFDOLR~ 6
END

IF ~~ THEN BEGIN 3 // from:
  SAY #92127 /* ~Ao himself has commanded the gods not to interfere with the Bhaalspawn.~ [OH92127] */
  IF ~~ THEN EXTERN ~BFDOLR~ 7
  IF ~  Global("PPRoom4","GLOBAL",1)
~ THEN REPLY #92159 /* ~He's right. Even Cyric left me to my own devices.~ */ EXTERN ~BFDOLR~ 7
END

IF ~~ THEN BEGIN 4 // from:
  SAY #92129 /* ~As representatives of Tyr, our claws are bound.~ [OH92129] */
  IF ~~ THEN EXTERN ~BFDOLR~ 8
END

IF ~~ THEN BEGIN 5 
  SAY ~Quickly now, I can smell Tyr's chosen approaching.~ 
  IF ~~ THEN DO ~SetGlobal("OHD_silver","OH5500",2)
~ EXIT
END

IF ~~ THEN BEGIN 6 // from: 7.2
  SAY #92119 /* ~You were mad to come here, and madder still if you think you'll leave.~ [OH92119] */
  IF ~~ THEN EXTERN ~BFDOLR~ 12
END

IF ~~ THEN BEGIN 7 // from:
  SAY #92107 /* ~You stink of lies, spawn of Bhaal.~ */
  IF ~~ THEN REPLY #92143 /* ~Your sense of smell is keener than I had hoped.~ */ EXTERN ~BFDOLR~ 12
  IF ~~ THEN REPLY #92145 /* ~I prefer to think of it as exuding an air of exaggeration, but opinions vary.~ */ EXTERN ~BFDOLR~ 12
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #92147 /* ~If you know my father, you know what I can do. Stand aside and I'll let you live.~ */ GOTO 6
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #92147 /* ~If you know my father, you know what I can do. Stand aside and I'll let you live.~ */ EXTERN ~DORN25J~ 140
END

IF ~~ THEN BEGIN 8 // from:
  SAY #92125 /* ~They speak the truth, Dolrassa.~ [OH92125] */
  IF ~~ THEN EXTERN ~BFDOLR~ 18
END

IF ~~ THEN BEGIN 9 // from:
  SAY #92127 /* ~Ao himself has commanded the gods not to interfere with the Bhaalspawn.~ [OH92127] */
  IF ~~ THEN EXTERN ~BFDOLR~ 19
  IF ~  Global("PPRoom4","GLOBAL",1)
~ THEN REPLY #92159 /* ~He's right. Even Cyric left me to my own devices.~ */ EXTERN ~BFDOLR~ 19
END

IF ~~ THEN BEGIN 10 // from:
  SAY #92129 /* ~As representatives of Tyr, our claws are bound.~ [OH92129] */
  IF ~~ THEN EXTERN ~BFDOLR~ 20
END
