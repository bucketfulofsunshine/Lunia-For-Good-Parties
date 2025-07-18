BEGIN bffea

IF ~True()~ THEN BEGIN bffea
SAY ~I rest only in worthy hands.~
+ ~!AreaCheck("OH5500")~ + ~Take me to Lunia.~ EXTERN bffea lunport
+ ~AreaCheck("OH5500")~ + ~Take me back to Amkethran.~ EXTERN bffea amkport
++ ~I'll stay here for now.~ EXIT
END

IF ~~ lunport
SAY ~The heavens heed your call.~
IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("lunport")~ EXIT
END

IF ~~ amkport
SAY ~Travel with Tyr's blessing.~
IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("amkport")~ EXIT
END
