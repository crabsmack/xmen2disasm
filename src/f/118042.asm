; ---------------------------------------------------------------------------
; Explosion_ResetAll - clear the 10 explosion slots at $FFE4C0 (14 bytes each)
; In:  none
; Out: d0
; Evidence: timer pointer +6 and damage +$C zeroed; TAS 8-49127 (scene starts)
; ---------------------------------------------------------------------------
Explosion_ResetAll:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	-$1D40(a5),a3
	lea.l	(a3),a4
	clr.w	d7
	moveq	#$A,d3
loc_118054:
	moveq	#$0,d0
	move.l	d0,$6(a4)
	clr.w	$C(a4)
	lea.l	$E(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_118054
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
