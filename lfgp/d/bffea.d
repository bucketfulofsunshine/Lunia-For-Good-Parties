BEGIN bffea

IF ~True()~ THEN BEGIN bffea
SAY @23 /* If you are pure of heart, then my blessing will make you fleet of foot. */
+ ~!AreaCheck("OH5500")~ + @24 /* Take me to Lunia. */ EXTERN bffea lunport
++ @25 /* I'll stay here for now. */ EXIT
END

IF ~~ lunport
SAY @26 /* You are worthy. */
IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("lunport")~ EXIT
END
