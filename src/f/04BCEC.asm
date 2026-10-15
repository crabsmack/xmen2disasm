; ---------------------------------------------------------------------------
; Apocalypse_ActPickScript_part3 - part 3 of Apocalypse_ActPickScript: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Apocalypse_ActPickScript
; Out: continues in Apocalypse_ActPickScript
; Evidence: only reached by branches from Apocalypse_ActPickScript; ends with rts
; ---------------------------------------------------------------------------
Apocalypse_ActPickScript_part3:
	tst.l	$A4(a4)
	bne.s	loc_04BCFE
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_04BD1A
loc_04BCFE:
	clr.w	$A2(a4)
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_04BD1A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
