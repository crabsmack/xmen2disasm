; ---------------------------------------------------------------------------
; Nightcrawler_StateWallCling_Ret - shared epilogue of Nightcrawler_StateWallCling (restore registers and return)
; In:  a6 frame of Nightcrawler_StateWallCling
; Out: d0 as set by the caller
; Evidence: movem.l -$14(a6) / unlk / rts; branch target from three exits of Nightcrawler_StateWallCling
; ---------------------------------------------------------------------------
Nightcrawler_StateWallCling_Ret:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
