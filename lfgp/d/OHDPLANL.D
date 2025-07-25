BEGIN ~OHDPLANL~

IF ~  Global("OHD_lostsigil","LOCALS",1) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 0 // from:
  SAY #89785 /* ~Have you found the sigil yet?~ [OH89785] */
  IF ~~ THEN REPLY #89841 /* ~Not yet, no.~ */ GOTO 1
  IF ~~ THEN REPLY #89842 /* ~I'm close now. Very close. I can almost taste it.~ */ GOTO 1
  IF ~~ THEN REPLY #89843 /* ~When I have it, I'll tell you.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0 0.1 0.2
  SAY #89786 /* ~Then why are you talking to me? Go!~ [OH89786] */
  IF ~~ THEN EXIT
END

IF ~  Global("OHD_pavilion","OH5500",2) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 2 // from:
  SAY #89739 /* ~Ho there, <PRO_RACE>. Why do you still tarry here?~ [OH89739] */
  IF ~~ THEN REPLY #89787 /* ~I await Tyr's guidance.~ */ GOTO 3
  IF ~~ THEN REPLY #89788 /* ~Tyr has inspired me to go to a place called the Pavilion of Righteous Wrath. Do you know it?~ */ GOTO 4
  IF ~~ THEN REPLY #89789 /* ~I do not know when, or if, I shall see this place again. I just want to take it all in.~ */ GOTO 5
  IF ~~ THEN REPLY #89790 /* ~That is no business of yours.~ */ GOTO 6
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #89740 /* ~You are wise to do so. Be patient. I am sure he will speak to you soon.~ [OH89740] */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4 // from: 2.1
  SAY #89742 /* ~Indeed I do. It is a straight line from the gates to the earthly realm, through here, past the Statue of the Sentinel, to the Pavilion. On foot, you'll need to take one of the stairways available yonder. When you see the Sentinel, you'll not have far to go—its back is to the Pavilion.~ [OH89742] */
  IF ~~ THEN REPLY #89791 /* ~I thank you.~ */ EXIT
END

IF ~~ THEN BEGIN 5 // from: 2.2
  SAY #89747 /* ~Lunia is a wonder. But do not be distracted by its glories—there is work to be done in the earthly realms.~ [OH89747] */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 6 // from: 2.3
  SAY #89750 /* ~No business of mine? As a crusader of Tyr, you are mine to command.~ [OH89750] */
  IF ~  CheckStatLT(Player1,14,CHR)
~ THEN REPLY #89792 /* ~Forgive me. I spoke in haste.~ */ GOTO 8
  IF ~  CheckStatGT(Player1,13,CHR)
~ THEN REPLY #89792 /* ~Forgive me. I spoke in haste.~ */ GOTO 7
  IF ~~ THEN REPLY #89793 /* ~No one commands me.~ */ GOTO 8
END

IF ~~ THEN BEGIN 7 // from: 6.1
  SAY #89752 /* ~Next time, think before you speak.~ [OH89752] */
  IF ~~ THEN REPLY #89795 /* ~I will. Again, my apologies.~ */ EXIT
END

IF ~~ THEN BEGIN 8 // from: 6.0 6.2
  SAY #89754 /* ~Such behavior is beneath one of your esteemed rank. You are not fit to carry the sigil—hand it over.~ [OH89754] */
  IF ~~ THEN REPLY #89798 /* ~No, please, don't make me do that.~ */ GOTO 9
  IF ~~ THEN REPLY #89800 /* ~I can't. I lost it.~ */ GOTO 11
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #89803 /* ~The only thing I'll give you is a quick death.~ */ GOTO 18
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #89803 /* ~The only thing I'll give you is a quick death.~ */ EXTERN ~DORN25J~ 79
END

IF ~~ THEN BEGIN 9 // from: 8.0
  SAY #89756 /* ~In time, if you are penitent and humble, you may be redeemed. For the moment, however, I strip you of your rank. Give me your sigil.~ [OH89756] */
  IF ~~ THEN REPLY #89805 /* ~As you wish.~ */ DO ~TakePartyItem("ohdsigil")
~ GOTO 10
  IF ~~ THEN REPLY #89808 /* ~I'd really rather not.~ */ GOTO 17
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #89810 /* ~Give me your life, godsucker.~ */ GOTO 18
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #89810 /* ~Give me your life, godsucker.~ */ EXTERN ~DORN25J~ 79
END

IF ~~ THEN BEGIN 10 // from: 9.0
  SAY #89758 /* ~Go now. Take some time over there at the Constellations to reflect on your sins of pride and arrogance.~ [OH89758] */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 11 // from: 8.1
  SAY #89761 /* ~What?~ [OH89761] */
  IF ~~ THEN REPLY #89813 /* ~I lost it. That's why I was so curt with you. I was upset and afraid of what might happen if you learned of my mistake.~ */ GOTO 12
  IF ~~ THEN REPLY #89816 /* ~Someone stole it. There are unsavory characters around this place.~ */ GOTO 12
  IF ~~ THEN REPLY #89820 /* ~It's gone. I don't know how it happened.~ */ GOTO 12
