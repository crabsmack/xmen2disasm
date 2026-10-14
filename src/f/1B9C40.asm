; ---------------------------------------------------------------------------
; sub_1B9C40	[jt 2236]
; ---------------------------------------------------------------------------
sub_1B9C40:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$9D(a4)
	bne.s	loc_1B9C68
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1B9C76
loc_1B9C68:
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1B9C76:
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1B9C96
	move.b	#$F,$71(a4)
	lea.l	$4592(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	bra.s	loc_1B9CAC
loc_1B9C96:
	move.b	#$D,$71(a4)
	lea.l	$458A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
loc_1B9CAC:
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	move.w	#$FF,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
