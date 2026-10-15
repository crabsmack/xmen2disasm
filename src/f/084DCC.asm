; ---------------------------------------------------------------------------
; SmallBrood_StateJumpFlip - SMALLBROOD state: mid-jump, mirror y about the box centre and toggle the v-flip
; In:  8(a6) = this
; Out: d0
; Evidence: y -= 2 * (y - box centre), +$2E ^= 8, animation, state SmallBrood_StateJumpUntilSurface
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateJumpFlip:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	$C(a4),d0
	sub.l	d1,d0
	move.l	d0,d7
	lsl.l	#$1,d7
	sub.l	d7,$C(a4)
	eori.b	#$8,$2E(a4)
	lea.l	$120A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	SmallBrood_StateJumpUntilSurface(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
