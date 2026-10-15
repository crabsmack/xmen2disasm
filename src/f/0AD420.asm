; ---------------------------------------------------------------------------
; SavageA2_InitLights - SavageA2: set up the two warning-light sprites ($FFCC6A/$FFCC7E, art $0A8DC4)
; In:  none
; Out: none
; Evidence: -$3B34 := 1, -$3B3C := 0; Spr_Init x2 at VRAM -$3AB0 and +$10; jt 891
; Found: jt 891
; ---------------------------------------------------------------------------
SavageA2_InitLights:
	link.w	a6,#$0
	move.w	#$1,-$3B34(a5)
	clr.w	-$3B3C(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AB0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1ADA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AB0(a5),d1
	ext.l	d1
	moveq	#$10,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$8,d0
	move.l	d0,-(a7)
	lea.l	$1ADA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3582(a5)
	jsr	$506A(a5)	; -> Spr_Init
	unlk	a6
	rts
