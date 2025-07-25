BEGIN ~BFDOLR~

IF ~~ THEN BEGIN bfs.shadowdragon 
SAY ~Is that confidence in your skills, or is it madness? We never could tell with these Cyricists.~
= ~Do you truly believe you can defeat us?~
++ ~The <PRO_SONDAUGHTER> of Bhaal doesn't answer to you. Interfere with my destiny at your own peril.~ EXTERN ~BFDIXTH~ 2
++ ~By Tyr's command, your allies shall fall, and you with them.~ DO ~ActionOverride("BFDOLR",Enemy()) ActionOverride("BFDIXTH",Enemy())~ EXIT
++ ~You've chosen your side and your fate. I will have my reckoning.~ DO ~ActionOverride("BFDOLR",Enemy()) ActionOverride("BFDIXTH",Enemy())~ EXIT
END

IF ~Global("OHD_silver","OH5500",3)~ THEN BEGIN bfs.dolrintro 
SAY ~The infamous Bhaalspawn graces us at last.~
IF ~~ THEN REPLY ~I'll give you one chance to slither back into the dark.~ DO ~SetGlobal("OHD_silver","OH5500",4) SetGlobalTimer("OHD_finaltimer","OH5500",600)~ GOTO bfs.shadowdragon
IF ~~ THEN REPLY ~If you think to frighten me, then you misjudge both my mood and my mercy.~ DO ~SetGlobal("OHD_silver","OH5500",4) SetGlobalTimer("OHD_finaltimer","OH5500",600)~ GOTO bfs.shadowdragon
END

IF ~~ THEN BEGIN 6 
  SAY ~What do you mean, Ixthezzys?~ 
  IF ~~ THEN EXTERN ~BFDIXTH~ 3
END

IF ~~ THEN BEGIN 7 
  SAY #92128 /* ~Then it's fortunate we are not gods.~ [OH92128] */
  IF ~~ THEN REPLY #92160 /* ~No. You just represent one.~ */ EXTERN ~BFDIXTH~ 4
  IF ~~ THEN REPLY #92162 /* ~Do you seriously want to cross Ao?~ */ EXTERN ~BFDIXTH~ 4
  IF ~~ THEN REPLY #92163 /* ~You think so? Gods might have survived this encounter.~ */ GOTO 9
END

IF ~~ THEN BEGIN 8 
  SAY ~Ugh! Get out of my sight, Bhaalspawn. And pray you never meet me without my better half to stay my flame.~ [BFDOL] 
  IF ~~ THEN DO ~SetGlobal("OHD_silver","OH5500",5)
~ EXIT
END

IF ~~ THEN BEGIN 9 
  SAY ~Death to the Bhaalspawn!~
  IF ~~ THEN DO ~ActionOverride("BFDIXTH",Enemy())
Enemy()
~ EXIT
END

IF ~ Global("OHD_silver","OH5500",1)~ THEN BEGIN 10 
SAY ~Your scheme was brought to light and now your followers scramble like rats, Baldwin.~
= ~When you asked our assistance with your cause, you offered us riches, and we have kept your path clear with claw and fang. We have earned our tithe in blood. *Where* is our reward?~
  IF ~~ THEN EXTERN ~BFBALD~ 7
END

IF ~~ THEN BEGIN 11 
  SAY ~This is beyond the scope of our agreement. Ixthezzys and I will have our due.~ 
  IF ~~ THEN EXTERN ~BFDIXTH~ 5
END
