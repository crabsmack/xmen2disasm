; ---------------------------------------------------------------------------
; sub_0B6B2A	[jt 925]
; ---------------------------------------------------------------------------
sub_0B6B2A:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$1D7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$1D7A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_0B6B8A
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0B6B72
	ori.b	#$10,$2E(a3)
loc_0B6B72:
	move.w	#$14,$6A(a3)
	pea.l	($140).w
	pea.l	($8A).w
	move.l	a3,-(a7)
	jsr	sub_0B689A(pc)
	lea.l	$C(a7),a7
loc_0B6B8A:
	pea.l	($F2).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($F2).w
	jsr	$521A(a5)	; -> sub_1FE584
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
