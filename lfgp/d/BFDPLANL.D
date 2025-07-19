BEGIN ~BFDPLANL~

IF ~Global("OHD_pavilion","OH5500",0)~ THEN BEGIN 19 
  SAY #89695 /* ~You are the few who answered my call. You handful of righteous men and women will enforce the laws of Tyr, carrying out his judgments where other mortal agents fail.~ [OH89695] */
IF ~~ THEN GOTO 20
END

IF ~~ THEN BEGIN 20 
  SAY #89698 /* ~For each of you, I have a sigil granting permission to enter the White Pavilion.~ [OH89698] */
  IF ~~ THEN GOTO 21
END

IF ~~ THEN BEGIN 21 
  SAY #89700 /* ~Come now, and receive Tyr's gift.~ [OH89700] */
  IF ~~ THEN DO ~SetGlobal("OHD_pavilion","OH5500",1)
~ EXIT
END

CHAIN IF ~Global("OHD_pavilion","OH5500",1)~ THEN BFDPLANL bfs.youstandaccused
~What is your name, Champion of Tyr?~ [OH89701] 
END
++ ~I am <CHARNAME>.~ EXTERN BFDPLANL bfs.lunianewpath 
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + ~Keldorn Firecam.~ EXTERN BFDPLANL bfs.veryfunny


CHAIN BFDPLANL bfs.veryfunny 
~I know this name. But—you are a paladin of Torm.~ [OH89703] 
== KELDO25J ~I believe the planetar seeks your name, my friend, not mine. Still, if introductions must be made, it would be my privilege. This is <CHARNAME>, the valiant leader of our company.~
END 
IF ~~ EXTERN BFDPLANL bfs.lunianewpath

CHAIN BFDPLANL bfs.lunianewpath
~I know this name. Your arrival was expected. Seek out Naiman Alore, <CHARNAME>, he awaits you near the Scroll of Retribution.~
== AERIE25J IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~My footsteps feel lighter here somehow. Would it be selfish of us to linger?~
== ANOME25J IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",CHAOTIC_NEUTRAL)~ THEN ~I see no purpose to our visit here. 'Tis a refuge for fools who pretend that virtue and justice mean something.~
== IMOEN25J IF ~InParty("Imoen") InMyArea("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN ~Just look at this place! Kinda makes you forget that we're here to prove our innocence, huh?~
== JAN25J IF ~InParty("JAN") InMyArea("JAN") !StateCheck("JAN",CD_STATE_NOTVALID)~ THEN ~My distant cousin, Wren, once joined some crusade planning to storm the City of Judgment. Somehow he ended up in a cabbage market near Thesk shouting about soul taxes instead. Poor lad never could read a map. ...Yes, I'm quite aware this isn't the same place.~
== VALYG25J IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~Lunia is not without its beauty. A pity that our circumstances offer little cause to appreciate it.~
== NEERA25J IF ~InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN ~So this is Mount Celestia's front step? I don't suppose there's a gift shop nearby? We should grab some souvenirs before we leave.~
== BFDPLANL ~The White Pavilion welcomes you.~
DO ~AddJournalEntry(89726,INFO)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ EXIT
