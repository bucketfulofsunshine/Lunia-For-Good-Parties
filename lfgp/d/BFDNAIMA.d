/* you have been weighed, you have been measured, & you MAY be found wanting. */ 
BEGIN ~BFDNAIMA~

CHAIN IF ~Global("bfsspoketoscribe","GLOBAL",0)~ THEN BFDNAIMA bfs.trialstart
~Good evening to you. I am Naiman Alore.~ [OH91959]
DO ~SetGlobal("bfsspoketoscribe","GLOBAL",1)~
END
++ ~I am known as <CHARNAME> and I've come to see my name removed from the scroll.~ EXTERN BFDNAIMA bfs.trial2
++ ~You are the scribe of Righteous Wrath?~ EXTERN BFDNAIMA bfs.trial1

CHAIN BFDNAIMA bfs.trial1
~I do not consider myself particularly wrathful. I do have the honor of inscribing names in the Scroll of Divine Retribution.~ [OH91963]
END
++ ~I am known as <CHARNAME> and I've come to see my name removed from the scroll.~ EXTERN BFDNAIMA bfs.trial2

CHAIN BFDNAIMA bfs.trial2
~Rare is the mortal who is given such a chance. Were your name placed by divine decree, I would not contest it. Yet, in this instance, a Planetar spoke your name and I sensed a greater purpose behind the request.~
== BFDNAIMA ~Yet Tyr's justice is not without mercy. Your alleged transgressions are as follows.~
/* add more options based on EVIL choices in SOA / TOB */
== BFDNAIMA IF ~GlobalGT("SlavingJerk","GLOBAL",0)~ THEN ~Complicity in the slave treade of Athkatla.~ 
/* ends list of possible crimes, the next line always shows up */
== BFDNAIMA ~The destruction of Saradush and all who dwelled within it.~
== BFDNAIMA ~You stand accused. What say you in your defense?~
END
+ ~GlobalLT("bfsreptrial","GLOBAL",1) ReputationGT(Player1,17)~ + ~My reputation speaks for itself. Everywhere I've travelled, I've helped those in need.~ DO ~IncrementGlobal("bfsreptrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.flawlessreputation
+ ~NumInPartyGT(0)~ + ~My companions will vouch for me.~ EXTERN BFDNAIMA bfs.companionhub 
+ ~GlobalLT("bfschatrial","GLOBAL",1) CheckStatGT(Player1,16,CHR)~ + ~Look at me. How can you not trust this face?~ DO ~IncrementGlobal("bfschatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.okaynarcissus
+ ~GlobalLT("bfslegallyblondtrial","GLOBAL",1) OR(3) Alignment(Player1,CHAOTIC_GOOD) Alignment(Player1,NEUTRAL_GOOD) Alignment(Player1,LAWFUL_GOOD)~ + ~I am a good person. And good people don't just destroy cities.~ DO ~IncrementGlobal("bfslegallyblondtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.goodpoint /* aka the 'happy people just don't shoot their husbands' option :3 */ 
/* add more options based on GOOD choices in SOA / TOB */
+ ~GlobalLT("bfscctrial","GLOBAL",1) GlobalGT("FreeSlaves","GLOBAL",0)~ + ~I broke the chains of slavery in Athkatla, freeing many who were held captive within the Copper Coronet.~ DO ~IncrementGlobal("bfscctrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.strikeone
+ ~GlobalLT("bfasatrial","GLOBAL",1) !Global("amasanaDead","GLOBAL",1) Global("AsanaPlot","GLOBAL",3)~ + ~I paid a group of mercenaries, using my personal coin, to save the life of an innocent. I upheld the spirit of the law without condemning others to needlessly suffer.~ DO ~IncrementGlobal("bfasatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.striketwo
++ ~I have no further proof.~ EXTERN BFDNAIMA bfs.ihavedonenothingwrong

CHAIN BFDNAIMA bfs.flawlessreputation
~I have heard of your deeds. Some among the faithful pledged to investigate the truth of this matter. It is likely one of them summoned you here. How irresponsible of me to overlook such a detail.~
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub

CHAIN BFDNAIMA bfs.okaynarcissus
~You do seem a rather compelling, ah, *reliable* person.~
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub

CHAIN BFDNAIMA bfs.goodpoint
~Statistically it is highly unlikely. Given your good-natured disposition, I'm inclined to concede your point.~
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub

CHAIN BFDNAIMA bfs.strikeone
~Your actions in Athkatla reflect a commitment to justice. I shall weigh this testimony carefully.~ 
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub

CHAIN BFDNAIMA bfs.striketwo
~Such compassion, exercised through personal sacrifice, is a noble calling. I shall count it in your favor.~
END 
IF ~~ EXTERN BFDNAIMA bfs.trialhub

CHAIN BFDNAIMA bfs.companionhub
~Who will step forward?~
END
+ ~GlobalLT("bfsaerietrial","GLOBAL",1) InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ + ~Aerie.~ DO ~IncrementGlobal("bfsaerietrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN AERIE25J bfsaerietrial
+ ~GlobalLT("bfsanotrial","GLOBAL",1) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",LAWFUL_GOOD)~ + ~Anomen.~ DO ~IncrementGlobal("bfsanotrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN ANOME25J bfsanolgtrial
+ ~GlobalLT("bfsanotrial","GLOBAL",1) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",CHAOTIC_NEUTRAL)~ + ~Anomen.~ DO ~IncrementGlobal("bfsanotrial","GLOBAL",1)~ EXTERN ANOME25J bfsanocntrial
+ ~GlobalLT("bfshaertrial","GLOBAL",1) InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ + ~Haer'Dalis.~ DO ~IncrementGlobal("bfshaertrial","GLOBAL",1)~ EXTERN HAERD25J bfshaertrial
+ ~GlobalLT("bfsimmytrial","GLOBAL",1) InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) !InParty("SAREVOK") !InMyArea("SAREVOK")~ + ~Imoen.~ DO ~IncrementGlobal("bfsimmytrial","GLOBAL",1)~ EXTERN IMOEN25J bfsimmytrial
+ ~GlobalLT("bfsimmytrial","GLOBAL",1) InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_EVIL)~ + ~Imoen.~ DO ~IncrementGlobal("bfsimmytrial","GLOBAL",1)~ EXTERN IMOEN25J bfsimmytrial
+ ~GlobalLT("bfsimmytrial","GLOBAL",1) InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_GOOD) Global("bfssarevoktrial","GLOBAL",1)~ + ~Imoen.~ DO ~IncrementGlobal("bfsimmytrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",-1)~ EXTERN IMOEN25J bfsimmytrialsar
+ ~GlobalLT("bfsjaheiratrial","GLOBAL",1) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ + ~Jaheira.~ DO ~IncrementGlobal("bfsjaheiratrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN JAHEI25J bfsjaheiratrial
+ ~GlobalLT("bfsjantrial","GLOBAL",1) InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ + ~Jan.~ DO ~IncrementGlobal("bfsjantrial","GLOBAL",1)~ EXTERN JAN25J bfsjantrial
+ ~GlobalLT("bfskeldorntrial","GLOBAL",1) InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + ~Keldorn.~ DO ~SetGlobal("bfskeldorntrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN KELDO25J bfskeldorntrial
+ ~GlobalLT("bfsmazzytrial","GLOBAL",1) InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ + ~Mazzy.~ DO ~IncrementGlobal("bfsmazzytrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN MAZZY25J bfsmazzytrial
+ ~GlobalLT("bfsminsctrial","GLOBAL",1) InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ + ~Minsc.~ DO ~IncrementGlobal("bfsminsctrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN MINSC25J bfsminsctrial
+ ~GlobalLT("bfsnaliatrial","GLOBAL",1) InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ + ~Nalia.~ DO ~IncrementGlobal("bfsnaliatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN NALIA25J bfsnaliatrial
+ ~GlobalLT("bfsneeratrial","GLOBAL",1) InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ + ~Neera.~ DO ~IncrementGlobal("bfsneeratrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN NEERA25J bfsneeratrial
+ ~GlobalLT("bfsrasaadtrial","GLOBAL",1) InParty("RASAAD") InMyArea("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ + ~Rasaad.~ DO ~IncrementGlobal("bfsrasaadtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN RASAA25J bfsrasaadtrial
+ ~GlobalLT("bfssarevoktrial","GLOBAL",1) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_GOOD)~ + ~Sarevok.~ DO ~IncrementGlobal("bfssarevoktrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN SAREV25J bfssarevokcgtrial
+ ~GlobalLT("bfssarevoktrial","GLOBAL",1) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_EVIL)~ + ~Sarevok.~ DO ~IncrementGlobal("bfssarevoktrial","GLOBAL",1)~ EXTERN SAREV25J bfssarevokcetrial
+ ~GlobalLT("bfsvalygartrial","GLOBAL",1) InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ + ~Valygar.~ DO ~IncrementGlobal("bfsvalygartrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN VALYG25J bfsvalygartrial
// + ~GlobalLT("bfsbeartrial","GLOBAL",1) InParty("WILSON") InMyArea("WILSON") !StateCheck("WILSON",CD_STATE_NOTVALID)~ + ~Wilson.~ EXTERN WILSO25J bfsbeartrial
++ ~That is all.~ EXTERN BFDNAIMA bfs.trialhub

CHAIN AERIE25J bfsaerietrial
~Me? Oh! I-I've seen <CHARNAME> risk everything to help others. On more than one occassion. I would still be trapped in the circus if <PRO_HESHE> hadn't helped me.~
== BFDNAIMA ~You seem a sincere and kind-hearted woman. I will take your testimony into consideration.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN ANOME25J bfsanolgtrial
~Under Helm's watchful gaze, I swear, <CHARNAME> has upheld justice and virtue. During my darkest hours, <PRO_HESHE> steered me to walk the path of honour and not vengeance.~
== BFDNAIMA ~The vow of Helm's faithful is highly valued in Lunia. I welcome your account.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN ANOME25J bfsanocntrial
~Tyr's justice is blind. No, <CHARNAME>, there is nothing I wish to contribute to this farce.~
== BFDNAIMA ~I...see.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN HAERD25J bfshaertrial
~Forgive me, my raven, but this actor would prefer to watch this story unfold without claiming a supporting role.~
== BFDNAIMA ~Your preference is noted.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN IMOEN25J bfsimmytrial
~You want proof? I grew up with <CHARNAME>. As <PRO_HISHER> sister, I know <PRO_HIMHER> better than anyo...~
== BFDNAIMA ~Am I to understand that you are *related*? I must discount your testimony. A sibling's plea carries natural bias.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN IMOEN25J bfsimmytrialsar
~You want proof? I grew up with <CHARNAME>. As <PRO_HISHER> sister, I know <PRO_HIMHER> better than anyo...~
== BFDNAIMA ~Am I to understand that you are *related*? I must discount your testimony. A sibling's plea carries natural bias.~
== IMOEN25J ~That's not fair! You didn't stop Sarevok from speaking freely.~
== BFDNAIMA ~I wasn't aware of a connection, so I thank you for your candour. His testimony will also be duly discarded.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN JAHEI25J bfsjaheiratrial
~I've long fought beside <CHARNAME> and, time and again, <PRO_HESHE> has chosen to fight against <PRO_HISHER> darkest impulses. Not all of Bhaal's brood are of the same ilk. <CHARNAME> stands as proof of that.~
== BFDNAIMA ~You are headstrong in this belief. Your defense shall not go unheard.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN JAN25J bfsjantrial
~Eh? Witness testimony is not my thing. Far too often I've found myself on the other side of the law. So Jan Jansen doesn't snitch.~
== BFDNAIMA ~I thank you for your contribution. Please refrain from incriminating yourself further.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN KELDO25J bfskeldorntrial
~<CHARNAME> acts with compassion and honour. Torm as my witness, I could ask for no finer companion.~
== BFDNAIMA ~The vow of Torm's faithful is highly valued in Lunia. I welcome your account.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN MAZZY25J bfsmazzytrial
~<CHARNAME> helped me avenge the deaths of my stalward companions. If this Scroll of Retribution truly names only the vilest of criminals, then <PRO_HISHER> name has no place among it.~
== BFDNAIMA ~You are small of stature, halfling, but large of heart. I sense the truth in your words and will give them due consideration.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN MINSC25J bfsminsctrial
~Evil trembles when <CHARNAME> comes near it! So say Boo and I!~
== BFDNAIMA ~You and your...hamster seem rather spirited. I will keep your words in mind.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN NALIA25J bfsnaliatrial
~I've seen <CHARNAME> stand for those who have no voice. If <PRO_HISHER> name is on your scroll, then it needs to be rewritten.~
== BFDNAIMA ~You do have a rather noble manner about you...~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN NEERA25J bfsneeratrial
~Anyone who'd risk earning the Red Wizards' fury, especially to protect a bunch of wild mages, is someone worth trusting.~
== BFDNAIMA ~A roundabout argument but I will concede your point.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN RASAA25J bfsrasaadtrial
~<CHARNAME> has guided many from darkness. As a follower of Lady Selûne, I cannot help but believe in <PRO_HISHER> cause.~
== BFDNAIMA ~The approval of Selûne's faithful is highly valued in Lunia. I welcome your account.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN SAREV25J bfssarevokcetrial
~You truly must be mad to think I would speak in your defense.~
== BFDNAIMA ~Your preference is noted.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN SAREV25J bfssarevokcgtrial
~I once strove only to further my ambitions. I knew no peace until <CHARNAME> showed me another path. If you name <PRO_HIMHER> on your list, then your justice has no merit.~
== BFDNAIMA ~Your transformation is significant. I shall consider your statement in the interest of fairness.~
END 
IF ~~ EXTERN BFDNAIMA bfs.companionhub

CHAIN VALYG25J bfsvalygartrial
~Athkatla breeds cruelty, but <CHARNAME> has risen above its temptations. That alone makes <PRO_HIMHER> better than most.~
== BFDNAIMA ~You seem an honourable man. I welcome your account.~
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
+ ~GlobalLT("bfsreptrial","GLOBAL",1) ReputationGT(Player1,17)~ + ~My reputation speaks for itself. Everywhere I've travelled, I've helped those in need.~ DO ~IncrementGlobal("bfsreptrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.flawlessreputation
+ ~NumInPartyGT(0)~ + ~My companions will vouch for me.~ EXTERN BFDNAIMA bfs.companionhub 
+ ~GlobalLT("bfschatrial","GLOBAL",1) CheckStatGT(Player1,16,CHR)~ + ~Look at me. How can you not trust this face?~ DO ~IncrementGlobal("bfschatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.okaynarcissus
+ ~GlobalLT("bfslegallyblondtrial","GLOBAL",1) OR(3) Alignment(Player1,CHAOTIC_GOOD) Alignment(Player1,NEUTRAL_GOOD) Alignment(Player1,LAWFUL_GOOD)~ + ~I am a good person. And good people don't just destroy cities.~ DO ~IncrementGlobal("bfslegallyblondtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.goodpoint /* aka the 'happy people just don't shoot their husbands' option :3 */ 
/* add more options based on GOOD choices in SOA / TOB */
+ ~GlobalLT("bfscctrial","GLOBAL",1) GlobalGT("FreeSlaves","GLOBAL",0)~ + ~I broke the chains of slavery in Athkatla, freeing many who were held captive within the Copper Coronet.~ DO ~IncrementGlobal("bfscctrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.strikeone
+ ~GlobalLT("bfasatrial","GLOBAL",1) !Global("amasanaDead","GLOBAL",1) Global("AsanaPlot","GLOBAL",3)~ + ~I paid a group of mercenaries, using my personal coin, to save the life of an innocent. I upheld the spirit of the law without condemning others to needlessly suffer.~ DO ~IncrementGlobal("bfasatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN BFDNAIMA bfs.striketwo
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
~A grave error has been made. <CHARNAME> you are, by all accounts, a paragon of virtue. Your name should never have been added to the Scroll.~
== BFDNAIMA ~Please take this ink and sand - the tools by which names are recorded or erased. Use them to amend the list. I offer my sincerest apologies for this injustice.~
== BFDNAIMA ~I must report this oversight to my superiors. Such a travesty cannot be repeated. But I urge you to seek out the Planetar who first named you, only then can we learn who's responsible for framing you.~
== BFDNAIMA ~Fare you well on the remainder of your quest.~
DO ~AddJournalEntry(@100003, QUEST) SetGlobal("bfsinnocenceproven","GLOBAL",1) GiveItem("OHDINK",Player1) EscapeAreaNoSee()~ EXIT

CHAIN BFDNAIMA bfs.doesntengendertrust
~You have offered your arguments but I am unconvinced. Your name will remain on the list unless you find irrefutable proof.~
== BFDNAIMA ~Seek out the Planetar who first spoke against you. Perhaps, in doing so, you will find the clarity.~ 
== BFDNAIMA ~Fare you well on the remainder of your quest.~ 
DO ~AddJournalEntry(@100004, QUEST) SetGlobal("bfsinnocenceprovesnothing","GLOBAL",1)~ EXIT

/* second talk */ 
CHAIN IF ~Global("bfsspoketoscribe","GLOBAL",1)~ THEN BFDNAIMA bfs.secondattempt
~Good evening to you, <CHARNAME>. Have you returned with further testimony or evidence?~ [BFLU1]
DO ~SetGlobal("bfsspoketoscribe","GLOBAL",1)~
END
// ++ ~I have the proof needed to clear my name.~ EXTERN BFDNAIMA 
++ ~I'll return later.~ EXIT
