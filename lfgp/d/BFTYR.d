BEGIN BFTYR

CHAIN IF ~Global("bfstyrtalkfirst","GLOBAL",0)~ THEN BFTYR bfs.divinereckoning
~The rot that festered within my court has revealed itself. Justice, at last, has been served.~
= ~Even in Lunia, there are those who would twist the law to serve their own ends. Know that I was not blind to this treachery - I placed my faith in those who would recognize injustice.~
= ~My faithful have acted as I had hoped. As have you. But the reckoning is not yet complete.~
= ~Many of Cyric's brood still linger, and I will tolerate their presence no longer. The last of these deceivers must be struck down. Will you take up this task, <CHARNAME>? Will you aid me in delivering judgment?~
== SAREV25J IF ~InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_EVIL)~ THEN ~The god of justice petitions a spawn of murder for help. Tell me, <CHARNAME>, does the irony not amuse you?~
== IMOEN25J IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN ~Being spoken to by a god is… kind of terrifying. I don't think I'll ever get used to it. But we've made it this far, right?~
== MINSC25J IF ~InParty("MINSC") InMyArea("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN ~We shall hunt down these traitors and give them swift hamster justice!~
END
++ ~I will see justice done.~ EXTERN BFTYR bfs.reckoningisdue
++ ~You say you saw the signs. Why did you wait until now to act?~ EXTERN BFTYR bfs.belatedjustice
++ ~I came here to clear my name, not clean your house. Why should I care?~ EXTERN BFTYR bfs.belatedjustice
++ ~I will do what must be done. But know I’m not pleased about being used like this.~ EXTERN BFTYR bfs.reckoningisdue

CHAIN BFTYR bfs.reckoningisdue
~Then let the scales be balanced.~
DO ~SetGlobal("bfstyrtalkfirst","GLOBAL",1) DestroySelf()~ EXIT

CHAIN BFTYR bfs.belatedjustice
~While I could have exposed Cyric's cult sooner, it would not have served justice fully, for you would remain unaware of those acting against you. As the implicated party, I believed your participation to be the truest form of fairness.~
END
++ ~I will see justice done.~ EXTERN BFTYR bfs.reckoningisdue
++ ~I will do what must be done. But know I'm not pleased about being used like this.~ EXTERN BFTYR bfs.reckoningisdue
