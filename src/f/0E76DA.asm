; ---------------------------------------------------------------------------
; SentinelsA1_StepZapLights - SentinelsA1: every 4 frames advance each active light through frames 0-7; each light starts when the previous reaches frame 4
; In:  none
; Out: none
; Evidence: Spr_SetFrame/sub_1FAD44 on $FFCC6A..$FFCCBA; timer $FFC6E8; chained counters $FFC6FE..$FFC6F6
; ---------------------------------------------------------------------------
SentinelsA1_StepZapLights:
	link.w	a6,#$0
	move.l	a4,-(a7)
	lea.l	-$3596(a5),a4
	tst.l	-$3B18(a5)
	bgt.w	loc_0E7856
	moveq	#$4,d0
	move.l	d0,-$3B18(a5)
	tst.w	-$3B02(a5)
	blt.s	loc_0E772A
	move.w	-$3B02(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	move.w	-$3B02(a5),d0
	addq.w	#$1,-$3B02(a5)
	moveq	#$7,d0
	cmp.w	-$3B02(a5),d0
	lea.l	$10(a7),a7
	bge.s	loc_0E772A
	move.w	#$FFFF,-$3B02(a5)
loc_0E772A:
	lea.l	$14(a4),a4
	tst.w	-$3B04(a5)
	blt.s	loc_0E7768
	move.w	-$3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	move.w	-$3B04(a5),d0
	addq.w	#$1,-$3B04(a5)
	moveq	#$7,d0
	cmp.w	-$3B04(a5),d0
	lea.l	$10(a7),a7
	bge.s	loc_0E7774
	move.w	#$FFFF,-$3B04(a5)
	bra.s	loc_0E7774
loc_0E7768:
	moveq	#$4,d0
	cmp.w	-$3B02(a5),d0
	bne.s	loc_0E7774
	clr.w	-$3B04(a5)
loc_0E7774:
	lea.l	$14(a4),a4
	tst.w	-$3B06(a5)
	blt.s	loc_0E77B2
	move.w	-$3B06(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	move.w	-$3B06(a5),d0
	addq.w	#$1,-$3B06(a5)
	moveq	#$7,d0
	cmp.w	-$3B06(a5),d0
	lea.l	$10(a7),a7
	bge.s	loc_0E77BE
	move.w	#$FFFF,-$3B06(a5)
	bra.s	loc_0E77BE
loc_0E77B2:
	moveq	#$4,d0
	cmp.w	-$3B04(a5),d0
	bne.s	loc_0E77BE
	clr.w	-$3B06(a5)
loc_0E77BE:
	lea.l	$14(a4),a4
	tst.w	-$3B08(a5)
	blt.s	loc_0E77FC
	move.w	-$3B08(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	move.w	-$3B08(a5),d0
	addq.w	#$1,-$3B08(a5)
	moveq	#$7,d0
	cmp.w	-$3B08(a5),d0
	lea.l	$10(a7),a7
	bge.s	loc_0E7808
	move.w	#$FFFF,-$3B08(a5)
	bra.s	loc_0E7808
loc_0E77FC:
	moveq	#$4,d0
	cmp.w	-$3B06(a5),d0
	bne.s	loc_0E7808
	clr.w	-$3B08(a5)
loc_0E7808:
	lea.l	$14(a4),a4
	tst.w	-$3B0A(a5)
	blt.s	loc_0E7846
	move.w	-$3B0A(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	move.w	-$3B0A(a5),d0
	addq.w	#$1,-$3B0A(a5)
	moveq	#$7,d0
	cmp.w	-$3B0A(a5),d0
	lea.l	$10(a7),a7
	bge.s	loc_0E7852
	move.w	#$FFFF,-$3B0A(a5)
	bra.s	loc_0E7852
loc_0E7846:
	moveq	#$4,d0
	cmp.w	-$3B08(a5),d0
	bne.s	loc_0E7852
	clr.w	-$3B0A(a5)
loc_0E7852:
	lea.l	$14(a4),a4
loc_0E7856:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
