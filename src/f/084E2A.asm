; ---------------------------------------------------------------------------
; SmallBrood_StateJumpUntilSurface - SMALLBROOD state: keep moving until y reaches the floor or ceiling, then land
; In:  8(a6) = this
; Out: d0
; Evidence: y == +$A8 or +$AA -> landing animation, state SmallBrood_StateLanded
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateJumpUntilSurface:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$A8(a4),d7
	beq.s	loc_084E48
	cmp.w	$AA(a4),d7
	bne.s	loc_084E6E
loc_084E48:
	lea.l	$1212(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	SmallBrood_StateLanded(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_084E80
loc_084E6E:
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateJumpUntilSurface(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_084E80:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
