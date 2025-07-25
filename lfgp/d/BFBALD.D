BEGIN ~BFBALD~

IF ~
Global("OHD_beachescape","OH5500",1) 
GlobalLT("OHD_silver","OH5500",7)~ THEN BEGIN 0 
SAY ~The portals have been sealed! Fight for your lives!~
IF ~~ THEN DO ~SetGlobal("OHD_beachescape","OH5500",2) 
SetGlobal("OHD_silver","OH5500",7)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 7 
  SAY ~You will have it once the last of our flock reach the portal. Not a moment before.~
  IF ~~ THEN EXTERN ~BFDOLR~ 11
END
