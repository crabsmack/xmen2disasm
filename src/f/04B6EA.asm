; ---------------------------------------------------------------------------
; sub_04B6EA	[jt 332]
; ---------------------------------------------------------------------------
sub_04B6EA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$9FA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$A4(a4)
	bne.s	loc_04B716
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_04B732
loc_04B716:
	clr.w	$A2(a4)
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_04B732:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
