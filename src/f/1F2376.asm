; ---------------------------------------------------------------------------
; sub_1F2376	[jt 2444]
; ---------------------------------------------------------------------------
sub_1F2376:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	-$35B6(a5),-(a7)
	jsr	$3EAA(a5)	; -> sub_159FB8
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	move.l	a4,-(a7)
	jsr	$4EE2(a5)	; -> sub_1F6EC4
	moveq	#$0,d0
	move.b	$42(a4),d0
	tst.l	d0
	lea.l	$C(a7),a7
	bls.s	loc_1F23AE
	subq.b	#$1,$42(a4)
	addi.l	#$2500,$C(a4)
loc_1F23AE:
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	move.b	#$1,-$3892(a5)
	ori.l	#$8,$90(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	movea.l	$8C(a4),a0
	moveq	#$0,d1
	move.b	$2D(a0),d1
	cmpi.w	#$FF,d1
	addq.w	#$4,a7
	beq.s	loc_1F23FC
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2D(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2D(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_1F23FC:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$29(a0),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
