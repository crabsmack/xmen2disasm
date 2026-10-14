; ---------------------------------------------------------------------------
; sub_0BCC96	[jt 1024]
; ---------------------------------------------------------------------------
sub_0BCC96:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$207A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	jsr	sub_0BD274(pc)
	ori.w	#$83,$6(a4)
	movea.l	-$3B14(a5),a0
	move.b	#$4,$2(a0)
	movea.l	-$3B14(a5),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	$1E3A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	lea.l	sub_0BCE0E(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_0BCE0E(pc),a0
	move.l	a0,$64(a4)
	lea.l	$359A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$AE(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$B0(a4)
	moveq	#$60,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> sub_1F4A40
	movea.l	-$4(a6),a4
	unlk	a6
	rts
