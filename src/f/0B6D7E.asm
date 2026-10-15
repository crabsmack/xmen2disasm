; ---------------------------------------------------------------------------
; BrainChild_StateFallHome - BRAINCHILD leap: fall until reaching its home y (+$12)
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
BrainChild_StateFallHome:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	bgt.s	loc_0B6DBA
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	BrainChild_StateLand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0B6DCC
loc_0B6DBA:
	clr.w	$6C(a4)
	lea.l	BrainChild_StateFallHome(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B6DCC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
