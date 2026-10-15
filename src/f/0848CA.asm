; ---------------------------------------------------------------------------
; SmallBrood_ActApproach - SMALLBROOD script action: walk towards the nearest player unless already at its preferred distance +$AC
; In:  8(a6) = this
; Out: d0
; Evidence: Player_Nearest; |dx| outside +$AC +-4: face the player, vx = +-(+$A6), walk animation, state SmallBrood_StateApproach; else SmallBrood_StateWaitCooldown; jt 590; TAS 46600-55215
; Found: jt 590
; ---------------------------------------------------------------------------
SmallBrood_ActApproach:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a4),d0
	sub.l	$8(a3),d0
	move.l	d0,d7
	asr.l	#$8,d7
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0848F8
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_0848FE
loc_0848F8:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_0848FE:
	move.w	d0,d7
	ext.l	d7
	move.w	$AC(a4),d0
	ext.l	d0
	subq.l	#$4,d0
	cmp.l	d7,d0
	addq.w	#$4,a7
	bgt.s	loc_084932
	ext.l	d7
	move.w	$AC(a4),d0
	ext.l	d0
	addq.l	#$4,d0
	cmp.l	d7,d0
	blt.s	loc_084932
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateWaitCooldown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_08497E
loc_084932:
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_084950
	ori.b	#$10,$2E(a4)
	move.w	$A6(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.s	loc_08495C
loc_084950:
	andi.b	#$EF,$2E(a4)
	move.w	$A6(a4),$16(a4)
loc_08495C:
	lea.l	$11EA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateApproach(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_08497E:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
