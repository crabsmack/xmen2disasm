; ---------------------------------------------------------------------------
; XPlayer_SetWalkAnim - choose the walk or run animation by speed
; In:  8(a6) = player, $C(a6) = slow animation, $10(a6) = fast animation
; Out: none
; Evidence: |vx| < char +$20 -> face vx and Obj_ChangeAnim(slow), else Obj_ChangeAnim(fast)
; ---------------------------------------------------------------------------
XPlayer_SetWalkAnim:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F32EE
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_1F32F6
loc_1F32EE:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_1F32F6:
	movea.l	$8C(a4),a0
	move.w	$20(a0),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.s	loc_1F3312
	move.l	$10(a6),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.s	loc_1F3338
loc_1F3312:
	tst.w	$16(a4)
	ble.s	loc_1F3320
	andi.b	#$EF,$2E(a4)
	bra.s	loc_1F332C
loc_1F3320:
	tst.w	$16(a4)
	bge.s	loc_1F332C
	ori.b	#$10,$2E(a4)
loc_1F332C:
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
loc_1F3338:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
