BEGIN ~BFDIXTH~

IF ~~ THEN BEGIN 0 
  SAY @0 /* You were mad to come here, and madder still if you think you'll leave. */
  IF ~~ THEN EXTERN ~BFDOLR~ 9
END

IF ~~ THEN BEGIN 2 
  SAY @1 /* They speak the truth, Dolrassa. */
  IF ~~ THEN EXTERN ~BFDOLR~ 6
END

IF ~~ THEN BEGIN 3 
  SAY @2 /* Ao himself has commanded the gods not to interfere with the Bhaalspawn. */
  IF ~~ THEN EXTERN ~BFDOLR~ 7
  IF ~  Global("PPRoom4","GLOBAL",1)
~ THEN REPLY #92159 /* ~He's right. Even Cyric left me to my own devices.~ */ EXTERN ~BFDOLR~ 7
END

IF ~~ THEN BEGIN 4 
  SAY @3 /* Our claws are bound. */
  IF ~~ THEN EXTERN ~BFDOLR~ 8
END

IF ~~ THEN BEGIN 5 
  SAY @4 /* Silence! I can hear someone approaching. */ 
  IF ~~ THEN DO ~SetGlobal("OHD_silver","OH5500",2)
~ EXIT
END
