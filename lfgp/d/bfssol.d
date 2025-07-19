BEGIN bfssol

/* planetar of justice */ 
IF ~Global("bfssol","GLOBAL",0)~ THEN BEGIN bfs.youstandaccused
SAY ~I greet you <CHARNAME> of Candlekeep and bring a most dire message. Upon the Scroll of Retribution your name has been writ in divine flame.~ 
++ ~The Scroll of Retribution? I've never heard of it.~ + bfs.gimmethelore
++ ~What crimes do you believe I have committed?~ + bfs.iobject
END

IF ~~ bfs.gimmethelore
SAY ~It chronicles the sins of the vilest mortals. Once inscribed, the devout - often sworn to Tyr or Torm - take up the charge to mete out justice on the condemned.~
++ ~What crimes do you believe I have committed?~ + bfs.iobject
END

IF ~~ bfs.iobject
SAY ~The charge laid against you is no small thing: the destruction of Saradush and the death of innocents trapped within its walls.~ 
= ~Yet even in Lunia word of your righteous deeds have reached our ears. Many believe you wouldn't be responsible for such a massacre.~
++ ~If justice has been twisted, then you have my aid. Even it if means I must stand trial.~ + bfs.luniaquestaccept
++ ~I care nothing for your laws. But, if my aid might offer peace to those departed, then I will comply with your demands.~ + bfs.luniaquestaccept
++ ~I won't be dragged into this. Let those who accuse me find their own answers.~ + bfs.luniaquestignore
END

IF ~~ bfs.luniaquestaccept
SAY ~You are summoned, as a guest not as a condemned soul, to help us ascertain the truth. Speak in your defense. Find the one who would make a mockery of Tyr's justice. I pray your name might yet be stricken from the Scroll.~ 
IF ~~ DO ~SetGlobal("bfsluniaaccepted","GLOBAL",1) SetGlobal("bfssol","GLOBAL",1) SetGlobal("bfslun","GLOBAL",1) GiveItemCreate("bffea",Player1,1,0,0) CreateVisualEffectObject("SPUNHOLY",Myself) Wait(2) DestroySelf()~ EXIT
END

IF ~~ bfs.luniaquestignore
SAY ~So be it. We will seek clarity one way or another. I pray we will not cross blades in the days to come.~
IF ~~ DO ~SetGlobal("bfssol","GLOBAL",1) CreateVisualEffectObject("SPUNHOLY",Myself) Wait(2) DestroySelf()~ EXIT
END
