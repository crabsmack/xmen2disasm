; ---------------------------------------------------------------------------
; Tuskette_StateWalkStart - TUSKETTE walker: face the player (or turn at a ledge) and walk at +$9A for up to 300 frames
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Seg_WouldLeaveEnd(this, 50) = ledge ahead; walk animation jt $E62; next Tuskette_StateWalk
; ---------------------------------------------------------------------------
Tuskette_StateWalkStart:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$32,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E62(a5)	; -> Seg_WouldLeaveEnd
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_05D1FE
	eori.b	#$10,$2E(a4)
	bra.s	loc_05D220
loc_05D1FE:
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_05D21A
	ori.b	#$10,$2E(a4)
	bra.s	loc_05D220
loc_05D21A:
	andi.b	#$EF,$2E(a4)
loc_05D220:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_05D232
	move.w	$9A(a4),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_05D238
loc_05D232:
	move.w	$9A(a4),d0
	ext.l	d0
loc_05D238:
	move.w	d0,$16(a4)
	move.w	#$12C,$6E(a4)
	lea.l	$C62(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Tuskette_StateWalk(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
