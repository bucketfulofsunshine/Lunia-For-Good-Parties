BEGIN BFTYR

CHAIN IF ~Global("bfstyrtalkfirst","GLOBAL",0)~ THEN BFTYR bfs.divinereckoning
~The rot that festered within my court has revealed itself. Justice, at last, has been served.~
= ~Even in Lunia there are those who would twist the law to serve their own cause. Know that I was not blind to this treachery. But I placed my faith in those who would recognize injustice. ~
= ~My faithful have acted as I had hoped. As have you. But the reckoning is not yet complete.~
= ~Many of Cyric’s brood still linger and I will tolerate their presence no further. The last of these deceivers must be struck down. Will you take up this task, <CHARNAME>? Will you aid me in delivering judgement?~
END
++ ~I will see justice done.~ EXTERN BFTYR bfs.reckoningisdue
++ ~You say you saw the signs. Why did you wait until now to act?~ EXTERN BFTYR bfs.belatedjustice
++ ~I came here to clear my name, not clean your house. Why should I care?~ EXTERN BFTYR bfs.belatedjustice
++ ~I will do what must be done. But know I’m not pleased about being used like this.~ EXTERN BFTYR bfs.reckoningisdue

CHAIN BFTYR bfs.reckoningisdue
~Then let the scales be balanced.~
DO ~SetGlobal("bfstyrtalkfirst","GLOBAL",1) DestroySelf()~ EXIT

CHAIN BFTYR bfs.belatedjustice
~While I may have revealed Cyric’s cult sooner, that would not have served justice fully, as you would still be unaware of those acting against you. As the implicated party, I believed your participation to be the truest form of fairness.~
END
++ ~I will see justice done.~ EXTERN BFTYR bfs.reckoningisdue
++ ~I will do what must be done. But know I'm not pleased about being used like this.~ EXTERN BFTYR bfs.reckoningisdue
