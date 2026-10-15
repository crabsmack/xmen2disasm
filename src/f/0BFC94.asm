; ---------------------------------------------------------------------------
; SwampBubbles_Draw_Done - SwampBubbles_Draw common exit
; Evidence: switch exit
; ---------------------------------------------------------------------------
SwampBubbles_Draw_Done:
	movem.l	-$1C(a6),d4-d7/a4
	unlk	a6
	rts
