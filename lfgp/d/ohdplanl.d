BEGIN ~OHDPLANL~

IF ~  Global("OHD_lostsigil","LOCALS",1) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 0 // from:
  SAY @429 /* Have you found the sigil yet? */
  IF ~~ THEN REPLY @430 /* Not yet, no. */ GOTO 1
  IF ~~ THEN REPLY @431 /* I'm close now. Very close. I can almost taste it. */ GOTO 1
  IF ~~ THEN REPLY @432 /* When I have it, I'll tell you. */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0 0.1 0.2
  SAY @433 /* Then why are you talking to me? Go! */
  IF ~~ THEN EXIT
END

IF ~  Global("OHD_pavilion","OH5500",2) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 2 // from:
  SAY @434 /* Ho there, <PRO_RACE>. Why do you still tarry here? */
  IF ~~ THEN REPLY @435 /* I await Tyr's guidance. */ GOTO 3
  IF ~~ THEN REPLY @436 /* Tyr has inspired me to go to a place called the Pavilion of Righteous Wrath. Do you know it? */ GOTO 4
  IF ~~ THEN REPLY @437 /* I do not know when, or if, I shall see this place again. I just want to take it all in. */ GOTO 5
  IF ~~ THEN REPLY @438 /* That is no business of yours. */ GOTO 6
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY @439 /* You are wise to do so. Be patient. I am sure he will speak to you soon. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4 // from: 2.1
  SAY @440 /* Indeed I do. It is a straight line from the gates to the earthly realm, through here, past the Statue of the Sentinel, to the Pavilion. On foot, you'll need to take one of tstairways available yonder. When you see the Sentinel, you'll not have far to go—its back is to the Pavilion. */
  IF ~~ THEN REPLY @441 /* I thank you. */ EXIT
END

IF ~~ THEN BEGIN 5 // from: 2.2
  SAY @442 /* Lunia is a wonder. But do not be distracted by its glories—there is work to be done in the earthly realms. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 6 // from: 2.3
  SAY @443 /* No business of mine? As a crusader of Tyr, you are mine to command. */
  IF ~  CheckStatLT(Player1,14,CHR)
~ THEN REPLY @444 /* Forgive me. I spoke in haste. */ GOTO 8
  IF ~  CheckStatGT(Player1,13,CHR)
~ THEN REPLY @444 /* Forgive me. I spoke in haste. */ GOTO 7
  IF ~~ THEN REPLY @445 /* No one commands me. */ GOTO 8
END

IF ~~ THEN BEGIN 7 // from: 6.1
  SAY @446 /* Next time, think before you speak. */
  IF ~~ THEN REPLY @447 /* I will. Again, my apologies. */ EXIT
END

IF ~~ THEN BEGIN 8 // from: 6.0 6.2
  SAY @448 /* Such behavior is beneath one of your esteemed rank. You are not fit to carry the sigil—hand it over. */
  IF ~~ THEN REPLY @449 /* No, please, don't make me do that. */ GOTO 9
  IF ~~ THEN REPLY @450 /* I can't. I lost it. */ GOTO 11
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @451 /* The only thing I'll give you is a quick death. */ GOTO 18
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @451 /* The only thing I'll give you is a quick death. */ EXTERN ~DORN25J~ 79
END

IF ~~ THEN BEGIN 9 // from: 8.0
  SAY @452 /* In time, if you are penitent and humble, you may be redeemed. For the moment, however, I strip you of your rank. Give me your sigil. */
  IF ~~ THEN REPLY @453 /* As you wish. */ DO ~TakePartyItem("ohdsigil")
~ GOTO 10
  IF ~~ THEN REPLY @454 /* I'd really rather not. */ GOTO 17
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @455 /* Give me your life, godsucker. */ GOTO 18
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @455 /* Give me your life, godsucker. */ EXTERN ~DORN25J~ 79
END

IF ~~ THEN BEGIN 10 // from: 9.0
  SAY @456 /* Go now. Take some time over there at the Constellations to reflect on your sins of pride and arrogance. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 11 // from: 8.1
  SAY @457 /* What? */
  IF ~~ THEN REPLY @458 /* I lost it. That's why I was so curt with you. I was upset and afraid of what might happen if you learned of my mistake. */ GOTO 12
  IF ~~ THEN REPLY @459 /* Someone stole it. There are unsavory characters around this place. */ GOTO 12
  IF ~~ THEN REPLY @460 /* It's gone. I don't know how it happened. */ GOTO 12
