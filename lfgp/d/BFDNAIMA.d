/* you have been weighed, you have been measured, & you MAY be found wanting. */ 
BEGIN ~BFDNAIMA~

CHAIN IF ~NumberOfTimesTalkedTo(0)~ THEN BFDNAIMA bfs.trialstart
~Good evening to you. I am Naiman Alore.~ [OH91959]
END
++ ~Good to meet you, Naiman. My name is <CHARNAME>. I've come to see my name removed from the scroll.~ EXTERN BFDNAIMA bfs.trial2
++ ~You are the scribe of Righteous Wrath?~ EXTERN BFDNAIMA bfs.trial1

CHAIN BFDNAIMA bfs.trial1
~I do not consider myself particularly wrathful. I do have the honor of inscribing names in the Scroll of Divine Retribution.~ [OH91963]
END
++ ~I've come to remove my name from the scroll.~ EXTERN BFDNAIMA bfs.trial2

CHAIN BFDNAIMA bfs.trial2
~Rare is the mortal who is given such a chance. Were your name entrusted to me by divine providence, I would refuse. However, in this instance, one of the Planetars bade I add you to the list. I sensed divine intent behind their words, so I did not question them further.~
== BFDNAIMA ~But Tyr's Justice is not without forgiveness or mercy. Your crimes are described as follows...~
/* add more options based on EVIL choices in SOA / TOB */
== BFDNAIMA IF ~GlobalGT("SlavingJerk","GLOBAL",0)~ THEN ~Assisting with in slavery in Athkatla.~ 
/* ends list of possible crimes, the next line always shows up */
== BFDNAIMA ~The destruction of Saradush and all those within it.~
== BFDNAIMA ~What do you say in your defense?~
END
+ ~GlobalLT("bfsreptrial","GLOBAL",1) ReputationGT(Player1,17)~ + ~My reputation speaks for itself. Everywhere I've travelled, I've helped those in need.~ EXTERN BFDNAIMA bfs.flawlessreputation
+ ~GlobalLT("bfscomptrial","GLOBAL",1) NumInPartyGT(0)~  + ~My companions will vouch for me.~ EXTERN BFDNAIMA bfs.companionhub 
+ ~GlobalLT("bfschatrial","GLOBAL",1) CheckStatGT(Player1,16,CHR)~ + ~Look at me. How can you not trust this face?~ EXTERN BFDNAIMA bfs.okaynarcissus
+ ~GlobalLT("bfslegallyblondtrial","GLOBAL",1) OR(3) Alignment(Player1,CHAOTIC_GOOD) Alignment(Player1,NEUTRAL_GOOD) Alignment(Player1,LAWFUL_GOOD)~ + ~I am a good person. And good people don't just destroy cities.~ EXTERN BFDNAIMA bfs.goodpoint /* aka the 'happy people just don't shoot their husbands' option :3 */ 
/* add more options based on GOOD choices in SOA / TOB */
+ ~GlobalLT("bfscctrial","GLOBAL",1) GlobalGT("FreeSlaves","GLOBAL",0)~ + ~I broke the chains of slavery in Athkatla, freeing many who were held captive within the Copper Coronet.~ EXTERN BFDNAIMA bfs.strikeone
+ ~GlobalLT("bfasatrial","GLOBAL",1) !Global("amasanaDead","GLOBAL",1) Global("AsanaPlot","GLOBAL",3)~ + ~I paid a group of mercenaries, using my personal coin, to save the life of an innocent. I upheld the spirit of the law without condemning others to needlessly suffer.~ EXTERN BFDNAIMA bfs.striketwo
++ ~I have no further proof.~ EXTERN BFDNAIMA bfs.ihavedonenothingwrong

