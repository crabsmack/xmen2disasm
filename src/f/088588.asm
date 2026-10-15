; ---------------------------------------------------------------------------
; sub_088588	[link-after-rts]
; ---------------------------------------------------------------------------
sub_088588:
	link.w	a6,#$0
	move.l	d7,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$155A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3B04(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$1562(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3B08(a5)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$1552(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C4C(a5)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$1542(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,d7
	move.w	-$3B08(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	-$3B1C(a5),-(a7)
	jsr	$3B52(a5)	; -> sub_13F486
	ext.l	d7
	move.l	d7,-(a7)
	move.l	-$3B14(a5),-(a7)
	jsr	$3B52(a5)	; -> sub_13F486
	move.l	-$4(a6),d7
	unlk	a6
	rts