END

IF ~~ THEN BEGIN 12 // from: 11.0 11.1 11.2
  SAY #89764 /* ~Well, don't just stand around sulking—find the sigil. Its value is incalculable!~ [OH89764] */
  IF ~  CheckStatLT(Player1,18,CHR)
~ THEN REPLY #89825 /* ~It might save time if I had another sigil—I mean, the last thing I need is to waste time explaining who I am to people over and over again.~ */ GOTO 14
  IF ~  CheckStatGT(Player1,17,CHR)
~ THEN REPLY #89825 /* ~It might save time if I had another sigil—I mean, the last thing I need is to waste time explaining who I am to people over and over again.~ */ GOTO 13
  IF ~~ THEN REPLY #89827 /* ~I will do that. Thank you, mistress.~ */ DO ~SetGlobal("OHD_lostsigil","LOCALS",1)
~ EXIT
  IF ~~ THEN REPLY #89805 /* ~As you wish.~ */ DO ~SetGlobal("OHD_lostsigil","LOCALS",1)
~ EXIT
END

IF ~~ THEN BEGIN 13 // from: 12.1
  SAY #89766 /* ~You lost your sigil and ask ME for a replacement?~ [OH89766] */
  IF ~~ THEN REPLY #89831 /* ~Just a temporary one until I retrieve the original.~ */ GOTO 15
END

IF ~~ THEN BEGIN 14 // from: 12.0
  SAY #89766 /* ~You lost your sigil and ask ME for a replacement?~ [OH89766] */
  IF ~~ THEN REPLY #89831 /* ~Just a temporary one until I retrieve the original.~ */ GOTO 16
END

IF ~~ THEN BEGIN 15 // from: 13.0
  SAY #89769 /* ~Very well. Here, but I want this back as soon as possible. Now stop wasting time. Go, go!~ [OH89769] */
  IF ~~ THEN DO ~SetGlobal("OHD_lostsigil","LOCALS",1)
~ EXIT
END

IF ~~ THEN BEGIN 16 // from: 14.0
  SAY #89772 /* ~Stop wasting time and GO FIND THE SIGIL!~ [OH89772] */
  IF ~~ THEN DO ~SetGlobal("OHD_lostsigil","LOCALS",1)
~ EXIT
END

IF ~~ THEN BEGIN 17 // from: 9.1
  SAY #89775 /* ~You deny me?~ [OH89775] */
  IF ~~ THEN REPLY #89835 /* ~Reluctantly, yes.~ */ GOTO 18
  IF ~~ THEN REPLY #89838 /* ~Only because you ask for something I do not want to give.~ */ GOTO 18
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY #89840 /* ~Yes. How does that make you feel?~ */ GOTO 18
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY #89840 /* ~Yes. How does that make you feel?~ */ EXTERN ~DORN25J~ 79
END

IF ~~ THEN BEGIN 18 // from: 8.2 9.2 17.0 17.1 17.2
  SAY #89784 /* ~Prepare to feel Tyr's wrath, <PRO_RACE>!~ [OH89784] */
  IF ~~ THEN DO ~Shout(310)
Enemy()
~ EXIT
END

IF ~  Global("OHD_pavilion","OH5500",0) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 19 // from:
  SAY #89695 /* ~You are the few who answered my call. You handful of righteous men and women will enforce the laws of Tyr, carrying out his judgments where other mortal agents fail.~ [OH89695] */
  IF ~  !IfValidForPartyDialogue("dorn")
Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY #98922 /* ~This sounds interesting.~ */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ GOTO 20
  IF ~  IfValidForPartyDialogue("dorn")
Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY #89713 /* ~Wait a moment. I would hear this planetar speak.~ */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ EXTERN ~DORN25J~ 80
  IF ~  !IfValidForPartyDialogue("dorn")
Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY #89714 /* ~The last thing we want to be around is people looking to enforce Tyr's will. Let's move on.~ */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ EXIT
  IF ~  IfValidForPartyDialogue("dorn")
Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY #89714 /* ~The last thing we want to be around is people looking to enforce Tyr's will. Let's move on.~ */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ EXTERN ~DORN25J~ 81
  IF ~  Global("OHD_planetar_said_intro","OH5500",0)
~ THEN REPLY #89715 /* ~I answer another call, planetar—a call for your destruction!~ */ DO ~SetGlobal("OHD_planetar_said_intro","OH5500",1)
~ GOTO 25
  IF ~  Global("OHD_planetar_said_intro","OH5500",1)
~ THEN GOTO 20
END

