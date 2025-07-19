BEGIN ~OHDPLANL~

IF ~  Global("OHD_pavilion","BF5500",0)
~ THEN BEGIN 19 // from:
  SAY #89695 /* ~You are the few who answered my call. You handful of righteous men and women will enforce the laws of Tyr, carrying out his judgments where other mortal agents fail.~ [OH89695] */
IF ~~ THEN GOTO 20
END

IF ~~ THEN BEGIN 20 // from: 19.0 19.5
  SAY #89698 /* ~For each of you, I have a sigil granting permission to enter the White Pavilion.~ [OH89698] */
  IF ~~ THEN GOTO 21
END

IF ~~ THEN BEGIN 21 // from: 20.0
  SAY #89700 /* ~Come now, and receive Tyr's gift.~ [OH89700] */
  IF ~~ THEN DO ~SetGlobal("OHD_pavilion","BF5500",1)
~ EXIT
END

IF ~  Global("OHD_pavilion","BF5500",1)
~ THEN BEGIN 22 // from:
  SAY #89701 /* ~What is your name, Champion of Tyr?~ [OH89701] */
  IF ~~ THEN REPLY #89716 /* ~I am <CHARNAME>.~ */ GOTO bfs.lunianewpath 
  IF ~InParty("Keldorn")~ THEN REPLY #89717 /* ~Keldorn Firecam.~ */ GOTO 24   
END

IF ~~ THEN BEGIN 24 // from: 22.1
  SAY #89703 /* ~I know this name. But—you are a paladin of Torm.~ [OH89703] */
  IF ~~ THEN GOTO bfs.lunianewpath
END

IF ~~ THEN BEGIN bfs.lunianewpath
SAY ~I know this name. Your arrival was foreseen. Seek out Naiman Alore, <CHARNAME>, he awaits you near the Scroll of Retribution. I hope justice - true justice - might yet prevail.~
= ~Take this sigil. Go forth with Tyr's blessing and do his work.~
IF ~~ THEN DO ~AddJournalEntry(89726,INFO)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","BF5500",2)
SetGlobal("OHD_planetar_said_intro","BF5500",1)
~ EXIT
END
