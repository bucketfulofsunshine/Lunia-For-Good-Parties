BEGIN ~OHDNAIMA~

IF ~  NumberOfTimesTalkedTo(0) !Global("bfsluniaaccepted","GLOBAL",1)
~ THEN BEGIN 0 // from:
  SAY @136 /* Good evening to you. I am Naiman Alore. */
  IF ~~ THEN REPLY @137 /* Good to meet you, Naiman. My name is <CHARNAME>. I bring you word from Tyr. */ GOTO 1
  IF ~~ THEN REPLY @138 /* I am Rodesi Ponz. I bring word from Tyr. */ GOTO 3
  IF ~~ THEN REPLY @139 /* You are the scribe of Righteous Wrath? */ GOTO 4
  IF ~  Dead("ohdrdef")
~ THEN REPLY @140 /* Soon you will be the corpse of Naiman Alore. */ GOTO 2
  IF ~  !Dead("ohdrdef")
~ THEN REPLY @140 /* Soon you will be the corpse of Naiman Alore. */ EXTERN ~OHDRDEF~ 35
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY @141 /* <CHARNAME>? Guards? GUARDS! */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 2 // from: 0.3 3.4 5.4 6.4 7.4 9.3 10.0 10.2 10.4 12.2 13.1 16.0
  SAY @142 /* Guards! Help me! GUARDS! */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 3 // from: 0.1
  SAY @143 /* It is good to meet you, Rodesi. What can I do for you? */
  IF ~  !Dead("dorn")
~ THEN REPLY @144 /* I've come to see two names removed from the scroll. <CHARNAME> and Dorn Il-Khan. I destroyed them both in Tyr's name. */ GOTO 5
  IF ~  Dead("dorn")
~ THEN REPLY @145 /* I've come to see a name removed from the scroll. <CHARNAME>. I slew <PRO_HIMHER> in Tyr's name. */ GOTO 5
  IF ~  OR(2)