END

IF ~~ THEN BEGIN 12 // from: 11.0 11.1 11.2
  SAY @461 /* Well, don't just stand around sulking—find the sigil. Its value is incalculable! */
  IF ~  CheckStatLT(Player1,18,CHR)
~ THEN REPLY @462 /* It might save time if I had another sigil—I mean, the last thing I need is to waste time explaining who I am to people over and over again. */ GOTO 14
  IF ~  CheckStatGT(Player1,17,CHR)
~ THEN REPLY @462 /* It might save time if I had another sigil—I mean, the last thing I need is to waste time explaining who I am to people over and over again. */ GOTO 13
  IF ~~ THEN REPLY @463 /* I will do that. Thank you, mistress. */ DO ~SetGlobal("OHD_lostsigil","LOCALS",1)
~ EXIT
  IF ~~ THEN REPLY @453 /* As you wish. */ DO ~SetGlobal("OHD_lostsigil","LOCALS",1)
~ EXIT
END

IF ~~ THEN BEGIN 13 // from: 12.1
  SAY @464 /* You lost your sigil and ask ME for a replacement? */
  IF ~~ THEN REPLY @465 /* Just a temporary one until I retrieve the original. */ GOTO 15
END

IF ~~ THEN BEGIN 14 // from: 12.0
  SAY @464 /* You lost your sigil and ask ME for a replacement? */
  IF ~~ THEN REPLY @465 /* Just a temporary one until I retrieve the original. */ GOTO 16
END

IF ~~ THEN BEGIN 15 // from: 13.0
  SAY @466 /* Very well. Here, but I want this back as soon as possible. Now stop wasting time. Go, go! */
  IF ~~ THEN DO ~SetGlobal("OHD_lostsigil","LOCALS",1)
~ EXIT
END

IF ~~ THEN BEGIN 16 // from: 14.0
  SAY @467 /* Stop wasting time and GO FIND THE SIGIL! */
  IF ~~ THEN DO ~SetGlobal("OHD_lostsigil","LOCALS",1)
~ EXIT
END

IF ~~ THEN BEGIN 17 // from: 9.1
  SAY @468 /* You deny me? */
  IF ~~ THEN REPLY @469 /* Reluctantly, yes. */ GOTO 18
  IF ~~ THEN REPLY @470 /* Only because you ask for something I do not want to give. */ GOTO 18
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @471 /* Yes. How does that make you feel? */ GOTO 18
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @471 /* Yes. How does that make you feel? */ EXTERN ~DORN25J~ 79
END

IF ~~ THEN BEGIN 18 // from: 8.2 9.2 17.0 17.1 17.2
  SAY @472 /* Prepare to feel Tyr's wrath, <PRO_RACE>! */
  IF ~~ THEN DO ~Shout(310)
Enemy()
~ EXIT
END

IF ~  Global("OHD_pavilion","OH5500",0) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 19 // from:
  SAY @473 /* You are the few who answered my call. You handful of righteous men and women will enforce the laws of Tyr, carrying out his judgments where other mortal agents fail. */
  IF ~  !IfValidForPartyDialogue("dorn")
Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY @474 /* This sounds interesting. */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ GOTO 20
  IF ~  IfValidForPartyDialogue("dorn")
Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY @475 /* Wait a moment. I would hear this planetar speak. */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ EXTERN ~DORN25J~ 80
  IF ~  !IfValidForPartyDialogue("dorn")
Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY @476 /* The last thing we want to be around is people looking to enforce Tyr's will. Let's move on. */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ EXIT
  IF ~  IfValidForPartyDialogue("dorn")
Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY @476 /* The last thing we want to be around is people looking to enforce Tyr's will. Let's move on. */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ EXTERN ~DORN25J~ 81
  IF ~  Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY @477 /* I answer another call, planetar—a call for your destruction! */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ GOTO 25
  IF ~  Global("OHD_planetar_said_intro","OH5500",1)
~ THEN GOTO 20
END

IF ~~ THEN BEGIN 20 // from: 19.0 19.5
  SAY @478 /* For each of you, I have a sigil granting permission to enter the White Pavilion. */
  IF ~~ THEN GOTO 21
  IF ~  IfValidForPartyDialogue("dorn")
Global("OHD_said_sigil_handy","OH5500",0)
~ THEN EXTERN ~DORN25J~ 82
END

