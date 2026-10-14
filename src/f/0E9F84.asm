; ---------------------------------------------------------------------------
; sub_0E9F84	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E9F84:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9A(a4),-(a7)
	jsr	$28C2(a5)	; -> sub_0EC740
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0E9FB8
	move.l	$9A(a4),-(a7)
	jsr	$28D2(a5)	; -> sub_0EC7D6
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_0E9FC0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0E9FB8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
