; ---------------------------------------------------------------------------
; AvalonA3_LoadLevel - load the AvalonA3 (Exodus) level, start music 7, set the palette and raise the camera's lower limit 32 px
; In:  none
; Out: none
; Evidence: Level_Load level load; Snd calls with 7; 16 colours from jt $22BCA into $FFC8C0; g_CamMaxYTarget -= $20
; ---------------------------------------------------------------------------
AvalonA3_LoadLevel:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	$51A(a5),a0
	movea.l	$2(a0),a4
	lea.l	$51A(a5),a0
	movea.l	$2(a0),a3
	lea.l	$5EA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$44,d0
	move.l	d0,-(a7)
	moveq	#$A,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$5DA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	lea.l	$70A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$5E2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	moveq	#$7,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$7,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.b	#$1,g_HudOn(a5)
	move.w	#$7F,g_BgScrollFactorY(a5)
	move.w	#$DC,g_BgScrollFactorX(a5)
	clr.b	g_TwoPlayerStep(a5)
	lea.l	$50A(a5),a0
	movea.l	$2(a0),a3
	lea.l	g_PalBase+$40(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
	lea.l	$48(a7),a7
loc_02CB8A:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_02CB8A
	clr.w	g_PalBase(a5)
	subi.w	#$20,g_CamMaxYTarget(a5)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
