; ---------------------------------------------------------------------------
; sub_087FEA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_087FEA:
	link.w	a6,#$FFF0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	-$10(a6)
	jsr	$4DB2(a5)	; -> sub_1F4900
	move.w	-$348E(a5),d0
	add.w	#$1E0,d0
	move.w	d0,-$E(a6)
	move.w	#$660,-$C(a6)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$10(a6)
	jsr	$1A42(a5)	; -> sub_09AD96
	move.b	#$1,-$3894(a5)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$14(a6),a4
	unlk	a6
	rts
