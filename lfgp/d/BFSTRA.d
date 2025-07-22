BEGIN BFSTRA

/* traitor */
CHAIN IF ~Global("bfstraitorconvo","GLOBAL",0)~ THEN BFSTRA bfs.traitorconvo
~You walk too boldly mortal. But you aren't merely mortal, are you? And arrogance has ever been the way of your kind.~
DO ~SetGlobal("bfstraitorconvo","GLOBAL",1)~
END
+ ~Class(Player1,PALADIN)~ + ~I sense your evil intent. Are you the Planetar who framed me?~ EXTERN BFSTRA bfs.natureofnames
++ ~Did you ask Naiman Alore to write my name on the Scroll of Retribution?~ EXTERN BFSTRA bfs.natureofnames
++ ~I'm here to uncover the name of a traitor. I believe it may be yours.~ EXTERN BFSTRA bfs.natureofnames
++ ~You speak of arrogance and yet your words drip with it.~ EXTERN BFSTRA bfs.natureofnames

CHAIN BFSTRA bfs.natureofnames
~Names are not trivial things. In the planes they have power. You hold many: <CHARNAME>, Bhaalspawn, God-child.~
= ~To scribe a name upon the Scroll of Retribution is to summon judgement and death. You seek the one who named you? Then look no further.~
END
++ ~Why would a being of Celestia subvert justice? You betrayed your purpose.~ EXTERN BFSTRA bfs.judgejuryandexecutioner
++ ~You knew I was innocent. You implicated me anyway.~ EXTERN BFSTRA bfs.stainedwithblood
++ ~You abused the cosmic laws. There's no absolution for what you've done.~ EXTERN BFSTRA bfs.judgejuryandexecutioner

CHAIN BFSTRA bfs.stainedwithblood
~You can never be innocent. You carry the stain of murder in your blood.~
END
IF ~~ EXTERN BFSTRA bfs.judgejuryandexecutioner

CHAIN BFSTRA bfs.judgejuryandexecutioner
~Your existence threatens that of my true master, Cyric. Lord Ao decreed that no god may interfere in your destiny but no such law prohibits their followers.~
END
++ ~So Cyric couldn't act himself, and you decided to do it for him?~ EXTERN BFSTRA bfs.truecalling
++ ~You saw a future you feared. So you hoped to destroy it before it took shape.~ EXTERN BFSTRA bfs.truecalling
++ ~You bore the light of Celestia once, but it is a Bhaalspawn who will uphold true justice tonight.~ EXTERN BFSTRA bfs.truecalling

CHAIN BFSTRA bfs.truecalling
~Tyr's faithful have stayed their hand. For lack of their involvement, I will carry out your sentence myself. The Scroll of Retribution calls for your blood and I will answer.~
= ~Let us see what burns brighter, Child of Murder, your tainted light or mine.~
DO ~Enemy()~ EXIT
