; ---------------------------------------------------------------------------
; SmallBrood_ActJump - SMALLBROOD script action: jump from the floor to the ceiling or back
; In:  8(a6) = this
; Out: d0
; Evidence: on the floor (+$A8): vy = -$400, else vy = $400 and v-flip; animation, +$6C = $FF, state SmallBrood_StateJumpFlip; jt 594; TAS 53664-57134
; Found: jt 594
; ---------------------------------------------------------------------------
SmallBrood_ActJump:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	clr.w	$1E(a4)
	clr.w	$16(a4)
	cmp.w	$A8(a4),d7
	bne.s	loc_084D92
	andi.b	#$F7,$2E(a4)
	move.w	#$FC00,$18(a4)
	bra.s	loc_084D9E
loc_084D92:
	ori.b	#$8,$2E(a4)
	move.w	#$400,$18(a4)
loc_084D9E:
	lea.l	$1202(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	SmallBrood_StateJumpFlip(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
