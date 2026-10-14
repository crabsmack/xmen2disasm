; ---------------------------------------------------------------------------
; sub_1CF7FA	[jt 2338]
; ---------------------------------------------------------------------------
sub_1CF7FA:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	a3,-(a7)
	lea.l	$2BC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	moveq	#$3,d7
	movea.l	$BC(a3),a4
	addq.w	#$4,a7
	bra.s	loc_1CF83C
loc_1CF824:
	moveq	#-$1,d0
	cmp.b	$E(a4),d0
	beq.s	loc_1CF836
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	sub_1CF432(pc)
	addq.w	#$8,a7
loc_1CF836:
	subq.w	#$1,d7
	lea.l	$10(a4),a4
loc_1CF83C:
	tst.w	d7
	bne.s	loc_1CF824
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
