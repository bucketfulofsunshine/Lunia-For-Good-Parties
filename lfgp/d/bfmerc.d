/* mercy whitedove offers bounties to players who have the sigil of tyr */
BEGIN bfmerc

/* lacks sigil of tyr */
CHAIN IF ~!PartyHasItem("ohdsigil")~ THEN bfmerc bfs.nomercy
~I have bounties to offer to Tyr's faithful. Lacking his Sigil, however, such burdens cannot be yours to bear.~ [bfblank] EXIT 

/* player has the sigil of tyr */
CHAIN IF ~PartyHasItem("ohdsigil") Global("bfsmercyspokento","LOCALS",0)~ THEN bfmerc bfs.killthemwithkindness
~You bear Tyr's sigil. With his mark, I may entrust you with lesser bounties. Two writs have been inscribed if you wish to claim them.~ [bfblank]
== BFMERC ~Complete both and you may be called to hunt one whose name is inked upon the Scroll of Retribution itself.~
DO ~SetGlobal("bfsmercyspokento","LOCALS",1)~
END
+ ~Global("bfmercyhistory","LOCALS",0)~ + ~Are you one of Tyr's faithful?~ DO ~SetGlobal("bfmercyhistory","LOCALS",1)~ EXTERN bfmerc bfs.mercyhistorylesson
++ ~Tell me of these bounties. Who are they, and what crimes weigh upon them?~ EXTERN bfmerc bfs.bloodwarneverchanges
++ ~I've no interest in chasing fugitives.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.justiceneversleeps
~So be it. May you find justice...or retribution, as the case may be.~ [bfmer4] EXIT 

CHAIN bfmerc bfs.mercyhistorylesson
~No. I am the most just and merciful Whitedove, Doombringer of Hoar. You may call me Mercy.~ [bfmer1]
== BFMERC ~Even in the heavenly realms, injustice festers. I walk the path of retribution, striking where Hoar deems it necessary.~
END
++ ~Tell me of these bounties. Who are they, and what crimes weigh upon them?~ EXTERN bfmerc bfs.bloodwarneverchanges
++ ~I've no interest in chasing fugitives.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.bloodwarneverchanges
~The Blood War rages eternally between devils and demons. Of late, the chaos of the Bhaalspawn Wars caused its battles to spill into the Prime Material.~
== BFMERC ~By Hoar's will and with Tyr's blessing, these fiends must be struck down. Close the portal within Baator and spare innocents from infernal ruin.~ 
END
++ ~I will take this bounty.~ EXTERN bfmerc bfs.infernalaffairs
++ ~I've no interest in this bounty, tell me about the second one.~ EXTERN bfmerc bfs.fallenfromgrace
++ ~I've no interest in these bounties.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.fallenfromgrace
~Once servants of Tyr and the Upper Planes, a group of celestials has fallen from grace. Their corruption spreads within Mount Celestia, sullying its court and leading petitioners astray.~
== BFMERC ~By the command of Tyr, they must be purged, so the faithful may seek guidance untainted by malice.~ 
END
++ ~I will take this bounty.~ EXTERN bfmerc bfs.fallencelestials
++ ~This is where my contributions to Tyr's cause ends.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.infernalaffairs
~Violence repays violence. Evil repays evil. Good repays good.~ [bfmer3]
== BFMERC ~I will deliver you to the portal's threshold. Strike swiftly and let justice be done.~ 
DO ~SetGlobal("bfmercyinfernal","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("BFINF")~ EXIT

CHAIN bfmerc bfs.fallencelestials
~Violence repays violence. Evil repays evil. Good repays good.~ [bfmer3]
== BFMERC ~I shall place you in the glade where the celestials last lingered. Let justice, or retribution, guide your hand.~ 
DO ~SetGlobal("bfmercycelestial","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("BFCEMT")~ EXIT

/* main hub & completed bounty rewards */
CHAIN bfmerc bfs.mercymainhub
~You return. Have you anything to report?~
END
// + ~~ + ~I've dealt with the Devils and Demons in Baator.~ EXTERN bfmerc bfs.quest1completion
// + ~PartyHasItem("bfpepr")~ + ~I've dealt with the Fallen Celestials. They will bother Lunia's petitioners no further.~ EXTERN bfmerc bfs.quest2completion
++ ~Nothing at present.~ EXIT

/* 
CHAIN bfmerc bfs.quest1completion
~Swift and reciprocal reward and retribution is the foundation of civilized society.~ [bfmerc2] DO ~GiveGoldForce(7500) AddExperienceParty(150000)~
END */

/* 
CHAIN bfmerc bfs.quest2completion
~Swift and reciprocal reward and retribution is the foundation of civilized society.~ [bfmerc2] DO ~TakePartyItem("BFPEPR") DestroyItem("BFPEPR") GiveGoldForce(10000) AddExperienceParty(210000)~
END */

/* heard about second chances? yeah, mercy doesn't offer those */
CHAIN IF ~Global("bfsmercyspokento","LOCALS",1) OR(2) !GlobalGT("bfmercycelestial","GLOBAL",0) !GlobalGT("bfmercyfiends","GLOBAL",0)~ THEN bfmerc bfs.mercycatchall
~I have no time for the cravenhearted.~ [bfblank] EXIT
