/* lfgp */

APPEND OHDPLANL

IF ~Global("OHD_pavilion","OH5500",0) Global("bfsluniaaccepted","GLOBAL",1)~ THEN BEGIN bfs.planintro
  SAY @473 /* You are the few who answered my call. You handful of righteous men and women will enforce the laws of Tyr, carrying out his judgments where other mortal agents fail. */
IF ~~ THEN GOTO bfs.plan1
END

IF ~~ THEN BEGIN bfs.plan1
  SAY @478 /* For each of you, I have a sigil granting permission to enter the White Pavilion. */
  IF ~~ THEN GOTO bfs.plan2
END

IF ~~ THEN BEGIN bfs.plan2
  SAY @502 /* Come now and receive Tyr's gift. */
  IF ~~ THEN DO ~SetGlobal("OHD_pavilion","OH5500",1)
~ EXIT
END

/* traitor check */

IF ~GlobalGT("OHD_pavilion","OH5500",1) Global("bfsspoketoscribe","GLOBAL",1) Global("bfsplanetaraccused","LOCALS",0) !Global("bfstraitorconvo","GLOBAL",1) Global("bfsluniaaccepted","GLOBAL",1)~ THEN BEGIN bfs.traitorcheck
SAY @503 /* Speak, <CHARNAME>. What burden weighs upon your soul? */
++ @504 /* Did you command Naiman Alore to write down my name? */ DO ~SetGlobal("bfsplanetaraccused","LOCALS",1)~ + bfs.traitorcheckfalse
END

IF ~~ bfs.traitorcheckfalse
SAY @505 /* Nay, 'twas not I who bade it. */
= @506 /* Should you doubt my word, seek the testimony of those who dwell here. I stand as a sentinel, welcoming neophytes and aiding them in their duties. */
IF ~~ EXIT
END

END // FOR APPEND

/* general introduction */

CHAIN IF ~Global("OHD_pavilion","OH5500",1) Global("bfsluniaaccepted","GLOBAL",1)~ THEN OHDPLANL bfs.youstandaccused
@480 /* What is your name, Champion of Tyr? */
END
++ @481 /* I am <CHARNAME>. */ EXTERN OHDPLANL bfs.lunianewpath
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @482 /* Keldorn Firecam. */ EXTERN OHDPLANL bfs.veryfunny

CHAIN OHDPLANL bfs.veryfunny
@507 /* I know this name. But - you are a paladin of Torm. */
== KELDO25J @508 /* I believe they inquired after your name, not mine. But if names must be shared, then grant me the privilege of introducing you. This is <CHARNAME>, <PRO_HESHE> leads our party with courage and honor. */
END
IF ~~ EXTERN OHDPLANL bfs.lunianewpath

CHAIN OHDPLANL bfs.lunianewpath
@509 /* I know this name. Your arrival was anticipated. Seek out Naiman Alore, <CHARNAME>. As our scribe, who better to ascertain your guilt than the man who penned it? He awaits you near the Scroll of Retribution. */
== AERIE25J IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @510 /* My footsteps feel lighter here somehow. Would it be selfish of us to linger for a while? */
== ANOME25J IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",CHAOTIC_NEUTRAL)~ THEN @511 /* I see no purpose to our visit here. 'Tis a refuge for fools who pretend that virtue and justice mean something. */
== IMOEN25J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @512 /* Just look at this place! Kinda makes you forget we're here to prove our innocence. */
== JAN25J IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @513 /* My distant cousin, Wren, once joined some crusade planning to storm the City of Judgment. He ended up in a cabbage market near Thesk shouting about soul taxes instead. Poor lad never could read a map. ...Yes, I'm aware this isn't the same locale. Must all my tales be relevant to the situation at hand? */
== VALYG25J IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @514 /* Lunia is not without its beauty. A pity that our circumstances offer us little cause to appreciate it. */
== NEERA25J IF ~InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @515 /* So this is Mount Celestia's front step? It's nice. I don't suppose there's a gift shop nearby? We should definitely grab some souvenirs before we leave. */
== OHDPLANL @516 /* The White Pavilion welcomes you. */
DO ~AddJournalEntry(@100002, QUEST)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
SetGlobal("OHD_planetar_said_intro","OH5500",1)~ EXIT
