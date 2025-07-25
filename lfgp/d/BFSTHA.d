BEGIN BFSTHA

/* sea elf merchant */
IF ~True()~ THEN BEGIN BFS.LuniaMerchant
SAY ~Wares from the Silver Sea! Treasures and trinkets cast ashore by the tides!~ [SIRIN05]
++ ~Let me see what you've gathered.~ DO ~StartStore("BFELF",LastTalkedToBy())~ EXIT
+ ~Global("bfsaskedaboutharp","LOCALS",0)~ + ~A harp bow? That's... unusual.~ DO ~SetGlobal("bfsaskedaboutharp","LOCALS",1)~ + bfs.thalharp
+ ~Global("bfsaskedaboutfaith","LOCALS",0)~ + ~What brings you to Lunia? Are you one of the faithful?~ DO ~SetGlobal("bfsaskedaboutfaith","LOCALS",1)~ + bfs.thalfaith
++ ~Farewell.~ EXIT
END

IF ~~ bfs.thalharp
SAY ~A deva offered it to me in exchange for a shell. One that echoed with the deepest song of the seas.~
= ~Judge its worth if you've any interest in procuring it.~
IF ~~ + bfs.thalhub
END

IF ~~ bfs.thalfaith
SAY ~Many roads lead to Lunia. Some are paved with devotion, others with penance. Lady Selûne stirred a calling within my soul and guided me to these shores.~
= ~You hail from the Prime? My sister, Elisia, still sings among the glaciers of your north. The Dale of Ice. Perhaps you have been there?~
= ~Ah, but I've let the conversation drift.~
IF ~~ + bfs.thalhub
END


IF ~~ bfs.thalhub
SAY ~Is there aught you want to ask?~
++ ~Let me see what you've gathered.~ DO ~StartStore("BFELF",LastTalkedToBy())~ EXIT
+ ~Global("bfsaskedaboutharp","LOCALS",0)~ + ~A harp bow? That's... unusual.~ DO ~SetGlobal("bfsaskedaboutharp","LOCALS",1)~ + bfs.thalharp
+ ~Global("bfsaskedaboutfaith","LOCALS",0)~ + ~What brings you to Lunia? Are you one of the faithful?~ DO ~SetGlobal("bfsaskedaboutfaith","LOCALS",1)~ + bfs.thalfaith
++ ~Farewell.~ EXIT
END
