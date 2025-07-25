BEGIN BFSTHA

/* sea elf merchant */
IF ~True()~ THEN BEGIN BFS.LuniaMerchant
SAY @84 /* Wares from the Silver Sea! Treasures and trinkets cast ashore by the tides! */
++ @85 /* Let me see what you've gathered. */ DO ~StartStore("BFELF",LastTalkedToBy())~ EXIT
+ ~Global("bfsaskedaboutharp","LOCALS",0)~ + @86 /* A harp bow? That's... unusual. */ DO ~SetGlobal("bfsaskedaboutharp","LOCALS",1)~ + bfs.thalharp
+ ~Global("bfsaskedaboutfaith","LOCALS",0)~ + @87 /* What brings you to Lunia? Are you one of the faithful? */ DO ~SetGlobal("bfsaskedaboutfaith","LOCALS",1)~ + bfs.thalfaith
++ @88 /* Farewell. */ EXIT
END

IF ~~ bfs.thalharp
SAY @89 /* A deva offered it to me in exchange for a shell. One that echoed with the deepest song of the seas. */
= @90 /* Judge its worth if you've any interest in procuring it. */
IF ~~ + bfs.thalhub
END

IF ~~ bfs.thalfaith
SAY @91 /* Many roads lead to Lunia. Some are paved with devotion, others with penance. Lady Selûne stirred a calling within my soul and guided me to these shores. */
= @92 /* You hail from the Prime? My sister, Elisia, still sings among the glaciers of your north. The Dale of Ice. Perhaps you have been there? */
= @93 /* Ah, but I've let the conversation drift. */
IF ~~ + bfs.thalhub
END


IF ~~ bfs.thalhub
SAY @94 /* Is there aught you want to ask? */
++ @85 /* Let me see what you've gathered. */ DO ~StartStore("BFELF",LastTalkedToBy())~ EXIT
+ ~Global("bfsaskedaboutharp","LOCALS",0)~ + @86 /* A harp bow? That's... unusual. */ DO ~SetGlobal("bfsaskedaboutharp","LOCALS",1)~ + bfs.thalharp
+ ~Global("bfsaskedaboutfaith","LOCALS",0)~ + @87 /* What brings you to Lunia? Are you one of the faithful? */ DO ~SetGlobal("bfsaskedaboutfaith","LOCALS",1)~ + bfs.thalfaith
++ @88 /* Farewell. */ EXIT
END
