BEGIN bfsmod

IF ~Global("bfslawquest","GLOBAL",1)~ THEN BEGIN bfs.errorcontinues
SAY @27 /* Error detected. */
IF ~~ THEN EXIT
END

/* malfunctioning inevitable */
CHAIN IF ~Global("bfslawquest","GLOBAL",0)~ THEN bfsmod bfs.dueprocess
@28 /* Axis corrupted. Path unclear. Mission parameters breached. */
= @29 /* A criminal was apprehended. A celestial intervened. Issued statement: Justice must be tempered with mercy. No protocol exists for this. */
DO ~SetGlobal("bfslawquest","GLOBAL",1)~
END
++ @30 /* Are you malfunctioning? */ EXTERN BFSMOD bfs.lawquest
++ @31 /* It seems you're in a bit of a moral conundrum. */ EXTERN BFSMOD bfs.lawquest
++ @32 /* I'm not getting dragged into your personal crisis. I have enough problems of my own. */ EXIT

CHAIN BFSMOD bfs.lawquest
@33 /* System error: Relationship between justice and mercy unclear. Clarification required. */
== BFSMOD @34 /* Define the difference between a just ruler and a tyrant. Do they not both follow the law? */
== NEERA25J IF ~InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ @35 /* Why do we need rulers at all? Let people figure things out for themselves. */
END
++ @36 /* Merciful rulers enforce the law to protect everyone. Tyrants use it to raise themselves above others. */ EXTERN BFSMOD bfs.lawfulgood
++ @37 /* The difference is in *why* law is upheld. Justice is not in the letter of the law but rather its spirit. */ EXTERN BFSMOD bfs.lawfulabstract
++ @38 /* There is no difference between them. Good or evil, stability is preferable to chaos. A just ruler always upholds the law. */ EXTERN BFSMOD bfs.lawfulpure
++ @39 /* Perhaps. But a law is only worth following if it serves a greater kindness. */ EXTERN BFSMOD bfs.neutralpure
++ @40 /* I don't believe there should be any rulers or laws. */ EXTERN BFSMOD bfs.chaosrules

CHAIN BFSMOD bfs.lawfulabstract
@41 /* Abstract Concept: Spirit. Moral intent supersedes lawful structure? Noted. System recalibrating... */
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.lawfulgood
@42 /* Hypothesis: Moral intent supersedes lawful structure? Noted. System recalibrating... */
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.lawfulpure
@43 /* Conclusion: Moral alignment comes secondary to functionality. Noted. System recalibrating... */
= @44 /* I-I like you. */
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.neutralpure
@45 /* Anomaly Logged: Disobedience is classified as virtue. */
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.chaosrules
@46 /* System. Unstable. */
= @47 /* …Fascinating. */
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.secondquery
@48 /* Query Two: A thief steals bread out of hunger. Exile is the lawful punishment. Would enforcing it not be justice? */
== MINSC25J IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @49 /* Boo says no! You feed the hungry, you do not toss them into the cold! */
== IMOEN25J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @50 /* Exile? Just for swiping a loaf of bread? Sounds like cruelty with extra paperwork to me. */
== MAZZY25J IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @51 /* Justice must account for circumstance. If punishment causes greater harm than the crime, then the law is wrong not the people. */
== EDWIN25J IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @52 /* Why stop at exile? Brand the thief. Lash them. You must set an example. */
END
++ @53 /* Only if mercy is absent. Punishment without context is cruelty, not justice. */ EXTERN BFSMOD bfs.lawquestconclude
++ @54 /* You have the right of it. The law is clear. Emotion must not interfere. */ EXTERN BFSMOD bfs.lawquestconclude
++ @55 /* No, we should feed the hungry, not cast them out. */ EXTERN BFSMOD bfs.lawquestconclude
++ @56 /* *Poetic* justice would be exiling the lawmaker, not the thief. */ EXTERN BFSMOD bfs.lawquestconclude

CHAIN BFSMOD bfs.lawquestconclude
@57 /* Hypothesis forming... Processing... */
= @58 /* Error: Mercy Not Found. System restarting. */
= @59 /* ... */
= @60 /* My Judgment Protocol has been restored. Gratitude uploaded. */
= @61 /* May your equations balance. */
DO ~SetGlobal("bfslawquest","GLOBAL",2) AddJournalEntry(@9001, QUEST_DONE) GiveItemCreate("bfcog",Player1,1,0,0) EscapeAreaNoSee()~ EXIT
