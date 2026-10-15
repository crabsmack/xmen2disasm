; ---------------------------------------------------------------------------
; Cerebro_SetupPalCycles - register the Cerebro screen's five palette ranges with sub_1FBE96
; In:  none
; Out: none
; Evidence: five sub_1FBE96(jt $63D7C, $6C0..$5C0, 0, first, last) calls; called by Cerebro_Run
; ---------------------------------------------------------------------------
Cerebro_SetupPalCycles:
	link.w	a6,#$0
	moveq	#$F,d0
	move.l	d0,-(a7)
	moveq	#$E,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($6C0).w
	lea.l	$E7A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$509A(a5)	; -> sub_1FBE96
	moveq	#$D,d0
	move.l	d0,-(a7)
	moveq	#$C,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($680).w
	lea.l	$E7A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$509A(a5)	; -> sub_1FBE96
	moveq	#$B,d0
	move.l	d0,-(a7)
	moveq	#$A,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($640).w
	lea.l	$E7A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$509A(a5)	; -> sub_1FBE96
	moveq	#$9,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($600).w
	lea.l	$E7A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$509A(a5)	; -> sub_1FBE96
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	($5C0).w
	lea.l	$E7A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$509A(a5)	; -> sub_1FBE96
	unlk	a6
	rts
