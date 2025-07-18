/* Vanilla Companion Interjections */

/* intro dialogue upon being transported to Lunia */
APPEND PLAYER1

IF ~Global("bfslun","GLOBAL",2) AreaCheck("OH5500")~ THEN BEGIN bfslun
SAY ~As you step into Lunia, peace drapes itself across your shoulders. The weight of your burdens ease...~
+ ~NumInPartyGT(1)~ + ~...if only for a moment.~ EXTERN Player1 bfslun_with_party
+ ~!NumInPartyGT(1)~ + ~...if only for a moment.~ DO ~SetGlobal("bfslun","GLOBAL",3)~ EXIT
END

END // FOR TOP APPEND

CHAIN Player1 bfslun_with_party
~You are not alone in this. Your companions were also affected.~
DO ~SetGlobal("bfslun","GLOBAL",3)~
== AERIE25J IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~Even without flight, my footsteps feel lighter here somehow. Would it be selfish of us to linger?~
== ANOME25J IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",LAWFUL_GOOD)~ THEN ~Let our actions at Saradush speak for themselves, the truth will see us vindicated.~
== ANOME25J IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",CHAOTIC_NEUTRAL)~ THEN ~I see no purpose to our visit here. 'Tis a paradise for fools who pretend that virtue and justice mean something.~
== EDWIN25J IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN ~Consorting with planetars. Bah! Let's silence these imbeciles and return to matters of actual import.~
== HAERD25J IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN ~It seems even the heavens have their dissonant notes. A word of advice, <CHARNAME>, I've performed in more forgiving courts than this one.~
== IMOEN25J IF ~InParty("Imoen") InMyArea("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN ~Just look at this place! Kinda makes you forget that we're here to prove our innocence, huh?~
== JAHEI25J IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~We'll clear our names through our actions, <CHARNAME>, not by currying celestial favour.~
== JAN25J IF ~InParty("JAN") InMyArea("JAN") !StateCheck("JAN",CD_STATE_NOTVALID)~ THEN ~My distant cousin Dabbledobonce once joined some crusade to storm the City of Judgment. He ended up in a cabbage market near Thesk shouting about soul taxes. Poor lad never could read a map. ...Wait, this isn't that same City of Judgment?~
== KELDO25J IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~To stand accused of such vile crimes, even falsely, tests my resolve. But I have faith in the judgment of this realm. We will see our names cleared yet.~
== MAZZY25J IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~We have been wronged but even now we shall not falter. If ever there was ever a place to proclaim the truth, then it is here.~
== MINSC25J IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN ~We are not villains, we are heroes! Come, Boo, we must sniff out this book so we can fix it.~
== NALIA25J IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN ~I've seen nobles twist justice with promises of gold. Let's hope the heavens aren't so easily swayed from the truth.~
== VALYG25J IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~This place is not without it's beauty. A pity then that our circumstances offer little cause to appreciate it.~
== VICON25J IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~One slip and we'll unveil the true faces of these paragons of justice. Let us be swift, <CHARNAME>.~
== NEERA25J IF ~InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN ~So this is Mount Celestia's front step? I don't suppose there's a gift shop nearby? Might as well grab some souvenirs before we leave.~
== RASAA25J IF ~InParty("RASAAD") InMyArea("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN ~False accusations cannot harm a soul grounded in truth. Strengthen your mind, <CHARNAME>, then let us seek out our answers.~
== SAREV25J IF ~InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_EVIL)~ THEN ~A sanctum for simpering fools. I survived the hells themselves, hounded by demons and devils alike. These planetars may try to judge me, but we'll see who comes out wanting.~
== SAREV25J IF ~InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_GOOD)~ THEN ~My past choices earn me a thousand damnations, Saradush's destruction isn't one of them. Let Lunia judge as it must, I refuse to carry the guilt of a crime I did not commit.~
END
++ ~Let's see what secrets this realm holds.~ EXIT
++ ~We're here to set things right. No more distractions~ EXIT 

/* interjections */
INTERJECT_COPY_TRANS OHDPLANL 24 bfskeldornnamed
== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~I believe the planetar seeks your name, my friend, not mine. Still, if introductions must be made, it would be my privilege to introduce you. This is <CHARNAME>, the valiant leader of our company.~
END

