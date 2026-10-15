; ---------------------------------------------------------------------------
; sub_15CAA4	[jt 2034]
; ---------------------------------------------------------------------------
sub_15CAA4:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$1666(a5)
	tst.b	-$1FD7(a5)
	beq.s	loc_15CB30
	tst.b	-$3A02(a5)
	bne.s	loc_15CB30
	tst.w	-$16F0(a5)
	bgt.s	loc_15CAC6
	tst.w	-$17E0(a5)
	ble.s	loc_15CB30
loc_15CAC6:
	move.w	#$80,d0
	and.w	-$3A26(a5),d0
	beq.s	loc_15CAE2
	tst.w	-$16F0(a5)
	bgt.s	loc_15CAE2
	tst.w	g_P1Lives(a5)
	beq.s	loc_15CB30
	jsr	$4A(a5)	; -> Player1_StartLife
	bra.s	loc_15CB30
loc_15CAE2:
	move.w	#$80,d0
	and.w	-$3A28(a5),d0
	beq.s	loc_15CAFE
	tst.w	-$17E0(a5)
	bgt.s	loc_15CAFE
	tst.w	g_P2Lives(a5)
	beq.s	loc_15CB30
	jsr	$52(a5)	; -> Player2_StartLife
	bra.s	loc_15CB30
loc_15CAFE:
	clr.b	-$1662(a5)
	move.b	#$1,-$1668(a5)
	move.w	#$FF7F,d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	jsr	$5232(a5)	; -> Snd_Pause
	jsr	sub_15C306(pc)
	jsr	sub_15C32E(pc)
	jsr	sub_15C39A(pc)
	jsr	sub_15CA6C(pc)
	jsr	sub_15C41C(pc)
	jsr	$523A(a5)	; -> Snd_Resume
loc_15CB30:
	unlk	a6
	rts