IF ~~ THEN BEGIN 21 // from: 20.0
  SAY @479 /* Come now, and receive Tyr's gift. */
  IF ~~ THEN DO ~SetGlobal("OHD_pavilion","OH5500",1)
~ EXIT
END

IF ~  Global("OHD_pavilion","OH5500",1) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 22 // from:
  SAY @480 /* What is your name, Champion of Tyr? */
  IF ~~ THEN REPLY @481 /* I am <CHARNAME>. */ GOTO 23
  IF ~~ THEN REPLY @482 /* Keldorn Firecam. */ GOTO 24
  IF ~  CheckStatLT(Player1,14,CHR)
~ THEN REPLY @483 /* My name is Rodesi Ponz. */ GOTO 30
  IF ~  CheckStatGT(Player1,13,CHR)
~ THEN REPLY @483 /* My name is Rodesi Ponz. */ GOTO 29
  IF ~~ THEN REPLY @484 /* I am your doom, planetar. */ GOTO 25
END

IF ~~ THEN BEGIN 23 // from: 22.0
  SAY @485 /* I know that name... But from where...? */
  IF ~~ THEN REPLY @486 /* I could not say. */ GOTO 31
  IF ~  CheckStatLT(Player1,14,CHR)
~ THEN REPLY @487 /* You say my deeds in Tyr's service are known even in this elevated place? You honor me, planetar. */ GOTO 31
  IF ~  CheckStatGT(Player1,13,CHR)
~ THEN REPLY @487 /* You say my deeds in Tyr's service are known even in this elevated place? You honor me, planetar. */ GOTO 33
  IF ~~ THEN REPLY @488 /* From the Scroll of Retribution, most likely—I'll earn my place within it with your annihilation! */ GOTO 25
END

IF ~~ THEN BEGIN 24 // from: 22.1
  SAY @489 /* I know this name. But—you are a paladin of Torm. */
  IF ~  CheckStatLT(Player1,17,CHR)
~ THEN REPLY @490 /* That is my father's brother. I was named after him. As much as I respect him, my loyalty is to Tyr. */ GOTO 28
  IF ~  CheckStatGT(Player1,16,CHR)
~ THEN REPLY @490 /* That is my father's brother. I was named after him. As much as I respect him, my loyalty is to Tyr. */ GOTO 27
  IF ~~ THEN REPLY @491 /* Damn. I was hoping you wouldn't catch that. */ GOTO 26
  IF ~~ THEN REPLY @492 /* No longer. Now, I am your death incarnate. */ GOTO 25
END

IF ~~ THEN BEGIN 25 // from: 19.4 22.4 23.3 24.3
  SAY @493 /* You dare threaten a planetar of the Night's Eye Battalion? In Lunia, of all places? You are mad, <PRO_RACE>—your destruction will be a mercy. */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 26 // from: 24.2
  SAY @494 /* Deceiver! Taste the Maimed God's justice! */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 27 // from: 24.1
  SAY @495 /* Your uncle is well known and respected, Firecam. You will make a fine champion for the Just God. */
  IF ~~ THEN DO ~AddJournalEntry(89726,INFO)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
~ EXIT
END

IF ~~ THEN BEGIN 28 // from: 24.0
  SAY @496 /* Your lies are skilled and graceful, whoever you are. But I'm not deceived. Champions of Tyr! Strike this deceiver down! */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 29 // from: 22.3
  SAY @497 /* Take this sigil, Rodesi Ponz. Go forth with Tyr's blessing, and do his work. */
  IF ~~ THEN DO ~AddJournalEntry(89726,INFO)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
~ EXIT
END

IF ~~ THEN BEGIN 30 // from: 22.2
  SAY @498 /* No... Something in your words rings false. */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 31 // from: 23.0 23.1
  SAY @499 /* It was recently I heard it—no, saw it. @191 /* <CHARNAME>. */ Ah. I know it now. */
  IF ~~ THEN GOTO 32
END

IF ~~ THEN BEGIN 32 // from: 31.0
  SAY @500 /* Their name is written in the Scroll of Retribution! Champions of Tyr, strike them down, now! */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 33 // from: 23.2
  SAY @501 /* Hm, yes. I guess... Take this sigil, <CHARNAME>. Go forth with Tyr's blessing and do his work. */
  IF ~~ THEN DO ~AddJournalEntry(89726,INFO)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
~ EXIT
END

/* lfgp */

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
