BEGIN bfsmod

/* malfunctioning inevitable */
CHAIN IF ~NumberOfTimesTalkedTo(0)~ THEN bfsmod bfs.dueprocess
~Axis corrupted. Path unclear. Mission parameters breached.~
= ~The criminal was apprehended, a celestial intervened. Issued statement: Justice must be tempered with mercy. No protocol exists for this.~
END
++ ~I'm not getting dragged into your personal crisis. I have enough problem of my own.~ EXIT
++ ~Are you malfunctioning?~ EXTERN BFSMOD bfs.lawquest
++ ~It seems you're in a bit of a moral conundrum.~ EXTERN BFSMOD bfs.lawquest 

CHAIN BFSMOD bfs.lawquest
~System Error: Relation between justice and mercy. You will supply clarification.~
== BFSMOD ~Define the difference between a just ruler and a tyrant. Do both not obey the law?~ 
== RASAA25J IF ~InParty("RASAAD") InMyArea("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ ~A just ruler serves others. A tyrant demands to be served.~
== NEERA25J IF ~InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ ~Why do we need to be ruled at all? Just let people figure things out for themselves.~
END
++ ~Merciful rulers enforce the law to protect everyone. Tyrants use it to raise themselves above others.~ EXTERN BFSMOD bfs.lawfulgood
++ ~The difference is in *why* law is upheld. Justice is not in the letter of the law but rather its spirit.~ EXTERN BFSMOD bfs.lawfulabstract
++ ~There is no difference between them. Whether good or evil, stability is preferable to chaos. A just ruler always upholds the law.~ EXTERN BFSMOD bfs.lawfulpure
++ ~Perhaps. But a law is only worth following if it serves a greater kindness.~ EXTERN BFSMOD bfs.neutralpure
++ ~I don't believe there should be any rulers. And I will break every law if I must to overthrow them.~ EXTERN BFSMOD bfs.chaosrules

CHAIN BFSMOD bfs.lawfulabstract
~Abstract Concept: Spirit. Moral intent supersedes lawful structure? Noted. System recalibrating...~
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.lawfulgood
~Hypothesis: Moral intent supersedes lawful structure? Noted. System recalibrating...~
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.lawfulpure
~Conclusion: Moral alignment comes secondary to functionality. Noted. System recalibrating...~
= ~I-I like you.~
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.neutralpure
~Anomaly Logged: Disobedience is classified as virtue.~
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.chaosrules
~System. Unstable.~
= ~ …Fascinating.~
END
IF ~~ EXTERN BFSMOD bfs.secondquery

CHAIN BFSMOD bfs.secondquery
~Query two. A thief steals bread because they are hungry. Exile is the lawful punishment. Would following it not be justice?~
== MINSC25J IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN ~Boo says no! You feed the hungry, you do not toss them into the cold!~
== IMOEN25J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN ~Exile? Just for swiping a loaf of bread? Sounds like cruelty with extra paperwork to me.~
== MAZZY25J IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~Justice must account for circumstance. If punishment brings more suffering than the crime, then the law is wrong not the people.~
== EDWIN25J IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN ~Why stop at exile? Brand the thief. Lash them. Set an example.~
END
++ ~Only if mercy is absent. Punishment without context is cruelty not justice.~ EXTERN BFSMOD bfs.lawquestconclude
++ ~You have the right of it. The law is clear. Emotion must not interfere.~ EXTERN BFSMOD bfs.lawquestconclude
++ ~No, we should feed the hungry, not cast them out.~ EXTERN BFSMOD bfs.lawquestconclude
++ ~Poetic justice would be exiling the lawmaker not the thief.~ EXTERN BFSMOD bfs.lawquestconclude

CHAIN BFSMOD bfs.lawquestconclude
~Hypothesis forming... Processing...~
= ~Error: Mercy Not Found. System restarting.~
= ~...~
= ~You have restored my Judgment Protocol. Gratitude uploaded.~
= ~May your equations balance.~ 
DO ~AddJournalEntry(@9001, QUEST_DONE) GiveItem("",Player1) EscapeAreaNoSee()~ EXIT
