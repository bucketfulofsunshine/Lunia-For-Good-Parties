BEGIN bffea

IF ~True()~ THEN BEGIN bffea
SAY ~If you are pure of heart, then my blessing will make you fleet of foot.~
+ ~!AreaCheck("OH5500")~ + ~Take me to Lunia.~ EXTERN bffea lunport
+ ~AreaCheck("OH5500")~ + ~Take me back to Amkethran.~ EXTERN bffea amkport
++ ~I'll stay here for now.~ EXIT
END

IF ~~ lunport
SAY ~You are worthy.~
IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("lunport")~ EXIT
END

IF ~~ amkport
SAY ~You are worthy.~
IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("amkport")~ EXIT
END
