BEGIN ~BFDIXTH~

IF ~~ THEN BEGIN 0 
  SAY ~You were mad to come here, and madder still if you think you'll leave.~ [OH92119]
  IF ~~ THEN EXTERN ~BFDOLR~ 9
END

IF ~~ THEN BEGIN 2 
  SAY ~They speak the truth, Dolrassa.~ [OH92125]
  IF ~~ THEN EXTERN ~BFDOLR~ 6
END

IF ~~ THEN BEGIN 3 
  SAY ~Ao himself has commanded the gods not to interfere with the Bhaalspawn.~ [OH92127]
  IF ~~ THEN EXTERN ~BFDOLR~ 7
  IF ~  Global("PPRoom4","GLOBAL",1)
~ THEN REPLY #92159 /* ~He's right. Even Cyric left me to my own devices.~ */ EXTERN ~BFDOLR~ 7
END

IF ~~ THEN BEGIN 4 
  SAY ~Our claws are bound.~ [BFIX]
  IF ~~ THEN EXTERN ~BFDOLR~ 8
END

IF ~~ THEN BEGIN 5 
  SAY ~Silence! I can hear someone approaching.~ 
  IF ~~ THEN DO ~SetGlobal("OHD_silver","OH5500",2)
~ EXIT
END
