; ---------------------------------------------------------------------------
; SentinelsB2_LoadLevel - SentinelsB2: load the stage, start music $60 if flagged, set the alarm palette base colours
; In:  none
; Out: none
; Evidence: Level_Load with thunks $0ED120/$0DACA6/$0DA60E/$0DB702; Snd_Play($60); $FFC5A2 bit 15; colour words $FFC884-$FFC8DE
; ---------------------------------------------------------------------------
SentinelsB2_LoadLevel:
	link.w	a6,#$0
	lea.l	$23CA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$23BA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23C2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23C2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2922(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2922(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	jsr	SentinelsB2_CallStubs(pc)
	move.w	-$3C5E(a5),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	lea.l	$40(a7),a7
	beq.s	loc_0F4BB0
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$60,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$60,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_0F4BB0:
	ori.w	#$8000,-$3C5E(a5)
	clr.l	g_PalBase(a5)
	move.w	#$2,g_PalBase+$4(a5)
	move.w	#$4,g_PalBase+$6(a5)
	move.w	#$6,g_PalBase+$8(a5)
	move.w	#$8,g_PalBase+$A(a5)
	move.w	#$A,g_PalBase+$C(a5)
	clr.w	g_PalBase+$E(a5)
	move.w	#$2,g_PalBase+$10(a5)
	move.w	#$4,g_PalBase+$12(a5)
	move.w	#$6,g_PalBase+$14(a5)
	move.w	#$8E,g_PalBase+$18(a5)
	move.w	#$4A,g_PalBase+$1A(a5)
	move.w	#$6E,g_PalBase+$1C(a5)
	move.w	#$2E,g_PalBase+$1E(a5)
	clr.w	g_PalBase+$42(a5)
	move.w	#$2,g_PalBase+$44(a5)
	move.w	#$4,g_PalBase+$46(a5)
	move.w	#$6,g_PalBase+$48(a5)
	move.w	#$8,g_PalBase+$4A(a5)
	move.w	#$A,g_PalBase+$4C(a5)
	move.w	#$A,g_PalBase+$4E(a5)
	move.w	#$C,g_PalBase+$50(a5)
	move.w	#$E,g_PalBase+$52(a5)
	move.w	#$6,g_PalBase+$54(a5)
	move.w	#$8,g_PalBase+$56(a5)
	move.w	#$A,g_PalBase+$58(a5)
	move.w	#$C,g_PalBase+$5A(a5)
	move.w	#$4,g_PalBase+$5C(a5)
	move.w	#$E,g_PalBase+$5E(a5)
	move.w	#$C0,-$3498(a5)
	move.w	#$80,-$3496(a5)
	clr.b	g_TwoPlayerStep(a5)
	unlk	a6
	rts
