; ---------------------------------------------------------------------------
; sub_1364CA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1364CA:
	link.w	a6,#$FFF8
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$AC(a4),d5
	move.w	$AE(a4),d0
	ext.l	d0
	ext.l	d5
	move.l	d0,d7
	add.l	d5,d7
	move.w	$AA(a4),d6
	tst.w	d5
	blt.s	loc_136502
	tst.w	d7
	ble.s	loc_136518
	move.w	$AC(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$AC(a4)
	clr.w	d7
	bra.s	loc_136518
loc_136502:
	cmpi.w	#$FF4C,d7
	bge.s	loc_136518
	move.w	$AC(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$AC(a4)
	move.w	#$FF4C,d7
loc_136518:
	move.w	d7,$AE(a4)
	move.w	$10(a4),d0
	ext.l	d0
	move.w	$B0(a4),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$8,d1
	ext.l	d6
	move.l	d1,-$4(a6)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$5172(a5)	; -> sub_1FDEEA
	move.l	d0,d1
	move.l	d6,d0
	jsr	$3F9A(a5)	; -> sub_15C1FC
	asr.l	#$8,d0
	move.l	-$4(a6),d1
	add.l	d1,d0
	move.l	d0,$8(a4)
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	ext.l	d6
	move.l	d0,-$8(a6)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$517A(a5)	; -> sub_1FDEF8
	move.l	d0,d1
	move.l	d6,d0
	jsr	$3F9A(a5)	; -> sub_15C1FC
	moveq	#$9,d1
	asr.l	d1,d0
	move.l	-$8(a6),d1
	add.l	d1,d0
	move.l	d0,$C(a4)
	movem.l	-$18(a6),d5-d7/a4
	unlk	a6
	rts