IF ~~ THEN BEGIN 20 // from: 19.0 19.5
  SAY #89698 /* ~For each of you, I have a sigil granting permission to enter the White Pavilion.~ [OH89698] */
  IF ~~ THEN GOTO 21
  IF ~  IfValidForPartyDialogue("dorn")
Global("OHD_said_sigil_handy","OH5500",0)
~ THEN EXTERN ~DORN25J~ 82
END

IF ~~ THEN BEGIN 21 // from: 20.0
  SAY #89700 /* ~Come now, and receive Tyr's gift.~ [OH89700] */
  IF ~~ THEN DO ~SetGlobal("OHD_pavilion","OH5500",1)
~ EXIT
END

IF ~  Global("OHD_pavilion","OH5500",1) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 22 // from:
  SAY #89701 /* ~What is your name, Champion of Tyr?~ [OH89701] */
  IF ~~ THEN REPLY #89716 /* ~I am <CHARNAME>.~ */ GOTO 23
  IF ~~ THEN REPLY #89717 /* ~Keldorn Firecam.~ */ GOTO 24
  IF ~  CheckStatLT(Player1,14,CHR)
~ THEN REPLY #89718 /* ~My name is Rodesi Ponz.~ */ GOTO 30
  IF ~  CheckStatGT(Player1,13,CHR)
~ THEN REPLY #89718 /* ~My name is Rodesi Ponz.~ */ GOTO 29
  IF ~~ THEN REPLY #89719 /* ~I am your doom, planetar.~ */ GOTO 25
END

IF ~~ THEN BEGIN 23 // from: 22.0
  SAY #89702 /* ~I know that name... But from where...?~ [OH89702] */
  IF ~~ THEN REPLY #89720 /* ~I could not say.~ */ GOTO 31
  IF ~  CheckStatLT(Player1,14,CHR)
~ THEN REPLY #89721 /* ~You say my deeds in Tyr's service are known even in this elevated place? You honor me, planetar.~ */ GOTO 31
  IF ~  CheckStatGT(Player1,13,CHR)
~ THEN REPLY #89721 /* ~You say my deeds in Tyr's service are known even in this elevated place? You honor me, planetar.~ */ GOTO 33
  IF ~~ THEN REPLY #89722 /* ~From the Scroll of Retribution, most likely—I'll earn my place within it with your annihilation!~ */ GOTO 25
END

IF ~~ THEN BEGIN 24 // from: 22.1
  SAY #89703 /* ~I know this name. But—you are a paladin of Torm.~ [OH89703] */
  IF ~  CheckStatLT(Player1,17,CHR)
~ THEN REPLY #89723 /* ~That is my father's brother. I was named after him. As much as I respect him, my loyalty is to Tyr.~ */ GOTO 28
  IF ~  CheckStatGT(Player1,16,CHR)
~ THEN REPLY #89723 /* ~That is my father's brother. I was named after him. As much as I respect him, my loyalty is to Tyr.~ */ GOTO 27
  IF ~~ THEN REPLY #89724 /* ~Damn. I was hoping you wouldn't catch that.~ */ GOTO 26
  IF ~~ THEN REPLY #89725 /* ~No longer. Now, I am your death incarnate.~ */ GOTO 25
END

IF ~~ THEN BEGIN 25 // from: 19.4 22.4 23.3 24.3
  SAY #89704 /* ~You dare threaten a planetar of the Night's Eye Battalion? In Lunia, of all places? You are mad, <PRO_RACE>—your destruction will be a mercy.~ [OH89704] */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 26 // from: 24.2
  SAY #89705 /* ~Deceiver! Taste the Maimed God's justice!~ [OH89705] */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 27 // from: 24.1
  SAY #89706 /* ~Your uncle is well known and respected, Firecam. You will make a fine champion for the Just God.~ [OH89706] */
  IF ~~ THEN DO ~AddJournalEntry(89726,INFO)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
~ EXIT
END

IF ~~ THEN BEGIN 28 // from: 24.0
  SAY #89707 /* ~Your lies are skilled and graceful, whoever you are. But I'm not deceived. Champions of Tyr! Strike this deceiver down!~ [OH89707] */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 29 // from: 22.3
  SAY #89708 /* ~Take this sigil, Rodesi Ponz. Go forth with Tyr's blessing, and do his work.~ [OH89708] */
  IF ~~ THEN DO ~AddJournalEntry(89726,INFO)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
~ EXIT
END

IF ~~ THEN BEGIN 30 // from: 22.2
  SAY #89709 /* ~No... Something in your words rings false.~ [OH89709] */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 31 // from: 23.0 23.1
  SAY #89710 /* ~It was recently I heard it—no, saw it. "<CHARNAME>." Ah. I know it now.~ [OH89710] */
  IF ~~ THEN GOTO 32
END

