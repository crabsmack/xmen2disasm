; ---------------------------------------------------------------------------
; Tuskette_StateWaitNear - TUSKETTE walker: wait until the nearest player is within +$98 px horizontally and 64 px vertically
; In:  8(a6) = this
; Out: d0
; Evidence: next Tuskette_StateWalkStart
; ---------------------------------------------------------------------------
Tuskette_StateWaitNear:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_05D17C
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	bra.s	loc_05D186
loc_05D17C:
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	neg.l	d0
loc_05D186:
	move.w	$98(a4),d1
	ext.l	d1
	lsl.l	#$8,d1
	cmp.l	d0,d1
	addq.w	#$4,a7
	ble.s	loc_05D1D0
	move.l	$C(a3),d0
	sub.l	$C(a4),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_05D1AC
	move.l	$C(a3),d0
	sub.l	$C(a4),d0
	bra.s	loc_05D1B6
loc_05D1AC:
	move.l	$C(a3),d0
	sub.l	$C(a4),d0
	neg.l	d0
loc_05D1B6:
	cmpi.l	#$4000,d0
	bge.s	loc_05D1D0
	clr.w	$6C(a4)
	lea.l	Tuskette_StateWalkStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05D1D0:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