CHAIN BFDNAIMA bfs.flawlessreputation
~I have heard tales of your deeds. Which reminds me...one of the Planetars vowed to investigate the matter. I assume they were responsible for sending you here? How irresponsible of me to forget!~
DO ~IncrementGlobal("bfsreptrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub

CHAIN BFDNAIMA bfs.okaynarcissus
~You do seem a rather compelling, ah, *reliable* person.~
DO ~IncrementGlobal("bfschatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub

CHAIN BFDNAIMA bfs.goodpoint
~Statistically it is highly unlikely. Given your disposition, I'm inclined to concede your point.~
DO ~IncrementGlobal("bfslegallyblondtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub

CHAIN BFDNAIMA bfs.strikeone
~Your words echo with truth and it speaks well of your character. I will take it into consideration.~
DO ~IncrementGlobal("bfscctrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub


CHAIN BFDNAIMA bfs.striketwo
~Commendable to be sure.~
DO ~IncrementGlobal("bfasatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub

CHAIN BFDNAIMA bfs.companionhub
~Who will speak?~
END
+ ~GlobalLT("bfsaerietrial","GLOBAL",1) InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ + ~Aerie.~ EXTERN AERIE25J bfsaerietrial
+ ~GlobalLT("bfsanotrial","GLOBAL",1) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",LAWFUL_GOOD)~ + ~Anomen.~ EXTERN ANOME25J bfsanolgtrial
+ ~GlobalLT("bfsanotrial","GLOBAL",1) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",CHAOTIC_NEUTRAL)~ + ~Anomen.~ EXTERN ANOME25J bfsanocntrial
+ ~GlobalLT("bfshaertrial","GLOBAL",1) InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ + ~Haer'Dalis.~ EXTERN HAERD25J bfshaertrial
+ ~GlobalLT("bfsimmytrial","GLOBAL",1) InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) !InParty("SAREVOK") !InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID)~ + ~Imoen.~ EXTERN IMOEN25J bfsimmytrial
+ ~GlobalLT("bfsimmytrial","GLOBAL",1) InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_GOOD) Global("bfssarevoktrial","GLOBAL",1)~ + ~Imoen.~ EXTERN IMOEN25J bfsimmytrialsar
+ ~GlobalLT("bfsjaheiratrial","GLOBAL",1) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ + ~Jaheira.~ EXTERN JAHEI25J bfsjaheiratrial
+ ~GlobalLT("bfsjantrial","GLOBAL",1) InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ + ~Jan.~ EXTERN JAN25J bfsjantrial
+ ~GlobalLT("bfskeldorntrial","GLOBAL",1) InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + ~Keldorn.~ EXTERN KELDO25J bfskeldorntrial
+ ~GlobalLT("bfsmazzytrial","GLOBAL",1) InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ + ~Mazzy.~ EXTERN  MAZZY25J bfsmazzytrial
+ ~GlobalLT("bfsminsctrial","GLOBAL",1) InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ + ~Minsc.~ EXTERN MINSC25J bfsminsctrial
+ ~GlobalLT("bfsnaliatrial","GLOBAL",1) InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ + ~Nalia.~ EXTERN NALIA25J bfsnaliatrial
+ ~GlobalLT("bfsneeratrial","GLOBAL",1) InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ + ~Neera.~ EXTERN NEERA25J bfsneeratrial
+ ~GlobalLT("bfsrasaadtrial","GLOBAL",1) InParty("RASAAD") InMyArea("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ + ~Rasaad.~ EXTERN RASAA25J bfsrasaadtrial
+ ~GlobalLT("bfssarevoktrial","GLOBAL",1) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_GOOD)~ + ~Sarevok.~ EXTERN SAREV25J bfssarevokcgtrial
+ ~GlobalLT("bfssarevoktrial","GLOBAL",1) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_EVIL)~ + ~Sarevok.~ EXTERN SAREV25J bfssarevokcetrial
+ ~GlobalLT("bfsvalygartrial","GLOBAL",1) InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ + ~Valygar.~ EXTERN VALYG25J bfsvalygartrial
// + ~GlobalLT("bfsbeartrial","GLOBAL",1) InParty("WILSON") InMyArea("WILSON") !StateCheck("WILSON",CD_STATE_NOTVALID)~ + ~Wilson.~ EXTERN WILSO25J bfsbeartrial
++ ~That is all.~ EXTERN BFDNAIMA bfs.trialhub

CHAIN AERIE25J bfsaerietrial
~Me? Oh! I-I've seen <CHARNAME> risk everything to help others. On more than one occassion. I would still be trapped in the circus if <PRO_HESHE> hadn't helped me.~
== BFDNAIMA ~You seem a sincere and kind woman. I will take your testimony into consideration.~
DO ~IncrementGlobal("bfsaerietrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN ANOME25J bfsanolgtrial
~Under Helm's watchful gaze, I swear, <CHARNAME> has upheld justice and virtue. During my darkest hours, <PRO_HESHE> steered me to walk the path of honour and not vengeance.~
== BFDNAIMA ~The vow of Helm's faithful is highly valued in Lunia. I welcome your account.~
DO ~IncrementGlobal("bfsanotrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN ANOME25J bfsanocntrial
~Tyr's justice is blind. No, <CHARNAME>, there is nothing I wish to contribute to this farce.~
== BFDNAIMA ~I...see.~
DO ~IncrementGlobal("bfsanotrial","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN HAERD25J bfshaertrial
~Forgive me, my raven, but this actor would prefer to watch this story unfold without claiming a supporting role.~
== BFDNAIMA ~Your preference is noted.~
DO ~IncrementGlobal("bfshaertrial","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN IMOEN25J bfsimmytrial
~You want proof? I grew up with <CHARNAME>. As <PRO_HISHER> sister, I know <PRO_HIMHER> better than anyo...~
== BFDNAIMA ~Am I to understand that you are *siblings*? That cannot stand. You are a biased witness.~
DO ~IncrementGlobal("bfsimmytrial","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN IMOEN25J bfsimmytrialsar
~You want proof? I grew up with <CHARNAME>. As <PRO_HISHER> sister, I know <PRO_HIMHER> better than anyo...~
== BFDNAIMA ~Am I to understand that you are *siblings*? That cannot stand. You are a biased witness.~
== IMOEN25J ~That's not fair! You let Sarevok offer his testiment!~
== BFDNAIMA ~I wasn't aware of another relation. I thank you for your candour. His statement will be duly disregarded.~
DO ~IncrementGlobal("bfsimmytrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",-1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN JAHEI25J bfsjaheiratrial
~I've long fought beside <CHARNAME> and, time and again, <PRO_HESHE> has chosen to fight against <PRO_HISHER> darkest impulses. Not all of Bhaal's brood are of the same ilk. <CHARNAME> stands as proof of that.~
== BFDNAIMA ~You are rather headstrong in your belief. I will take your statement into account.~
DO ~IncrementGlobal("bfsjaheiratrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN JAN25J bfsjantrial
~Eh? Witness testimony is not my thing. Far too often I've found myself on the other side of the law. So Jan Jansen doesn't snitch.~
== BFDNAIMA ~Thank you for your contribution. Please refrain from incriminating yourself further.~
DO ~IncrementGlobal("bfsjantrial","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN KELDO25J bfskeldorntrial
~<CHARNAME> acts with compassion and honour. Torm as my witness, I could ask for no finer companion.~
== BFDNAIMA ~The vow of Torm's faithful is highly valued in Lunia. I welcome your account.~
DO ~SetGlobal("bfskeldorntrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN MAZZY25J bfsmazzytrial
~<CHARNAME> helped me avenge the deaths of my stalward companions. If this Scroll of Retribution truly names only the vilest of criminals, then <PRO_HISHER> name has no place among it.~
== BFDNAIMA ~You are small of stature, halfling, but large of heart. I sense the truth in your words and will give them due consideration.~
DO ~IncrementGlobal("bfsmazzytrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN MINSC25J bfsminsctrial
~Evil trembles when <CHARNAME> comes near it! So say Boo and I!~
== BFDNAIMA ~You and your...hamster seem rather spirited about this. I will take note.~
DO ~IncrementGlobal("bfsminsctrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN NALIA25J bfsnaliatrial
~I've seen <CHARNAME> stand for those who have no voice. If <PRO_HISHER> name is on your scroll, then it needs to be rewritten.~
== BFDNAIMA ~You do seem to have a rather noble manner about you...~
DO ~IncrementGlobal("bfsnaliatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN NEERA25J bfsneeratrial
~Anyone who'd risk earning the Red Wizards' fury, especially to protect a bunch of wild mages, is someone worth trusting.~
== BFDNAIMA ~Those Red Wizards are rather unscrupulous.~
DO ~IncrementGlobal("bfsneeratrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN RASAA25J bfsrasaadtrial
~<CHARNAME> has guided many from darkness. As a follower of Lady Selûne, I cannot help but believe in <PRO_HISHER> cause.~
== BFDNAIMA ~The approval of Selûne's faithful is highly valued in Lunia. I welcome your account.~
DO ~IncrementGlobal("bfsrasaadtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN SAREV25J bfssarevokcetrial
~You truly must be mad to think I would speak in your defense.~
== BFDNAIMA ~Your preference is noted.~
DO ~IncrementGlobal("bfssarevoktrial","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN SAREV25J bfssarevokcgtrial
~I once strove only to further my ambitions. I knew no peace until <CHARNAME> showed me another way. If you name <PRO_HIMHER> on your list, then your justice holds no merit.~
== BFDNAIMA ~I sense conviction in your words and so I welcome your account.~
DO ~IncrementGlobal("bfssarevoktrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN VALYG25J bfsvalygartrial
~Athkatla breeds cruelty, but <CHARNAME> has risen above its temptations. That alone makes <PRO_HIMHER> better than most.~
== BFDNAIMA ~You seem an honourable man. I welcome your account.~
DO ~IncrementGlobal("bfsvalygartrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

/* wilson doesn't have a TOB override script & i'm too scared to add one
editing this out in the meantime */ 
/* CHAIN WILSO25J bfsbeartrial
~*Wilson grunts and scuffles his paws*~
== BFDNAIMA ~He says you shared your rations with him. ...And let him maul those who would harm others. In bear circles that apparently earns you his respect.~
DO ~SetGlobal("bfsbeartrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub */

CHAIN BFDNAIMA bfs.trialhub
~Do you have anything else to say in your defense?~
END
/* paste the above options over again */
+ ~GlobalLT("bfsreptrial","GLOBAL",1) ReputationGT(Player1,17)~ + ~My reputation speaks for itself. Everywhere I've travelled, I've helped those in need.~ EXTERN BFDNAIMA bfs.flawlessreputation
+ ~GlobalLT("bfscomptrial","GLOBAL",1) NumInPartyGT(0)~  + ~My companions will vouch for me.~ EXTERN BFDNAIMA bfs.companionhub 
+ ~GlobalLT("bfschatrial","GLOBAL",1) CheckStatGT(Player1,16,CHR)~ + ~Look at me. How can you not trust this face?~ EXTERN BFDNAIMA bfs.okaynarcissus
+ ~GlobalLT("bfslegallyblondtrial","GLOBAL",1) OR(3) Alignment(Player1,CHAOTIC_GOOD) Alignment(Player1,NEUTRAL_GOOD) Alignment(Player1,LAWFUL_GOOD)~ + ~I am a good person. And good people don't just destroy cities.~ EXTERN BFDNAIMA bfs.goodpoint /* aka the 'happy people just don't shoot their husbands' option :3 */ 
/* add more options based on GOOD choices in SOA / TOB */
+ ~GlobalLT("bfscctrial","GLOBAL",1) GlobalGT("FreeSlaves","GLOBAL",0)~ + ~I broke the chains of slavery in Athkatla, freeing many who were held captive within the Copper Coronet.~ EXTERN BFDNAIMA bfs.strikeone
+ ~GlobalLT("bfasatrial","GLOBAL",1) !Global("amasanaDead","GLOBAL",1) Global("AsanaPlot","GLOBAL",3)~ + ~I paid a group of mercenaries, using my personal coin, to save the life of an innocent. I upheld the spirit of the law without condemning others to needlessly suffer.~ EXTERN BFDNAIMA bfs.striketwo
++ ~I have no further proof.~ EXTERN BFDNAIMA bfs.ihavedonenothingwrong


CHAIN BFDNAIMA bfs.ihavedonenothingwrong /* aka the closing arguments */ 
~Before I declare my verdict, do you have any closing arguments you'd like to make?~
END
+ ~GlobalGT("bfsnaimanconvinced","GLOBAL",4)~ + ~Yaga-Shura destroyed Saradush. The city did not fall by my hand.~ EXTERN BFDNAIMA bfs.iknowthisandloveyou
+ ~GlobalGT("bfsnaimanconvinced","GLOBAL",4)~ + ~Blame me if you like, but I didn't choose this madness.~ EXTERN BFDNAIMA bfs.iknowthisandloveyou
+ ~GlobalGT("bfsnaimanconvinced","GLOBAL",4)~ + ~Causation does not prove guilt. I was not present in Saradush, nor did I order its destruction.~ EXTERN BFDNAIMA bfs.iknowthisandloveyou
+ ~GlobalGT("bfsnaimanconvinced","GLOBAL",4)~ + ~I have nothing more to add.~ EXTERN BFDNAIMA bfs.iknowthisandloveyou
+ ~GlobalLT("bfsnaimanconvinced","GLOBAL",5)~ + ~Yaga-Shura destroyed Saradush. The city did not fall by my hand.~ EXTERN BFDNAIMA bfs.doesntengendertrust
+ ~GlobalLT("bfsnaimanconvinced","GLOBAL",5)~ + ~Blame me if you like, but I didn't choose this madness.~ EXTERN BFDNAIMA bfs.doesntengendertrust
+ ~GlobalLT("bfsnaimanconvinced","GLOBAL",5)~ + ~Causation does not prove guilt. I was not present in Saradush, nor did I order its destruction.~ EXTERN BFDNAIMA bfs.doesntengendertrust
+ ~GlobalLT("bfsnaimanconvinced","GLOBAL",5)~ + ~I have nothing more to add.~ EXTERN BFDNAIMA bfs.doesntengendertrust

CHAIN BFDNAIMA bfs.iknowthisandloveyou
~A grave mistake has been made! <CHARNAME>, by all accounts, is a paragon of virtue. Surely <PRO_HESHE> shouldn't have been named.~
== BFDNAIMA ~Please, my friend, take this. It's the ink and sand used to write names or erase them. I ask that you alter the Scroll and apologize for this tragic mistake.~
== BFDNAIMA ~I'd best report to my superiors. We must ensure such a travesty cannot be repeated. If you've the inclination, I suggest you speak with the Planetars in Lunia to uncover those responsible for framing you.~
== BFDNAIMA ~May you fare well on the remainder of your quest.~
DO ~GiveItem("OHDINK",Player1) EscapeAreaNoSee()~ EXIT

CHAIN BFDNAIMA bfs.doesntengendertrust
~I remain sceptical. Your name will stay on the list unless you can find me concreate proof to have it removed.~
== BFDNAIMA ~A good start might be tracking down the Planetar who suggested your name.~
== BFDNAIMA ~May you fare well on the remainder of your quest.~ 
DO ~~ EXIT
