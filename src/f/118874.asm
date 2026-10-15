; ---------------------------------------------------------------------------
; ICandy_SetAnim - ICandy: start an animation record (pointer at +$32, step 0, frame byte +$1D from record +7)
; In:  8(a6) = this  $C(a6) = animation record
; Out: none
; Evidence: fields match ICandy_Update's animation stepping; callers in BROODBOSS code ($085FD8, $087370)
; ---------------------------------------------------------------------------
ICandy_SetAnim:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),$32(a4)
	clr.l	$36(a4)
	move.w	$36(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$32(a4),d0
	movea.l	d0,a0
	moveq	#$0,d7
	move.b	$7(a0),d7
	move.b	d7,$1D(a4)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
