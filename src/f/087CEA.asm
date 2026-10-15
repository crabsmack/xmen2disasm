; ---------------------------------------------------------------------------
; sub_087CEA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_087CEA:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$A0,d7
	tst.b	-$38DE(a5)
	beq.s	loc_087D02
	lsl.w	#$1,d7
loc_087D02:
	move.l	-$3C44(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$8C,d0
	bge.s	loc_087D2A
	ext.l	d7
	add.l	d7,-$3C44(a5)
	clr.w	$6C(a4)
	lea.l	sub_087CEA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_087DA6
loc_087D2A:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_087D94
	ori.b	#$4,$2E(a3)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#-$10,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	lea.l	$14DA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$3AFA(a5)	; -> sub_13EFA0
	moveq	#$30,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$73,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$73,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$24(a7),a7
loc_087D94:
	clr.w	$6C(a4)
	lea.l	sub_087DB0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_087DA6:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
