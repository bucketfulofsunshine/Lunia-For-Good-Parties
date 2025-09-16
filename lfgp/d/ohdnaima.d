/* lfgp */
/* you have been weighed, you have been measured, & you MAY be found wanting. */

CHAIN IF WEIGHT #-2 ~Global("bfsspoketoscribe","GLOBAL",0) Global("bfsluniaaccepted","GLOBAL",1)~ THEN OHDNAIMA bfs.trialstart
@136 /* Good evening to you. I am Naiman Alore. */
DO ~SetGlobal("bfsspoketoscribe","GLOBAL",1)~
END
++ @212 /* I am known as <CHARNAME> and I've come to see my name removed from the scroll. */ EXTERN OHDNAIMA bfs.trial2
++ @139 /* You are the scribe of Righteous Wrath? */ EXTERN OHDNAIMA bfs.trial1

CHAIN OHDNAIMA bfs.trial1
@148 /* I do not consider myself particularly wrathful. I do have the honor of inscribing names in the Scroll of Divine Retribution. */
END
++ @212 /* I am known as <CHARNAME> and I've come to see my name removed from the scroll. */ EXTERN OHDNAIMA bfs.trial2

CHAIN OHDNAIMA bfs.trial2
@213 /* Rare is the mortal who is given such a chance. Were your name placed by divine decree, I would not contest it. Yet, in this instance, a planetar spoke your name and I sensed a greater purpose behind the request. */
== OHDNAIMA @214 /* Yet Tyr's justice is not without mercy. Your alleged transgressions are as follows. */
/* add more options based on EVIL choices in SOA / TOB */
== OHDNAIMA IF ~GlobalGT("SlavingJerk","GLOBAL",0)~ THEN @215 /* Complicity in Athkatla's slave trade. */
DO ~IncrementGlobal("bfsnaimanconvinced","GLOBAL",-1)~
== OHDNAIMA IF ~Global("SolaDead","GLOBAL",1)~ THEN ~The drow Solaufein, who dared to show compassion in the blackest depths of the Underdark, was slain by your hand.~
DO ~IncrementGlobal("bfsnaimanconvinced","GLOBAL",-1)~
== OHDNAIMA IF ~Global("GrovePoisoned","GLOBAL",1)~ THEN ~You poisoned a sacred grove, upending the harmony of nature.~
DO ~IncrementGlobal("bfsnaimanconvinced","GLOBAL",-1)~
/* ends list of possible crimes, the next line always shows up */
== OHDNAIMA @216 /* The destruction of Saradush and all who dwelled within it. */
== OHDNAIMA @217 /* You stand accused. What say you in your defense? */
END
+ ~NumInPartyGT(0)~ + @218 /* My companions will vouch for me. */ EXTERN OHDNAIMA bfs.companionhub
+ ~GlobalLT("bfsreptrial","GLOBAL",1) ReputationGT(Player1,17)~ + @219 /* My reputation speaks for itself. Everywhere I've travelled, I've helped those in need. */ DO ~IncrementGlobal("bfsreptrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.flawlessreputation
+ ~GlobalLT("bfschatrial","GLOBAL",1) CheckStatGT(Player1,16,CHR)~ + @220 /* Look at me. How can you not trust this face? */ DO ~IncrementGlobal("bfschatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.okaynarcissus
+ ~GlobalLT("bfsstrtrial","GLOBAL",1) CheckStatGT(Player1,16,STR)~ + @221 /* You ask for words, but I speak best with my fists. I've destroyed others far stronger than you. */ DO ~IncrementGlobal("bfsstrtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",-1)~ EXTERN OHDNAIMA bfs.weirdflex
+ ~GlobalLT("bfsinttrial","GLOBAL",1) CheckStatGT(Player1,16,INT)~ + @222 /* If I were complicit in Saradush's destruction, why would I risk coming here to stand trial? */ DO ~IncrementGlobal("bfsinttrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.checkmate
+ ~GlobalLT("bfswistrial","GLOBAL",1) CheckStatGT(Player1,16,WIS)~ + @223 /* Wisdom guides my thoughts as well as my actions. */ DO ~IncrementGlobal("bfswistrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.wisewords
+ ~GlobalLT("bfslegallyblondtrial","GLOBAL",1) OR(3) Alignment(Player1,CHAOTIC_GOOD) Alignment(Player1,NEUTRAL_GOOD) Alignment(Player1,LAWFUL_GOOD)~ + @224 /* I am a good person. And good people don't just destroy cities. */ DO ~IncrementGlobal("bfslegallyblondtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.goodpoint /* aka the 'happy people just don't shoot their husbands' option :3 */
/* add more options to improve the score based on GOOD choices in SOA / TOB */
+ ~GlobalLT("bfscctrial","GLOBAL",1) GlobalGT("FreeSlaves","GLOBAL",0)~ + @225 /* I broke the chains of slavery in Athkatla, freeing many who were held captive within the Copper Coronet. */ DO ~IncrementGlobal("bfscctrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.strikeone
+ ~GlobalLT("bfssuldtrial","GLOBAL",1)~ + @226 /* I assisted in saving the elven city of Suldanessellar. */ DO ~IncrementGlobal("bfssuldtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.strikethree
+ ~GlobalLT("bfstradestrial","GLOBAL",1) Global("loganmantle","GLOBAL",2)~ + ~I gave Waukeen's Mantle to Lord Coprith, Trademeet's current ruler, rather than curry noble favor.~ DO ~IncrementGlobal("bfstradestrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.nobleintent
+ ~GlobalLT("bfasatrial","GLOBAL",1) !Global("amasanaDead","GLOBAL",1) Global("AsanaPlot","GLOBAL",3)~ + @227 /* I paid a group of mercenaries, using my personal coin, to save the life of an innocent. I upheld the spirit of the law without condemning others to needlessly suffer. */ DO ~IncrementGlobal("bfasatrial","GLOBAL",1) 
IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.striketwo
+ ~GlobalLT("bfswellyntrial","GLOBAL",1) Global("WellynPeace","GLOBAL",1)~ + ~I helped the child Wellyn's spirit find peace.~ DO ~IncrementGlobal("bfswellynntrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.bearygoodofyou
/* add options to improve the score based on quests completed in lunia itself */
+ ~GlobalLT("bfscogtrial","GLOBAL",1) Global("bfslawquest","GLOBAL",2)~ + @228 /* I assisted the malfunctioning Inevitable in restoring its function. Does that not prove I'm inclined to help others? */ DO ~IncrementGlobal("bfscogtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.coginwheel
++ @229 /* I have no further proof. */ EXTERN OHDNAIMA bfs.ihavedonenothingwrong

CHAIN OHDNAIMA bfs.bearygoodofyou
~The innocent are most deserving of compassion. Your kindness will not be forgotten.~
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.nobleintent
~Your judgment spared Trademeet further civil discord. It shall be weighed in your favor.~
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.flawlessreputation
@230 /* I have heard of your deeds. Some among the faithful swore adding your name to the scroll would be an injustice. It is likely one of them summoned you here. How irresponsible of me to forget such a detail. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.okaynarcissus
@231 /* You do seem a rather compelling, ah, *reliable* person. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.checkmate
@232 /* It does sound rather counterproductive. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.wisewords
@233 /* You do not seem the type to make rash decisions. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.weirdflex
@234 /* I-I refuse to be intimidated! If anything it reinforces the necessity of my scrutiny. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.goodpoint
@235 /* Statistically, it is highly unlikely. Given your good-natured disposition, I'm inclined to concede your point. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.strikeone
@236 /* Your actions in Athkatla reflect a commitment to justice. I shall weigh this testimony carefully. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.striketwo
@237 /* Such compassion, exercised through personal sacrifice, is a noble calling. I shall count it in your favor. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.strikethree
@238 /* You extended your protection to one city, yet supposedly wrought ruin upon another. I will take this anomaly into account. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.coginwheel
@239 /* It seems a stretch. But it does incline me to view your situation more favorably. */
END
IF ~~ EXTERN OHDNAIMA bfs.trialhub

CHAIN OHDNAIMA bfs.companionhub
@240 /* Who will step forward? */
END
+ ~GlobalLT("bfsaerietrial","GLOBAL",1) InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ + @241 /* Aerie. */ DO ~IncrementGlobal("bfsaerietrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN AERIE25J bfsaerietrial
+ ~GlobalLT("bfsanotrial","GLOBAL",1) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",LAWFUL_GOOD)~ + @242 /* Anomen. */ DO ~IncrementGlobal("bfsanotrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN ANOME25J bfsanolgtrial
+ ~GlobalLT("bfsanotrial","GLOBAL",1) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Alignment("ANOMEN",CHAOTIC_NEUTRAL)~ + @242 /* Anomen. */ DO ~IncrementGlobal("bfsanotrial","GLOBAL",1)~ EXTERN ANOME25J bfsanocntrial
+ ~GlobalLT("bfshaertrial","GLOBAL",1) InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ + @243 /* Haer'Dalis. */ DO ~IncrementGlobal("bfshaertrial","GLOBAL",1)~ EXTERN HAERD25J bfshaertrial
+ ~GlobalLT("bfsimmytrial","GLOBAL",1) InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) !InParty("SAREVOK") !InMyArea("SAREVOK")~ + @244 /* Imoen. */ DO ~IncrementGlobal("bfsimmytrial","GLOBAL",1)~ EXTERN IMOEN25J bfsimmytrial
+ ~GlobalLT("bfsimmytrial","GLOBAL",1) InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_EVIL)~ + @244 /* Imoen. */ DO ~IncrementGlobal("bfsimmytrial","GLOBAL",1)~ EXTERN IMOEN25J bfsimmytrial
+ ~GlobalLT("bfsimmytrial","GLOBAL",1) InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_GOOD) Global("bfssarevoktrial","GLOBAL",1)~ + @244 /* Imoen. */ DO ~IncrementGlobal("bfsimmytrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",-1)~ EXTERN IMOEN25J bfsimmytrialsar
+ ~GlobalLT("bfsjaheiratrial","GLOBAL",1) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ + @245 /* Jaheira. */ DO ~IncrementGlobal("bfsjaheiratrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN JAHEI25J bfsjaheiratrial
+ ~GlobalLT("bfsjantrial","GLOBAL",1) InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ + @246 /* Jan. */ DO ~IncrementGlobal("bfsjantrial","GLOBAL",1)~ EXTERN JAN25J bfsjantrial
+ ~GlobalLT("bfskeldorntrial","GLOBAL",1) InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @247 /* Keldorn. */ DO ~SetGlobal("bfskeldorntrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN KELDO25J bfskeldorntrial
+ ~GlobalLT("bfsmazzytrial","GLOBAL",1) InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ + @248 /* Mazzy. */ DO ~IncrementGlobal("bfsmazzytrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN MAZZY25J bfsmazzytrial
+ ~GlobalLT("bfsminsctrial","GLOBAL",1) InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ + @249 /* Minsc. */ DO ~IncrementGlobal("bfsminsctrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN MINSC25J bfsminsctrial
+ ~GlobalLT("bfsnaliatrial","GLOBAL",1) InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ + @250 /* Nalia. */ DO ~IncrementGlobal("bfsnaliatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN NALIA25J bfsnaliatrial
+ ~GlobalLT("bfsneeratrial","GLOBAL",1) InParty("NEERA") InMyArea("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ + @251 /* Neera. */ DO ~IncrementGlobal("bfsneeratrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN NEERA25J bfsneeratrial
+ ~GlobalLT("bfsrasaadtrial","GLOBAL",1) InParty("RASAAD") InMyArea("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ + @252 /* Rasaad. */ DO ~IncrementGlobal("bfsrasaadtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN RASAA25J bfsrasaadtrial
+ ~GlobalLT("bfssarevoktrial","GLOBAL",1) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_GOOD)~ + @253 /* Sarevok. */ DO ~IncrementGlobal("bfssarevoktrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN SAREV25J bfssarevokcgtrial
+ ~GlobalLT("bfssarevoktrial","GLOBAL",1) InParty("SAREVOK") InMyArea("SAREVOK") !StateCheck("SAREVOK",CD_STATE_NOTVALID) Alignment("SAREVOK",CHAOTIC_EVIL)~ + @253 /* Sarevok. */ DO ~IncrementGlobal("bfssarevoktrial","GLOBAL",1)~ EXTERN SAREV25J bfssarevokcetrial
+ ~GlobalLT("bfsvalygartrial","GLOBAL",1) InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ + @254 /* Valygar. */ DO ~IncrementGlobal("bfsvalygartrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN VALYG25J bfsvalygartrial
+ ~GlobalLT("bfsbeartrial","GLOBAL",1) InParty("WILSON") InMyArea("WILSON") !StateCheck("WILSON",CD_STATE_NOTVALID)~ + @517 /* Wilson. */ DO ~SetGlobal("bfsbeartrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN WILSO25J bfsbeartrial
++ @255 /* That is all. */ EXTERN OHDNAIMA bfs.trialhub

CHAIN AERIE25J bfsaerietrial
@256 /* Me? Oh! I-I've seen <CHARNAME> risk everything to help others. On more than one occassion. I would still be trapped in the circus if <PRO_HESHE> hadn't helped me. */
== OHDNAIMA @257 /* You seem a sincere and kind-hearted woman. I will take your testimony into consideration. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN ANOME25J bfsanolgtrial
@258 /* Under Helm's watchful gaze, I swear, <CHARNAME> has upheld justice and virtue. During my darkest hours, <PRO_HESHE> steered me to walk the path of honor and not vengeance. */
== OHDNAIMA @259 /* The vow of Helm's faithful is highly valued in Lunia. I welcome your account. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN ANOME25J bfsanocntrial
@260 /* Tyr's justice is blind. No, <CHARNAME>, there is nothing I wish to contribute to this farce. */
== OHDNAIMA @261 /* I...see. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN HAERD25J bfshaertrial
@262 /* Forgive me, my raven, but this actor would prefer to watch this story unfold without claiming a supporting role. */
== OHDNAIMA @263 /* Your preference is noted. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN IMOEN25J bfsimmytrial
@264 /* You want proof? I grew up with <CHARNAME>. As <PRO_HISHER> sister, I know <PRO_HIMHER> better than anyo... */
== OHDNAIMA @265 /* Am I to understand that you are *related*? I must discount your testimony. A sibling's plea carries natural bias. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN IMOEN25J bfsimmytrialsar
@266 /* You want proof? I grew up with <CHARNAME>. As <PRO_HISHER> sister, I know <PRO_HIMHER> better than anyone— */
== OHDNAIMA @265 /* Am I to understand that you are *related*? I must discount your testimony. A sibling's plea carries natural bias. */
== IMOEN25J @267 /* That's not fair! You didn't stop Sarevok from speaking freely. */
== OHDNAIMA @268 /* I wasn't aware of a connection, so I thank you for your candour. His testimony will also be duly discarded. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN JAHEI25J bfsjaheiratrial
@269 /* I've long fought beside <CHARNAME> and, time and again, <PRO_HESHE> has chosen to fight against <PRO_HISHER> darkest impulses. Not all of Bhaal's brood are of the same ilk. <CHARNAME> stands as proof of that. */
== OHDNAIMA @270 /* You are headstrong in this belief. Your defense shall not go unheard. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN JAN25J bfsjantrial
@271 /* Eh? Witness testimony is not my thing. Far too often I've found myself on the other side of the law. So Jan Jansen doesn't snitch. */
== OHDNAIMA @272 /* I thank you for your contribution. Please refrain from incriminating yourself further. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN KELDO25J bfskeldorntrial
@273 /* <CHARNAME> acts with compassion and honor. Torm as my witness, I could ask for no finer companion. */
== OHDNAIMA @274 /* The vow of Torm's faithful is highly valued in Lunia. I welcome your account. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN MAZZY25J bfsmazzytrial
@275 /* <CHARNAME> helped avenge the deaths of my stalwart companions. If this Scroll of Retribution names only the vilest of criminals, then <PRO_HISHER> name has no place among it. */
== OHDNAIMA @276 /* You may not be formally recognized as a holy warrior, but your virtue and honor are beyond reproach. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN MINSC25J bfsminsctrial
@277 /* Evil trembles when <CHARNAME> comes near it! So say Boo and I! */
== OHDNAIMA @278 /* You and your...hamster seem rather spirited. I will keep your words in mind. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN NALIA25J bfsnaliatrial
@279 /* I've seen <CHARNAME> stand for those who have no voice. If <PRO_HISHER> name is on your scroll, then it needs to be rewritten. */
== OHDNAIMA @280 /* You do have a rather noble manner about you... */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN NEERA25J bfsneeratrial
@281 /* Anyone who'd risk earning the Red Wizards' fury, especially to protect a bunch of wild mages, is someone worth trusting. */
== OHDNAIMA @282 /* A roundabout argument but I will concede your point. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN RASAA25J bfsrasaadtrial
@283 /* <CHARNAME> has guided many from darkness. As a follower of Lady Selûne, I cannot help but believe in <PRO_HISHER> cause. */
== OHDNAIMA @284 /* The approval of Selûne's faithful is highly valued in Lunia. I welcome your account. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN SAREV25J bfssarevokcetrial
@285 /* You truly must be mad to think I would speak in your defense. */
== OHDNAIMA @263 /* Your preference is noted. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN SAREV25J bfssarevokcgtrial
@286 /* I once strove only to further my ambitions. I knew no peace until <CHARNAME> showed me another path. If you name <PRO_HIMHER> on your list, then your justice has no merit. */
== OHDNAIMA @287 /* Your transformation is significant. I shall consider your statement in the interest of fairness. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN VALYG25J bfsvalygartrial
@288 /* Athkatla breeds cruelty, but <CHARNAME> has risen above its temptations. That alone makes <PRO_HIMHER> better than most. */
== OHDNAIMA @289 /* You seem an honorable man. I welcome your account. */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub

CHAIN WILSO25J bfsbeartrial
@518 /* ~*Wilson grunts and scuffles his paws*~ */
== OHDNAIMA @519 /* ~He says you shared your rations with him. ...And let him maul those who would harm others. In bear circles that apparently earns you his respect.~ */
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub 

CHAIN OHDNAIMA bfs.trialhub
@290 /* Do you have anything else to say in your defense? */
END
/* paste the above options over again */
+ ~NumInPartyGT(0)~ + @218 /* My companions will vouch for me. */ EXTERN OHDNAIMA bfs.companionhub
+ ~GlobalLT("bfsreptrial","GLOBAL",1) ReputationGT(Player1,17)~ + @219 /* My reputation speaks for itself. Everywhere I've travelled, I've helped those in need. */ DO ~IncrementGlobal("bfsreptrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.flawlessreputation
+ ~GlobalLT("bfschatrial","GLOBAL",1) CheckStatGT(Player1,16,CHR)~ + @220 /* Look at me. How can you not trust this face? */ DO ~IncrementGlobal("bfschatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.okaynarcissus
+ ~GlobalLT("bfsstrtrial","GLOBAL",1) CheckStatGT(Player1,16,STR)~ + @221 /* You ask for words, but I speak best with my fists. I've destroyed others far stronger than you. */ DO ~IncrementGlobal("bfsstrtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",-1)~ EXTERN OHDNAIMA bfs.weirdflex
+ ~GlobalLT("bfsinttrial","GLOBAL",1) CheckStatGT(Player1,16,INT)~ + @222 /* If I were complicit in Saradush's destruction, why would I risk coming here to stand trial? */ DO ~IncrementGlobal("bfsinttrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.checkmate
+ ~GlobalLT("bfswistrial","GLOBAL",1) CheckStatGT(Player1,16,WIS)~ + @223 /* Wisdom guides my thoughts as well as my actions. */ DO ~IncrementGlobal("bfswistrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.wisewords
+ ~GlobalLT("bfslegallyblondtrial","GLOBAL",1) OR(3) Alignment(Player1,CHAOTIC_GOOD) Alignment(Player1,NEUTRAL_GOOD) Alignment(Player1,LAWFUL_GOOD)~ + @224 /* I am a good person. And good people don't just destroy cities. */ DO ~IncrementGlobal("bfslegallyblondtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.goodpoint /* aka the 'happy people just don't shoot their husbands' option :3 */
/* add more options to improve the score based on GOOD choices in SOA / TOB */
+ ~GlobalLT("bfscctrial","GLOBAL",1) GlobalGT("FreeSlaves","GLOBAL",0)~ + @225 /* I broke the chains of slavery in Athkatla, freeing many who were held captive within the Copper Coronet. */ DO ~IncrementGlobal("bfscctrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.strikeone
+ ~GlobalLT("bfssuldtrial","GLOBAL",1)~ + @226 /* I assisted in saving the elven city of Suldanessellar. */ DO ~IncrementGlobal("bfssuldtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.strikethree
+ ~GlobalLT("bfasatrial","GLOBAL",1) !Global("amasanaDead","GLOBAL",1) Global("AsanaPlot","GLOBAL",3)~ + @227 /* I paid a group of mercenaries, using my personal coin, to save the life of an innocent. I upheld the spirit of the law without condemning others to needlessly suffer. */ DO ~IncrementGlobal("bfasatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.striketwo
/* add options to improve the score based on quests completed in lunia itself */
+ ~GlobalLT("bfscogtrial","GLOBAL",1) Global("bfslawquest","GLOBAL",2)~ + @228 /* I assisted the malfunctioning Inevitable in restoring its function. Does that not prove I'm inclined to help others? */ DO ~IncrementGlobal("bfscogtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.coginwheel
++ @229 /* I have no further proof. */ EXTERN OHDNAIMA bfs.ihavedonenothingwrong

CHAIN OHDNAIMA bfs.ihavedonenothingwrong /* aka the closing arguments */
@291 /* Before I declare my verdict, do you have any closing arguments you'd like to make? */
END
+ ~GlobalGT("bfsnaimanconvinced","GLOBAL",6)~ + @292 /* Yaga-Shura destroyed Saradush. The city did not fall by my hand. */ EXTERN OHDNAIMA bfs.iknowthisandloveyou
+ ~GlobalGT("bfsnaimanconvinced","GLOBAL",6)~ + @293 /* Blame me if you like, but I didn't choose this madness. */ EXTERN OHDNAIMA bfs.iknowthisandloveyou
+ ~GlobalGT("bfsnaimanconvinced","GLOBAL",6)~ + @294 /* Causation does not prove guilt. I was not present in Saradush, nor did I order its destruction. */ EXTERN OHDNAIMA bfs.iknowthisandloveyou
+ ~GlobalGT("bfsnaimanconvinced","GLOBAL",6)~ + @295 /* I have nothing more to add. */ EXTERN OHDNAIMA bfs.iknowthisandloveyou
+ ~GlobalLT("bfsnaimanconvinced","GLOBAL",7)~ + @292 /* Yaga-Shura destroyed Saradush. The city did not fall by my hand. */ EXTERN OHDNAIMA bfs.doesntengendertrust
+ ~GlobalLT("bfsnaimanconvinced","GLOBAL",7)~ + @293 /* Blame me if you like, but I didn't choose this madness. */ EXTERN OHDNAIMA bfs.doesntengendertrust
+ ~GlobalLT("bfsnaimanconvinced","GLOBAL",7)~ + @294 /* Causation does not prove guilt. I was not present in Saradush, nor did I order its destruction. */ EXTERN OHDNAIMA bfs.doesntengendertrust
+ ~GlobalLT("bfsnaimanconvinced","GLOBAL",7)~ + @295 /* I have nothing more to add. */ EXTERN OHDNAIMA bfs.doesntengendertrust

CHAIN OHDNAIMA bfs.iknowthisandloveyou
@296 /* A grave error has been made. <CHARNAME> you are, by all accounts, a paragon of virtue. Your name should never have been added to the Scroll. */
== OHDNAIMA @297 /* Please take this ink and sand - the tools by which names are recorded or erased. Use them to amend the list. I offer my sincerest apologies for this injustice. */
== OHDNAIMA @298 /* I must report this oversight to my superiors. Such a travesty cannot be repeated. But I urge you to seek out the planetar who first named you. Only then can we learn who is responsible for framing you. */
== OHDNAIMA @299 /* Fare thee well on the remainder of your quest. */
DO ~AddJournalEntry(@100003, QUEST) SetGlobal("bfsinnocenceproven","GLOBAL",1) GiveItem("OHDINK",Player1) EscapeAreaNoSee()~ EXIT

CHAIN OHDNAIMA bfs.doesntengendertrust
@300 /* You have offered your arguments but I am unconvinced. Your name shall remain inscribed unless you offer irrefutable proof. */
== OHDNAIMA @301 /* Seek out the planetar who first spoke against you. Perhaps, in doing so, you will find clarity. */
== OHDNAIMA @299 /* Fare thee well on the remainder of your quest. */
DO ~AddJournalEntry(@100004, QUEST) SetGlobal("bfsinnocenceprovesnothing","GLOBAL",1)~ EXIT

/* second talk */
CHAIN IF WEIGHT #-1 ~Global("bfsspoketoscribe","GLOBAL",1) Global("bfsluniaaccepted","GLOBAL",1)~ THEN OHDNAIMA bfs.secondattempt
@302 /* Good evening to you, <CHARNAME>. Have you returned with further testimony or evidence? */
END
+ ~PartyHasItem("bftea")~ + @303 /* I found the planetar responsible. I have no concrete proof beyond their confession, but after attacking me, they dropped this gem. */ EXTERN OHDNAIMA bfs.tearsoftriad
++ @304 /* I'll return later. */ EXIT

CHAIN OHDNAIMA bfs.tearsoftriad
@305 /* You hold a Tear of the Triad. A gem formed when divine servants act in error or stray from justice. Such a token, when shrouded in shadow, marks Tyr's disapproval. */
== OHDNAIMA @306 /* But to see one so utterly devoid of light is rare. If this was held by the planetar who named you, then I must accept the error of my own judgment. */
== OHDNAIMA @307 /* <CHARNAME>, I was wrong to doubt you. Your name does not belong upon the Scroll of Divine Retribution. */
== OHDNAIMA @297 /* Please take this ink and sand - the tools by which names are recorded or erased. Use them to amend the list. I offer my sincerest apologies for this injustice. */
== OHDNAIMA @308 /* I must report this oversight to my superiors. Such a travesty cannot be repeated. */
DO ~AddJournalEntry(@100006, QUEST) SetGlobal("bfsinnocenceproven","GLOBAL",1) TakePartyItem("bftea")  GiveItem("OHDINK",Player1) EscapeAreaNoSee()~
EXIT
