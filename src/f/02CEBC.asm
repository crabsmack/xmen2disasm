; ---------------------------------------------------------------------------
; Exodus_NextPattern_part2 - part 2 of Exodus_NextPattern: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_NextPattern
; Out: continues in Exodus_NextPattern
; Evidence: only reached by branches from Exodus_NextPattern
; ---------------------------------------------------------------------------
Exodus_NextPattern_part2:
	tst.w	$A(a4)
	beq.s	loc_02CEC8
	move.w	$A(a4),d0
	bra.s	loc_02CECA
loc_02CEC8:
	moveq	#$4,d0
loc_02CECA:
	move.b	d0,$A8(a3)
	bra.s	Exodus_NextPattern_part3
loc_02CED0:
	tst.w	$C(a4)
	beq.s	loc_02CEDC
	move.w	$C(a4),d0
	bra.s	loc_02CEDE
loc_02CEDC:
	moveq	#$5,d0
loc_02CEDE:
	move.b	d0,$A8(a3)
	bra.s	Exodus_NextPattern_part3
loc_02CEE4:
	tst.w	$E(a4)
	beq.s	loc_02CEF0
	move.w	$E(a4),d0
	bra.s	loc_02CEF2
loc_02CEF0:
	moveq	#$1,d0
loc_02CEF2:
	move.b	d0,$A8(a3)
