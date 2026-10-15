; ---------------------------------------------------------------------------
; EvilWolverine_StateLeap - EVILWOLVERINE state: in the leap until the animation ends on the floor, then stop and run the next step
; In:  8(a6) = this
; Out: d0
; Evidence: +$44 = 0 and y >= +$A6
; Found: link-after-rts
; ---------------------------------------------------------------------------
EvilWolverine_StateLeap:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	bne.s	loc_098BDC
	move.w	$A6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	ble.s	loc_098BF0
loc_098BDC:
	clr.w	$6C(a4)
	lea.l	EvilWolverine_StateLeap(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_098C46
loc_098BF0:
	move.w	$A6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_098C1A
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_098C46
loc_098C1A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_098C2E
	clr.w	$96(a4)
loc_098C2E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_098C46:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
