BEGIN bfssol

/* planetar of justice */
CHAIN IF ~Global("bfssol","GLOBAL",0)~ THEN bfssol bfs.youstandaccused
@62 /* I greet you, <CHARNAME> of Candlekeep, and bear a most dire message. Your name has been writ upon the Scroll of Retribution. */
DO ~SetGlobal("bfssol","GLOBAL",1)~
END
++ @63 /* What is this Scroll of Retribution? I've never heard of it. */ EXTERN bfssol bfs.gimmethelore
++ @64 /* A grim turn of events. Of what crimes am I accused? */ EXTERN bfssol bfs.iobject
++ @65 /* If you're here to pass judgment, get on with it. I'm no stranger to false accusations. */ EXTERN bfssol bfs.judgeandjury

CHAIN bfssol bfs.gimmethelore
@66 /* It chronicles the sins of the vilest mortals. Once a name is inscribed, the devout take up arms to mete out justice upon the condemned. */
END
++ @64 /* A grim turn of events. Of what crimes am I accused? */ EXTERN bfssol bfs.iobject
++ @67 /* So a death sentence penned by a divine hand. Are you to be my executioner? */ EXTERN bfssol bfs.judgeandjury

CHAIN bfssol bfs.judgeandjury
@68 /* Nay. I arrive as a friend, not as your foe. */
END
IF ~~ EXTERN bfssol bfs.iobject

CHAIN bfssol bfs.iobject
@69 /* The greatest charge laid against you is thus: the destruction of Saradush and the death of those trapped within its walls. */
== bfssol @70 /* Yet even in Lunia, word of your righteous deeds has reached us. Many faithful believe that you wouldn't partake in such a massacre. */
== bfssol @71 /* You are summoned as a guest and not a condemned soul, to help us ascertain the truth. Speak in your defense. Aid in finding those who would make a mockery of Tyr's justice. */
== KELDO25J IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @72 /* To be named on the Scroll of Retribution is no trivial matter. But I have taken your measure, <CHARNAME>, and I will stand beside you wherever your path leads. */
== ANOME25J IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",LAWFUL_GOOD)~ THEN @73 /* I do not wish such a punishment on anyone lightly. But perhaps this is merely another trial. A final test to prove our worth before the eyes of the gods. */
== JAHEI25J IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @74 /* Tyr's servants do not act without reason, but neither are they infallible. I suggest we solve this misunderstanding before we fight a war on multiple fronts. */
== HAERD25J IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @75 /* It seems even the heavens have their dissonant notes. A word of caution, <CHARNAME>, I've performed in more forgiving courts than that one. */
== SAREV25J IF ~InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_GOOD)~ THEN @76 /* My past crimes earn me a thousand damnations, but Saradush's destruction isn't one of them. Let us put this matter to rest, <CHARNAME>. */
END
++ @77 /* If justice has been twisted, then I will set it right. Even if it means I must stand trial. */ EXTERN bfssol bfs.luniaquestaccept
++ @78 /* Innocents *did* die, but not by my hand. I will act on their behalf, not yours. */ EXTERN bfssol bfs.luniaquestaccept
++ @79 /* I care nothing for your laws and refuse to partake in these games. */ EXTERN bfssol bfs.luniaquestignore
++ @80 /* I won't be dragged into this. Let those who accuse me find their own answers. */ EXTERN bfssol bfs.luniaquestignore

CHAIN bfssol bfs.luniaquestaccept
@81 /* Take this feather with my gratitude. It permits those it deems worthy to enter Lunia. */
= @82 /* Walk with Tyr's blessing. */
DO ~AddJournalEntry(@100001, QUEST) SetGlobal("bfsluniaaccepted","GLOBAL",1) GiveItemCreate("bffea",Player1,1,0,0) CreateVisualEffectObject("SPUNHOLY",Myself) PlaySound("CAS_M08") Wait(2) DestroySelf()~ EXIT


CHAIN bfssol bfs.luniaquestignore
@83 /* So be it. I pray we do not cross blades in the days to come. */
DO ~CreateVisualEffectObject("SPPORTAL",Myself) PlaySound("CAS_M08") Wait(2) DestroySelf()~ EXIT
