BEGIN ~BFDZARA~

IF ~NumberOfTimesTalkedTo(0)~ THEN BEGIN 7
  SAY #89966 /* ~Good evening, strangers. Are you here to partake of the flesh of the divine?~ */
  IF ~~ THEN REPLY #90041 /* ~No, but I thank you for the offer.~ */ GOTO 11
  IF ~~ THEN REPLY #90042 /* ~What sort of disgusting barbarian would eat the flesh of a god?~ */ GOTO 8
  IF ~~ THEN REPLY #90045 /* ~I hadn't planned on it.~ */ GOTO 9
END

IF ~~ THEN BEGIN 8
  SAY #89969 /* ~You misunderstand. Ingesting the Silver Apples is a holy ritual.~ */
  IF ~~ THEN EXTERN ~OHDRIKKO~ 0
END

IF ~~ THEN BEGIN 9
  SAY #89972 /* ~But you must! The Silver Apples are one of the true wonders of Lunia.~ */
  IF ~~ THEN EXTERN ~OHDRIKKO~ 0
  IF ~  IfValidForPartyDialogue("hexxat")
~ THEN EXTERN ~HEXXA25J~ 17
END

IF ~~ THEN BEGIN 10
  SAY #89977 /* ~Your humility is admirable, though I think it misplaced. The unworthy are few and far between in this place. Still, the choice is yours.~ */
  IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY #90119 /* ~Fare thee well, <PRO_RACE>.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12
  SAY #90120 /* ~Then take a bite and experience the joy for yourself.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 13
  SAY #90125 /* ~There's no forgiveness required, <PRO_RACE>. This is Lunia.~ */
  IF ~~ THEN EXIT
END
