/* mercy whitedove offers bounties to players who have the sigil of tyr */
BEGIN bfmerc

/* lacks sigil of tyr */
CHAIN IF ~!PartyHasItem("ohdsigil")~ THEN bfmerc bfs.nomercy
~I have bounties to offer to Tyr's faithful. Lacking his Sigil, however, such burdens cannot be yours to bear.~ [bfblank] EXIT 

/* player has the sigil of tyr */
CHAIN IF ~PartyHasItem("ohdsigil") Global("bfsmercyspokento","LOCALS",0)~ THEN bfmerc bfs.killthemwithkindness
~You bear Tyr's sigil. With his mark, I may entrust you with lesser bounties. A writ have been inscribed if you wish to claim it.~ [bfblank]
DO ~SetGlobal("bfsmercyspokento","LOCALS",1)~
END
+ ~Global("bfmercyhistory","LOCALS",0)~ + ~Are you one of Tyr's faithful?~ DO ~SetGlobal("bfmercyhistory","LOCALS",1)~ EXTERN bfmerc bfs.mercyhistorylesson
++ ~Tell me of this bounty. Who are they and what crimes weigh upon them?~ EXTERN bfmerc bfs.fallenfromgrace
++ ~I've no interest in chasing fugitives.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.justiceneversleeps
~So be it. May you find justice...or retribution, as the case may be.~ [bfmer4] EXIT 

CHAIN bfmerc bfs.mercyhistorylesson
~No. I am the most just and merciful Whitedove, Doombringer of Hoar. You may call me Mercy.~ [bfmer1]
== BFMERC ~Even in the heavenly realms, injustice festers. I walk the path of retribution, striking where Hoar deems it necessary.~
END
++ ~Tell me of this bounty. Who are they and what crimes weigh upon them?~ EXTERN bfmerc bfs.fallenfromgrace
++ ~I've no interest in chasing fugitives.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.fallenfromgrace
~Once servants of Tyr and the Upper Planes, a group of celestials have fallen from grace. Their corruption spreads within Mount Celestia, sullying its court and leading petitioners astray.~
== BFMERC ~By the command of Tyr, they must be purged, so the faithful may seek guidance untainted by malice.~ 
END
++ ~I will take this bounty.~ EXTERN bfmerc bfs.fallencelestials
++ ~This is where my contributions to Tyr's cause ends.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.fallencelestials
~Violence repays violence. Evil repays evil. Good repays good.~ [bfmer3]
== BFMERC ~I shall teleport you to the glade where the celestials last lingered. I trust you have your own means of return.~
== BFMERC ~Let justice, or retribution, guide your hand.~ 
DO ~SetGlobal("bfmercycelestial","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("BFCEMT")~ EXIT

/* heard about second chances? yeah, mercy doesn't offer those */
CHAIN IF ~Global("bfsmercyspokento","LOCALS",1) !GlobalGT("bfmercycelestial","GLOBAL",0)~ THEN bfmerc bfs.mercycatchall
~I have no time for the cravenhearted.~ [bfblank] EXIT

/* main hub & completed bounty rewards */
CHAIN IF ~Global("bfsmercyspokento","LOCALS",1) OR(2) GlobalGT("bfmercycelestial","GLOBAL",0) GlobalGT("bfmercyfiends","GLOBAL",0)~ THEN bfmerc bfs.mercymainhub
~You return. Have you anything to report?~
END
+ ~PartyHasItem("bfpepr")~ + ~I've dealt with the Fallen Celestials. They will bother Lunia's petitioners no further.~ EXTERN bfmerc bfs.quest2completion
++ ~Nothing at present.~ EXIT

CHAIN bfmerc bfs.quest2completion
~Swift and reciprocal reward and retribution is the foundation of civilized society.~ [bfmerc2] DO ~TakePartyItem("BFPEPR") DestroyItem("BFPEPR") GiveGoldForce(10000) AddExperienceParty(210000) AddJournalEntry(@100010, QUEST_DONE)~
== BFMERC ~I've no further bounties to extend to you at this time.~ EXIT
