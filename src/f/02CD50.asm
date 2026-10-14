; ---------------------------------------------------------------------------
; sub_02CD50	[jt 189]
; ---------------------------------------------------------------------------
sub_02CD50:
	link.w	a6,#$FFC8
	movem.l	a3-a4,-(a7)
	lea.l	-$38(a6),a3
	lea.l	-$1C(a6),a4
	jsr	sub_02CD48(pc)
	jsr	sub_02CAF0(pc)
	jsr	sub_02CBA8(pc)
	jsr	sub_02CBD0(pc)
	jsr	sub_02CD38(pc)
	jsr	sub_02C902(pc)
	jsr	sub_02CC5C(pc)
	jsr	sub_02CD30(pc)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	sub_02CBF6(pc)
	jsr	$5002(a5)	; -> sub_1FA6FE
	movem.l	-$40(a6),a3-a4
	unlk	a6
	rts
