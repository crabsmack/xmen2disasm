; ---------------------------------------------------------------------------
; SmallBrood_StateWaitCooldown - SMALLBROOD state: idle animation until the cooldown +$B0 is 0, then reload it from +$AE and run the next step
; In:  8(a6) = this
; Out: none
; Evidence: +$B0 counts down in SmallBrood_Update; +$AE from spawn param +$C (default $5A)
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateWaitCooldown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$11E2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	tst.w	$B0(a4)
	addq.w	#$8,a7
	bne.s	loc_0849EC
	move.w	$AE(a4),$B0(a4)
	tst.l	$98(a4)
	bne.s	loc_0849C0
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0849EC
loc_0849C0:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0849D4
	clr.w	$96(a4)
loc_0849D4:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0849EC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
