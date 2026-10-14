; ---------------------------------------------------------------------------
; sub_0ADB7E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0ADB7E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#-$1,d0
	cmp.w	$88(a4),d0
	bge.s	loc_0ADBA4
	move.w	$88(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F72(a5)	; -> sub_1F9122
	move.w	#$FFFF,$88(a4)
	addq.w	#$4,a7
loc_0ADBA4:
	clr.w	$6C(a4)
	lea.l	sub_0ADBBE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
