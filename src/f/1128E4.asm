; ---------------------------------------------------------------------------
; Deathbird_StateSendHornets	[link-after-rts]
; ---------------------------------------------------------------------------
Deathbird_StateSendHornets:
	link.w	a6,#$FFEA
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	g_Elevator(a5),a0
	cmpi.l	#$10000,$4(a0)
	bge.w	loc_1129E8
	subq.w	#$1,-$3BBE(a5)
	tst.w	-$3BBE(a5)
	bgt.w	loc_1129D4
	move.l	$383C(a5),-(a7)
	jsr	$40DA(a5)	; -> sub_15EA78
	moveq	#$2,d1
	cmp.l	d0,d1
	addq.w	#$4,a7
	ble.w	loc_1129D4
	lea.l	-$16(a6),a0
	move.l	a0,-$6(a6)
	movea.l	-$3B1C(a5),a3
	move.b	(a3),-$1(a6)
	move.b	$1(a3),d4
	move.b	$2(a3),d5
	move.b	$3(a3),d7
	move.l	#$F000,d7
	move.w	g_CameraY(a5),d0
	ext.l	d0
	moveq	#$14,d1
	sub.l	d1,d0
	move.l	d0,d6
	lsl.l	#$8,d6
	tst.b	d4
	bne.s	loc_11295A
	subi.l	#$8200,d7
	bra.s	loc_112960
loc_11295A:
	addi.l	#$8200,d7
loc_112960:
	move.l	d7,d0
	asr.l	#$8,d0
	movea.l	-$6(a6),a0
	move.w	d0,$2(a0)
	move.l	d6,d0
	asr.l	#$8,d0
	movea.l	-$6(a6),a0
	move.w	d0,$4(a0)
	movea.l	-$6(a6),a0
	clr.w	$6(a0)
	movea.l	-$6(a6),a0
	clr.w	$8(a0)
	movea.l	-$6(a6),a0
	clr.w	$A(a0)
	movea.l	-$6(a6),a0
	clr.w	$C(a0)
	movea.l	-$6(a6),a0
	clr.w	$E(a0)
	move.b	-$1(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	-$6(a6),-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	jsr	$3832(a5)	; -> sub_137142
	ext.w	d5
	move.w	d5,-$3BBE(a5)
	addq.w	#$4,a3
	moveq	#-$1,d0
	cmp.b	(a3),d0
	lea.l	$10(a7),a7
	bne.s	loc_1129D0
	lea.l	$2B12(a5),a0
	movea.l	$2(a0),a3
loc_1129D0:
	move.l	a3,-$3B1C(a5)
loc_1129D4:
	clr.w	$6C(a4)
	lea.l	Deathbird_StateSendHornets(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112A24
loc_1129E8:
	move.w	#$A,$6E(a4)
	moveq	#$3E,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$3C,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$3D,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$3D,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	Deathbird_StateChooseAttack(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_112A24:
	movem.l	-$2E(a6),d4-d7/a3-a4
	unlk	a6
	rts
