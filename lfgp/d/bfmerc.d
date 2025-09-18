/* mercy whitedove offers bounties to players who have the sigil of tyr */
BEGIN bfmerc

/* lacks sigil of tyr */
CHAIN IF ~!PartyHasItem("ohdsigil")~ THEN bfmerc bfs.nomercy
~I've bounties to offer to the faithful. Lacking Tyr's Sigil, however, I may not place its burdens upon you.~ EXIT 

/* player has the sigil of tyr */
CHAIN IF ~PartyHasItem("ohdsigil") Global("bfsmercyspokento","LOCALS",0)~ THEN bfmerc bfs.killthemwithkindness
~You bear Tyr's sigil. By his mark, I may entrust you with bounties from the Scroll of Retribution. Two writs have been inked if you wish to claim them.~ 
DO ~SetGlobal("bfsmercyspokento","LOCALS",1)~
END
// ++ ~Tell me of these bounties. Who are they, and what crimes weigh upon them?~ EXTERN
++ ~I've no interest in chasing fugitives.~ EXTERN bfmerc bfs.justiceneversleeps

CHAIN bfmerc bfs.justiceneversleeps
~So be it.~ EXIT
