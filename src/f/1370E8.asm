; ---------------------------------------------------------------------------
; sub_1370E8	[jt 1793]
; ---------------------------------------------------------------------------
sub_1370E8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	moveq	#$3,d0
	cmp.w	$9E(a4),d0
	lea.l	$C(a7),a7
	bne.s	loc_137124
	pea.l	($202).w
	move.l	a4,-(a7)
	jsr	$3AC2(a5)	; -> sub_13DCB8
	addq.w	#$8,a7
	bra.s	loc_13713A
loc_137124:
	move.l	a4,-(a7)
	lea.l	$383A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_13713A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
