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
  SAY #89700 ~Come now and receive Tyr's gift.~ [OH89700]
  IF ~~ THEN DO ~SetGlobal("OHD_pavilion","OH5500",1)
~ EXIT
END

/* traitor check */

IF ~GlobalGT("OHD_pavilion","OH5500",1) Global("bfsspoketoscribe","GLOBAL",1) Global("bfsplanetaraccused","LOCALS",0) !Global("bfstraitorconvo","GLOBAL",1)~ THEN BEGIN bfs.traitorcheck
SAY ~Speak, <CHARNAME>. What burden weighs upon your soul?~
++ ~Did you command Naiman Alore to write down my name?~ DO ~SetGlobal("bfsplanetaraccused","LOCALS",1)~ + bfs.traitorcheckfalse
END

IF ~~ bfs.traitorcheckfalse
SAY ~Nay, 'twas not I who bade it.~
= ~Should you doubt my word, seek the testimony of those who dwell here. I stand as a sentinel, welcoming neophytes and aiding them in their duties.~
IF ~~ EXIT
END

/* general introduction */

CHAIN IF ~Global("OHD_pavilion","OH5500",1)~ THEN BFDPLANL bfs.youstandaccused
~What is your name, Champion of Tyr?~ [OH89701]
END
++ ~I am <CHARNAME>.~ EXTERN BFDPLANL bfs.lunianewpath
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + ~Keldorn Firecam.~ EXTERN BFDPLANL bfs.veryfunny

CHAIN BFDPLANL bfs.veryfunny
~I know this name. But - you are a paladin of Torm.~ [OH89703]
== KELDO25J ~I believe they inquired after your name, not mine. But if names must be shared, then grant me the privilege of introducing you. This is <CHARNAME>, <PRO_HESHE> leads our party with courage and honor.~
END
IF ~~ EXTERN BFDPLANL bfs.lunianewpath

CHAIN BFDPLANL bfs.lunianewpath
~I know this name. Your arrival was anticipated. Seek out Naiman Alore, <CHARNAME>. As our scribe, who better to ascertain your guilt than the man who penned it? He awaits you near the Scroll of Retribution.~
== AERIE25J IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~My footsteps feel lighter here somehow. Would it be selfish of us to linger for a while?~
== ANOME25J IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",CHAOTIC_NEUTRAL)~ THEN ~I see no purpose to our visit here. 'Tis a refuge for fools who pretend that virtue and justice mean something.~
== IMOEN25J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN ~Just look at this place! Kinda makes you forget we're here to prove our innocence.~
== JAN25J IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~My distant cousin, Wren, once joined some crusade planning to storm the City of Judgment. He ended up in a cabbage market near Thesk shouting about soul taxes instead. Poor lad never could read a map. ...Yes, I'm aware this isn't the same locale. Must all my tales be relevant to the situation at hand?~
== VALYG25J IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~Lunia is not without its beauty. A pity that our circumstances offer us little cause to appreciate it.~
== NEERA25J IF ~InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN ~So this is Mount Celestia's front step? It's nice. I don't suppose there's a gift shop nearby? We should definitely grab some souvenirs before we leave.~
== BFDPLANL ~The White Pavilion welcomes you.~
DO ~AddJournalEntry(@100002, QUEST)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
SetGlobal("OHD_planetar_said_intro","OH5500",1)~ EXIT
