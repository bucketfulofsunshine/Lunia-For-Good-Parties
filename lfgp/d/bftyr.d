BEGIN BFTYR

/* talk 1 */
CHAIN IF ~Global("bfstyrtalkfirst","GLOBAL",0)~ THEN BFTYR bfs.divinereckoning
@110 /* The rot that festered within my court has revealed itself. Justice, at last, has been served. */
DO ~SetGlobal("bfstyrtalkfirst","GLOBAL",1)~
= @111 /* Even in Lunia, there are those who would twist the law to serve their own ends. Know that I was not blind to this treachery - I placed my faith in those who would recognize injustice. */
= @112 /* My faithful have acted as I had hoped. As have you. But the reckoning is not yet complete. */
= @113 /* Many of Cyric's brood still linger, and I will tolerate their presence no longer. The last of these deceivers must be struck down. Will you take up this task, <CHARNAME>? Will you aid me in delivering judgment? */
== SAREV25J IF ~InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_EVIL)~ THEN @114 /* The god of justice petitions a spawn of murder for help. Tell me, <CHARNAME>, does the irony not amuse you? */
== IMOEN25J IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @115 /* Being spoken to by a god is… kind of terrifying. I don't think I'll ever get used to it. But we've made it this far, right? */
== MINSC25J IF ~InParty("MINSC") InMyArea("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @116 /* We shall hunt down these traitors and give them swift hamster justice! */
END
++ @117 /* I will see justice done. */ EXTERN BFTYR bfs.reckoningisdue
++ @118 /* You say you saw the signs. Why did you wait until now to act? */ EXTERN BFTYR bfs.belatedjustice
++ @119 /* I came here to clear my name, not clean your house. Why should I care? */ EXTERN BFTYR bfs.belatedjustice
++ @120 /* I will do what must be done. But know I'm not pleased about being used like this. */ EXTERN BFTYR bfs.reckoningisdue

CHAIN BFTYR bfs.reckoningisdue
@121 /* Then let the scales be balanced. */
DO ~AddJournalEntry(@100006, QUEST) DestroySelf()~ EXIT

CHAIN BFTYR bfs.belatedjustice
@122 /* While I could have exposed Cyric's cult sooner, it would not have served justice fully, for you would remain unaware of those acting against you. As the implicated party, I believed your participation to be the truest form of fairness. */
END
++ @117 /* I will see justice done. */ EXTERN BFTYR bfs.reckoningisdue
++ @120 /* I will do what must be done. But know I'm not pleased about being used like this. */ EXTERN BFTYR bfs.reckoningisdue

/* talk 2, quest end */
CHAIN IF ~Global("bfstyrtalksecond","GLOBAL",0)~ THEN BFTYR bfs.divinereckoning
@123 /* The shadow of Cyric's brood darkens Lunia's shores no further. You have earned my gratitude, <CHARNAME>. Not merely for your assistance in dealing with these invaders, but for the grace with which you bore false accusations. */
DO ~SetGlobal("bfstyrtalksecond","GLOBAL",1)~
= @124 /* A word of caution. Many gazes turn upon you. Some envious of the power you now hold, some afraid of what you might yet become. Such is the burden of divine blood. Know this: You have won my regard, and with it, an ally in the heavens should you ever choose to ascend. */
== KELDO25J IF ~InParty("KELDORN") InMyArea("KELDORN") !StateCheck("KELDORN",CD_STATE_NOTVALID)~ THEN @125 /* Tyr's grace is not bestowed lightly. We carried the burden of upholding justice, and we have not faltered in that duty this day. */
== ANOME25J IF ~InParty("ANOMEN") InMyArea("ANOMEN") !StateCheck("ANOMEN",CD_STATE_NOTVALID) Alignment("ANOMEN",LAWFUL_GOOD)~ THEN @126 /* 'Tis an honor to stand before the god of justice and know that one's cause is righteous. */
== VALYG25J IF ~InParty("VALYGAR") InMyArea("VALYGAR") !StateCheck("VALYGAR",CD_STATE_NOTVALID)~ THEN @127 /* Strange to be called an ally by a god. But I suspect things will grow stranger with you still. */
== IMOEN25J IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @128 /* I hope his praise won't go to your head, <CHARNAME>. I mean, you *did* earn it, but still. */
== VICON25J IF ~InParty("VICONIA") InMyArea("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @129 /* A god's favor? Hmph. Be wary, <CHARNAME>. Gifts from deities often come with chains you cannot see. */
== HAERD25J IF ~InParty("HAERDALIS") InMyArea("HAERDALIS") !StateCheck("HAERDALIS",CD_STATE_NOTVALID)~ THEN @130 /* ...And so this play draws to its conclusion, with the choirs singing your name, and a deity's favor bestowed. */
== EDWIN25J IF ~InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @131 /* Pfah! The next time the gods need a mop and bucket, I'll be sure to send them your way, <CHARNAME>. */
END
++ @132 /* Someday, I may hope to avail myself of that assistance. */ EXTERN BFTYR bfs.divinefavor
++ @133 /* I don't seek power, only peace. But still, I thank you for your words. */ EXTERN BFTYR bfs.divinefavor
++ @134 /* Just make sure no more *broods* find their way into your court. */ EXTERN BFTYR bfs.divinefavor

CHAIN BFTYR bfs.divinefavor
@135 /* I have reopened the way to the Prime. Go with my blessing - and may your path be one of your own choosing. */
DO ~AddJournalEntry(@100007, QUEST_DONE) GiveItemCreate("bftplat0",Player1,1,0,0) DestroySelf()~
EXIT
