BEGIN ~BFDOLR~

IF ~~ THEN BEGIN bfs.shadowdragon
SAY @5 /* Is that confidence in your skills, or is it madness? We never could tell with these Cyricists. */
= @6 /* Do you truly believe you can defeat us? */
++ @7 /* The <PRO_SONDAUGHTER> of Bhaal doesn't answer to you. Interfere with my destiny at your own peril. */ EXTERN ~BFDIXTH~ 2
++ @8 /* By Tyr's command, your allies shall fall, and you with them. */ DO ~ActionOverride("BFDOLR",Enemy()) ActionOverride("BFDIXTH",Enemy())~ EXIT
++ @9 /* You've chosen your side and your fate. I will have my reckoning. */ DO ~ActionOverride("BFDOLR",Enemy()) ActionOverride("BFDIXTH",Enemy())~ EXIT
END

IF ~Global("OHD_silver","OH5500",3)~ THEN BEGIN bfs.dolrintro
SAY @10 /* The infamous Bhaalspawn graces us at last. */
IF ~~ THEN REPLY @11 /* I'll give you one chance to slither back into the dark. */ DO ~SetGlobal("OHD_silver","OH5500",4) SetGlobalTimer("OHD_finaltimer","OH5500",600)~ GOTO bfs.shadowdragon
IF ~~ THEN REPLY @12 /* If you think you frighten me, then you misjudge both my mood and my mercy. */ DO ~SetGlobal("OHD_silver","OH5500",4) SetGlobalTimer("OHD_finaltimer","OH5500",600)~ GOTO bfs.shadowdragon
END

IF ~~ THEN BEGIN 6
  SAY @13 /* What do you mean, Ixthezzys? */
  IF ~~ THEN EXTERN ~BFDIXTH~ 3
END

IF ~~ THEN BEGIN 7
  SAY @14 /* Then it's fortunate we are not gods. */
  IF ~~ THEN REPLY @15 /* No. You just represent one. */ EXTERN ~BFDIXTH~ 4
  IF ~~ THEN REPLY @16 /* Do you seriously want to cross Ao? */ EXTERN ~BFDIXTH~ 4
  IF ~~ THEN REPLY @17 /* You think so? Gods might have survived this encounter. */ GOTO 9
END

IF ~~ THEN BEGIN 8
  SAY @18 /* Ugh! Get out of my sight, Bhaalspawn. And pray you never meet me without my better half to stay my flame. */
  IF ~~ THEN DO ~SetGlobal("OHD_silver","OH5500",5)
~ EXIT
END

IF ~~ THEN BEGIN 9
  SAY @19 /* Death to the Bhaalspawn! */
  IF ~~ THEN DO ~ActionOverride("BFDIXTH",Enemy())
Enemy()
~ EXIT
END

IF ~ Global("OHD_silver","OH5500",1)~ THEN BEGIN 10
SAY @20 /* Your scheme was brought to light and now your followers scramble like rats, Baldwin. */
= @21 /* When you asked for our assistance with your cause, you offered us riches, and we have kept your path clear with claw and fang. We have earned our tithe in blood. *Where* is our reward? */
  IF ~~ THEN EXTERN ~BFBALD~ 7
END

IF ~~ THEN BEGIN 11
  SAY @22 /* This is beyond the scope of our agreement. Ixthezzys and I will have our due. */
  IF ~~ THEN EXTERN ~BFDIXTH~ 5
END
