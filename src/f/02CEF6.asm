; ---------------------------------------------------------------------------
; Exodus_NextPattern_part3 - part 3 of Exodus_NextPattern: shared exit split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_NextPattern
; Out: continues in Exodus_NextPattern
; Evidence: only reached by branches from Exodus_NextPattern; ends with rts
; ---------------------------------------------------------------------------
Exodus_NextPattern_part3:
	clr.b	$A9(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