CheckStatLT(Player1,14,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY @146 /* I am on a holy quest to gather several items—among them, ink and sand used in the writing of the Scroll of Retribution. */ GOTO 12
  IF ~  CheckStatGT(Player1,13,CHR)
OR(2)
PartyHasItem("OHDSIGIL")
CheckStatGT(Player1,17,CHR)
~ THEN REPLY @146 /* I am on a holy quest to gather several items—among them, ink and sand used in the writing of the Scroll of Retribution. */ GOTO 11
  IF ~~ THEN REPLY @147 /* You can die for a start. Actually, that'll do for an end as well. */ GOTO 2
END

IF ~~ THEN BEGIN 4 // from: 0.2
  SAY @148 /* I do not consider myself particularly wrathful. I do have the honor of inscribing names in the Scroll of Divine Retribution. */
  IF ~  !Dead("dorn")
~ THEN REPLY @144 /* I've come to see two names removed from the scroll. <CHARNAME> and Dorn Il-Khan. I destroyed them both in Tyr's name. */ GOTO 5
  IF ~  Dead("dorn")
~ THEN REPLY @145 /* I've come to see a name removed from the scroll. <CHARNAME>. I slew <PRO_HIMHER> in Tyr's name. */ GOTO 5
  IF ~  OR(2)
CheckStatLT(Player1,14,CHR)
!PartyHasItem("OHDSIGIL")
~ THEN REPLY @149 /* Tyr has sent me on a holy quest to gather several items, including ink and sand used in the writing of the Scroll of Retribution. */ GOTO 12
  IF ~  CheckStatGT(Player1,13,CHR)
OR(2)
PartyHasItem("OHDSIGIL")
CheckStatGT(Player1,17,CHR)
~ THEN REPLY @149 /* Tyr has sent me on a holy quest to gather several items, including ink and sand used in the writing of the Scroll of Retribution. */ GOTO 11
  IF ~~ THEN REPLY @150 /* You'll also have the honor of striking a name or two. */ GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 3.0 3.1 4.0 4.1 4.4
  SAY @151 /* You would have me remove names from the Scroll of Retribution? */
  IF ~  Dead("dorn")
~ THEN REPLY @152 /* Just one name. */ GOTO 6
  IF ~  !Dead("dorn")
~ THEN REPLY @153 /* Precisely. */ GOTO 6
  IF ~~ THEN REPLY @154 /* That is the gods' will. */ GOTO 7
  IF ~~ THEN REPLY @155 /* I'll do it myself if you'd like. Just give me some ink and sand. */ GOTO 13
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @156 /* Never mind. I'll do it myself. */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @156 /* Never mind. I'll do it myself. */ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 6 // from: 5.0 5.1
  SAY @157 /* None but the gods can bid me do that. */
  IF ~  PartyHasItem("OHDSIGIL")
CheckStatLT(Player1,16,CHR)
~ THEN REPLY @158 /* I am here on their behalf. See, I have a sigil. */ GOTO 7
  IF ~  PartyHasItem("OHDSIGIL")
CheckStatGT(Player1,15,CHR)
~ THEN REPLY @158 /* I am here on their behalf. See, I have a sigil. */ GOTO 9
  IF ~  !PartyHasItem("OHDSIGIL")
~ THEN REPLY @159 /* I am here on their behalf. */ GOTO 7
  IF ~~ THEN REPLY @160 /* Give me some ink and sand, then. I'll make the changes myself. */ GOTO 13
  IF ~~ THEN REPLY @161 /* I am your god now, scribe. Do as I command. */ GOTO 2
END

IF ~~ THEN BEGIN 7 // from: 5.2 6.0 6.2
  SAY @162 /* Why would they not contact me directly? */
  IF ~  CheckStatLT(Player1,18,CHR)
~ THEN REPLY @163 /* I know only what Tyr commanded me to do. Would you deny him? */ GOTO 8
  IF ~  CheckStatGT(Player1,17,CHR)
~ THEN REPLY @163 /* I know only what Tyr commanded me to do. Would you deny him? */ GOTO 18
  IF ~  CheckStatLT(Player1,17,CHR)
~ THEN REPLY @164 /* You'd have to ask them. */ GOTO 9
  IF ~  CheckStatGT(Player1,16,CHR)
~ THEN REPLY @164 /* You'd have to ask them. */ GOTO 18
  IF ~~ THEN REPLY @165 /* I am contacting you directly, scribe. Do as you're told or even the gods won't be able to save you. */ GOTO 2
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY @166 /* First you said you were here at the behest of the gods. Then you say you're here at Tyr's command. */
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 9 // from: 6.1 7.2 8.0
  SAY @167 /* This doesn't feel right. */
  IF ~~ THEN REPLY @168 /* If it makes you feel better, give me some ink and sand, and I'll make the changes. */ GOTO 12
  IF ~  CheckStatLT(Player1,17,CHR)
~ THEN REPLY @169 /* I cannot disagree. But when the gods command, I must obey. */ GOTO 10
  IF ~  CheckStatGT(Player1,16,CHR)
~ THEN REPLY @169 /* I cannot disagree. But when the gods command, I must obey. */ GOTO 18
  IF ~  OR(2)
CheckStatLT(Player1,16,STR)
CheckStatLT(Player1,16,CHR)
~ THEN REPLY @170 /* You're going to feel substantially less right if you don't do what I tell you. */ GOTO 2
  IF ~  CheckStatGT(Player1,15,STR)
CheckStatGT(Player1,15,CHR)
~ THEN REPLY @170 /* You're going to feel substantially less right if you don't do what I tell you. */ GOTO 19
END

IF ~~ THEN BEGIN 10 // from: 9.1
  SAY @171 /* No. No, I'm sorry, but I cannot do what you ask. */
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @172 /* And I'm sorry for what happens now. */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @172 /* And I'm sorry for what happens now. */ EXTERN ~DORN25J~ 162
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @173 /* You're going to be considerably more sorry in a couple seconds, I fear. */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @173 /* You're going to be considerably more sorry in a couple seconds, I fear. */ EXTERN ~DORN25J~ 162
  IF ~~ THEN REPLY @174 /* I'm not asking, scribe. You will do as I command. */ GOTO 2
END

IF ~~ THEN BEGIN 11 // from: 3.3 4.3
  SAY @175 /* For a crusader of Tyr, I've plenty of each. Here, take them with my blessing. */
  IF ~~ THEN REPLY @176 /* Tyr's blessing be upon you, Naiman Alore. */ DO ~GiveItem("OHDINK",Player1)
~ GOTO 17
  IF ~~ THEN REPLY @177 /* Many thanks, scribe. You've served Tyr well this day. Evening. You know what I mean. */ DO ~GiveItem("OHDINK",Player1)
~ GOTO 17
  IF ~~ THEN REPLY @178 /* I have blessings enough. It's ink and sand I need. */ DO ~GiveItem("OHDINK",Player1)
~ GOTO 17
END

IF ~~ THEN BEGIN 12 // from: 3.2 4.2 9.0
  SAY @179 /* Would that I could help you. But I am to use the ink and sand for nothing but the scroll. */
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @180 /* You're making a mistake, scribe. I beg you reconsider. */ GOTO 16
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @180 /* You're making a mistake, scribe. I beg you reconsider. */ EXTERN ~DORN25J~ 162
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @181 /* If I can't have the ink, I'll take your blood, scribe. */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @181 /* If I can't have the ink, I'll take your blood, scribe. */ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 13 // from: 5.3 6.3
  SAY @182 /* I cannot allow that. Only I am permitted to use the ink and sand. */
  IF ~~ THEN REPLY @183 /* Is that your final word on the matter? */ GOTO 14
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @181 /* If I can't have the ink, I'll take your blood, scribe. */ GOTO 2
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @181 /* If I can't have the ink, I'll take your blood, scribe. */ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 14 // from: 13.0
  SAY @184 /* It is. */
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @185 /* Then you leave me no choice. You brought this on yourself. */ GOTO 15
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @185 /* Then you leave me no choice. You brought this on yourself. */ EXTERN ~DORN25J~ 162
END

IF ~~ THEN BEGIN 15 // from: 14.0
  SAY @186 /* The pavilion is defiled! Guards, destroy them! */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 16 // from: 12.0
  SAY @187 /* You threaten me? */
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 17 // from: 11.0 11.1 11.2
  SAY @188 /* May you fare well on the remainder of your quest. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 18 // from: 7.1 7.3 9.2
  SAY @189 /* In my years of service, I've learned better than to second-guess those above. Which names would you see stricken from the record? */
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @190 /* <CHARNAME> and Dorn Il-Khan. */ DO ~AddJournalEntry(92032,INFO)
~ GOTO 20
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @191 /* <CHARNAME>. */ DO ~AddJournalEntry(97743,INFO)
SetGlobal("OHD_inscribed_dorn","GLOBAL",1)
~ GOTO 20
END

IF ~~ THEN BEGIN 19 // from: 9.4
  SAY @192 /* V-very well. Whose name do you wish to see stricken from the scroll? */
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @190 /* <CHARNAME> and Dorn Il-Khan. */ DO ~AddJournalEntry(92033,INFO)
~ GOTO 20
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @191 /* <CHARNAME>. */ DO ~AddJournalEntry(97744,INFO)
SetGlobal("OHD_inscribed_dorn","GLOBAL",1)
~ GOTO 20
END

IF ~~ THEN BEGIN 20 // from: 18.0 18.1 19.0 19.1
  SAY @193 /* It is done. */
  IF ~~ THEN REPLY @194 /* Many thanks, scribe. You've done the gods a great service this evening. You should be proud of yourself. */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ GOTO 26
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @195 /* It's not all that's done. */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ GOTO 25
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @195 /* It's not all that's done. */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
DestroyItem("ohdink")
~ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 21 // from:
  SAY @193 /* It is done. */
  IF ~~ THEN REPLY @196 /* I thank you for your efforts and your discretion. Good evening. */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
SetGlobal("OHD_naimanalerts","OH5500",1)
~ EXIT
  IF ~~ THEN REPLY @197 /* You've done well. Now be a good little weasel and don't mention this to anyone else. All right? I'd hate for us to meet again under less pleasant circumstances. */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ GOTO 23
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @198 /* And so are you. */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
~ GOTO 22
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @198 /* And so are you. */ DO ~SetGlobal("OHD_finished","GLOBAL",1)
DestroyItem("ohdink")
~ EXTERN ~DORN25J~ 163
END

IF ~~ THEN BEGIN 22 // from: 21.2
  SAY @199 /* No, please! I did what you asked! Guards, help me! GUARDS! */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 23 // from: 21.1
  SAY @200 /* I shall tell no one, m'<PRO_LADYLORD>. */
  IF ~~ THEN DO ~SetGlobal("OHD_naimanalerts","OH5500",1)
~ EXIT
  IF ~  CheckStatGT(Player1,16,STR)
CheckStatGT(Player1,17,CHR)
~ THEN EXIT
END

IF ~  Global("OHD_naimanalerts","OH5500",2)
~ THEN BEGIN 24 // from:
  SAY @201 /* Blasphemers are among us! Guards, kill them! Now, before they escape! */
  IF ~~ THEN DO ~SetGlobal("OHD_naimanalerts","OH5500",3)
ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 25 // from: 20.1
  SAY @202 /* What—? No! Guards! Help me! GUARDS! */
  IF ~~ THEN DO ~ActionOverride("OHDRDEF",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 26 // from: 20.0
  SAY @203 /* I am unworthy of your praise—but that won't stop me from accepting it. Good evening to you. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 27 // from:
  SAY @204 /* I've never set eyes on this person before. */
  IF ~~ THEN REPLY @205 /* And seeing you up close now, I realize I was mistaken. Forgive me. I'll waste no more of your time. */ EXTERN ~OHDRDEF~ 35
  IF ~~ THEN REPLY @206 /* I was but a child when last you saw me, Uncle. */ GOTO 28
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @207 /* You'll soon wish you had, you simpering fop! */ EXTERN ~OHDRDEF~ 34
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @207 /* You'll soon wish you had, you simpering fop! */ EXTERN ~DORN25J~ 170
END

IF ~~ THEN BEGIN 28 // from: 27.1
  SAY @208 /* You're mistaken. I have no siblings and never married. */
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @209 /* You're right. I am mistaken. Please excuse me. */ EXTERN ~OHDRDEF~ 35
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @209 /* You're right. I am mistaken. Please excuse me. */ EXTERN ~DORN25J~ 168
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @210 /* Well, I tried. */ EXTERN ~OHDRDEF~ 34
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @210 /* Well, I tried. */ EXTERN ~DORN25J~ 167
  IF ~  !IfValidForPartyDialogue("dorn")
~ THEN REPLY @211 /* That's unfortunate. If you had, you might have survived the next few minutes. */ EXTERN ~OHDRDEF~ 34
  IF ~  IfValidForPartyDialogue("dorn")
~ THEN REPLY @211 /* That's unfortunate. If you had, you might have survived the next few minutes. */ EXTERN ~DORN25J~ 169
END

/* lfgp */
/* you have been weighed, you have been measured, & you MAY be found wanting. */

CHAIN IF ~Global("bfsspoketoscribe","GLOBAL",0) Global("bfsluniaaccepted","GLOBAL",1)~ THEN OHDNAIMA bfs.trialstart
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
+ ~GlobalLT("bfasatrial","GLOBAL",1) !Global("amasanaDead","GLOBAL",1) Global("AsanaPlot","GLOBAL",3)~ + @227 /* I paid a group of mercenaries, using my personal coin, to save the life of an innocent. I upheld the spirit of the law without condemning others to needlessly suffer. */ DO ~IncrementGlobal("bfasatrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.striketwo
/* add options to improve the score based on quests completed in lunia itself */
+ ~GlobalLT("bfscogtrial","GLOBAL",1) Global("bfslawquest","GLOBAL",2)~ + @228 /* I assisted the malfunctioning Inevitable in restoring its function. Does that not prove I'm inclined to help others? */ DO ~IncrementGlobal("bfscogtrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~ EXTERN OHDNAIMA bfs.coginwheel
++ @229 /* I have no further proof. */ EXTERN OHDNAIMA bfs.ihavedonenothingwrong

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
// + ~GlobalLT("bfsbeartrial","GLOBAL",1) InParty("WILSON") InMyArea("WILSON") !StateCheck("WILSON",CD_STATE_NOTVALID)~ + ~Wilson.~ EXTERN WILSO25J bfsbeartrial
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
== OHDNAIMA @276 /* You are small of stature, halfling, but large of heart. I sense the truth in your words and will give them due consideration. */
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

/* wilson doesn't have a TOB override script & i'm too scared to add one
editing this out in the meantime */
/* CHAIN WILSO25J bfsbeartrial
~*Wilson grunts and scuffles his paws*~
== OHDNAIMA ~He says you shared your rations with him. ...And let him maul those who would harm others. In bear circles that apparently earns you his respect.~
DO ~SetGlobal("bfsbeartrial","GLOBAL",1) IncrementGlobal("bfsnaimanconvinced","GLOBAL",1)~
END
IF ~~ EXTERN OHDNAIMA bfs.companionhub */

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
CHAIN IF ~Global("bfsspoketoscribe","GLOBAL",1) Global("bfsluniaaccepted","GLOBAL",1)~ THEN OHDNAIMA bfs.secondattempt
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
