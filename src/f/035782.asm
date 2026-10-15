; ---------------------------------------------------------------------------
; AvalonA4_LoadLevel - load the AvalonA4 (Throne Room) level and start music 7
; In:  none
; Out: none
; Evidence: Level_Load level load (class list jt $34D10); Snd calls with 7; -$3298/-$3296 = $7F/$A0
; ---------------------------------------------------------------------------
AvalonA4_LoadLevel:
	link.w	a6,#$0
	lea.l	$712(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$30,d0
	move.l	d0,-(a7)
	moveq	#$F,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$702(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$6FA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$6FA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$70A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$70A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	moveq	#$7,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$7,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	clr.w	g_PalBase(a5)
	clr.b	g_TwoPlayerStep(a5)
	move.w	#$7F,g_BgScrollFactorY(a5)
	move.w	#$A0,g_BgScrollFactorX(a5)
	unlk	a6
	rts
