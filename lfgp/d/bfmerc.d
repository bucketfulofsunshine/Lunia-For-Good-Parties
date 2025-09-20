/* mercy whitedove offers bounties to players who have the sigil of tyr */
BEGIN bfmerc

/* lacks sigil of tyr */
CHAIN IF ~!PartyHasItem("ohdsigil")~ THEN bfmerc bfs.nomercy
~I have bounties to offer to Tyr's faithful. Lacking his Sigil, however, such burdens cannot be yours to bear.~ [bfblank] EXIT 

/* player has the sigil of tyr */
CHAIN IF ~PartyHasItem("ohdsigil") Global("bfsmercyspokento","LOCALS",0)~ THEN bfmerc bfs.killthemwithkindness
~You bear Tyr's sigil. With his mark, I may entrust you with lesser bounties. Two writs have been inscribed if you wish to claim them.~ [bfblank]
== BFMERC ~Complete both and you may be called to hunt someone named upon the Scroll of Retribution itself.~
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
== BFMERC ~By Hoar's will, and with Tyr's blessing, these fiends must be struck down and returned to their planes. Let the innocent be spared the ravages of their conflict.~ 
END
// ++ ~I will take this bounty.~
++ ~I've no interest in this bounty, tell me about the second one.~ EXTERN bfmerc bfs.fallenfromgrace
++ ~I've no interest in any of these bounties.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.fallenfromgrace
~Once servants of Tyr and the Upper Planes, a group of celestials has fallen from grace.~
== BFMERC ~Their corruption spreads within Mount Celestia, leading petitioners astray and sullying its court.~
== BFMERC ~By the command of Tyr, they must be purged, so the faithful may seek guidance untainted by malice.~ 
END
++ ~I will take this bounty.~ EXTERN bfmerc bfs.fallencelestials
++ ~This is where my contributions to Tyr's cause ends.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.fallencelestials
~Violence repays violence. Evil repays evil. Good repays good.~ [bfmer3]
== BFMERC ~May your hunt be swift and successful.~ 
DO ~SetGlobal("bfmercycelestial","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("BFCEMT")~ EXIT

/* on returning & giving a reward - Swift and reciprocal reward and retribution is the foundation of civilized society. bfmer2 */

/* heard about second chances? yeah, mercy doesn't offer those */
CHAIN IF ~Global("bfsmercyspokento","LOCALS",1) OR(2) !GlobalGT("bfmercycelestial","GLOBAL",0) !GlobalGT("bfmercyfiends","GLOBAL",0)~ THEN bfmerc bfs.mercycatchall
~I have no time for the cravenhearted.~ [bfblank] EXIT