IF ~~ THEN BEGIN 32 // from: 31.0
  SAY #89711 /* ~Their name is written in the Scroll of Retribution! Champions of Tyr, strike them down, now!~ [OH89711] */
  IF ~~ THEN DO ~AddJournalEntry(89727,INFO)
Shout(310)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 33 // from: 23.2
  SAY #89712 /* ~Hm, yes. I guess... Take this sigil, <CHARNAME>. Go forth with Tyr's blessing and do his work.~ [OH89712] */
  IF ~~ THEN DO ~AddJournalEntry(89726,INFO)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
~ EXIT
END

/* lfgp */

IF ~Global("OHD_pavilion","OH5500",0) Global("bfsluniaaccepted","GLOBAL",1)~ THEN BEGIN bfs.planintro
  SAY #89695 /* ~You are the few who answered my call. You handful of righteous men and women will enforce the laws of Tyr, carrying out his judgments where other mortal agents fail.~ [OH89695] */
IF ~~ THEN GOTO bfs.plan1
END

IF ~~ THEN BEGIN bfs.plan1
  SAY #89698 /* ~For each of you, I have a sigil granting permission to enter the White Pavilion.~ [OH89698] */
  IF ~~ THEN GOTO bfs.plan2
END

IF ~~ THEN BEGIN bfs.plan2
  SAY ~Come now and receive Tyr's gift.~ [OH89700]
  IF ~~ THEN DO ~SetGlobal("OHD_pavilion","OH5500",1)
~ EXIT
END

/* traitor check */

IF ~GlobalGT("OHD_pavilion","OH5500",1) Global("bfsspoketoscribe","GLOBAL",1) Global("bfsplanetaraccused","LOCALS",0) !Global("bfstraitorconvo","GLOBAL",1) Global("bfsluniaaccepted","GLOBAL",1)~ THEN BEGIN bfs.traitorcheck
SAY ~Speak, <CHARNAME>. What burden weighs upon your soul?~
++ ~Did you command Naiman Alore to write down my name?~ DO ~SetGlobal("bfsplanetaraccused","LOCALS",1)~ + bfs.traitorcheckfalse
END

IF ~~ bfs.traitorcheckfalse
SAY ~Nay, 'twas not I who bade it.~
= ~Should you doubt my word, seek the testimony of those who dwell here. I stand as a sentinel, welcoming neophytes and aiding them in their duties.~
IF ~~ EXIT
END

/* general introduction */

CHAIN IF ~Global("OHD_pavilion","OH5500",1) Global("bfsluniaaccepted","GLOBAL",1)~ THEN OHDPLANL bfs.youstandaccused
~What is your name, Champion of Tyr?~ [OH89701]
END
++ ~I am <CHARNAME>.~ EXTERN OHDPLANL bfs.lunianewpath
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + ~Keldorn Firecam.~ EXTERN OHDPLANL bfs.veryfunny

CHAIN OHDPLANL bfs.veryfunny
~I know this name. But - you are a paladin of Torm.~ [OH89703]
== KELDO25J ~I believe they inquired after your name, not mine. But if names must be shared, then grant me the privilege of introducing you. This is <CHARNAME>, <PRO_HESHE> leads our party with courage and honor.~
END
IF ~~ EXTERN OHDPLANL bfs.lunianewpath

CHAIN OHDPLANL bfs.lunianewpath
~I know this name. Your arrival was anticipated. Seek out Naiman Alore, <CHARNAME>. As our scribe, who better to ascertain your guilt than the man who penned it? He awaits you near the Scroll of Retribution.~
== AERIE25J IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~My footsteps feel lighter here somehow. Would it be selfish of us to linger for a while?~
== ANOME25J IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",CHAOTIC_NEUTRAL)~ THEN ~I see no purpose to our visit here. 'Tis a refuge for fools who pretend that virtue and justice mean something.~
== IMOEN25J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN ~Just look at this place! Kinda makes you forget we're here to prove our innocence.~
== JAN25J IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~My distant cousin, Wren, once joined some crusade planning to storm the City of Judgment. He ended up in a cabbage market near Thesk shouting about soul taxes instead. Poor lad never could read a map. ...Yes, I'm aware this isn't the same locale. Must all my tales be relevant to the situation at hand?~
== VALYG25J IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~Lunia is not without its beauty. A pity that our circumstances offer us little cause to appreciate it.~
== NEERA25J IF ~InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN ~So this is Mount Celestia's front step? It's nice. I don't suppose there's a gift shop nearby? We should definitely grab some souvenirs before we leave.~
== OHDPLANL ~The White Pavilion welcomes you.~
DO ~AddJournalEntry(@100002, QUEST)
GiveItem("ohdsigil",Player1)
SetGlobal("OHD_pavilion","OH5500",2)
SetGlobal("OHD_planetar_said_intro","OH5500",1)~ EXIT
