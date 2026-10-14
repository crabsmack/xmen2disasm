; ---------------------------------------------------------------------------
; sub_0E7582	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E7582:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	lea.l	$2622(a5),a0
	movea.l	$2(a0),a4
	move.w	-$3AAE(a5),d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	-$3AA8(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> sub_1F553C
	addi.w	#$10,d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3582(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	move.w	-$3AA8(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> sub_1F553C
	addi.w	#$10,d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$356E(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$3,d1
	move.l	d1,-(a7)
	move.w	-$3AA8(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> sub_1F553C
	addi.w	#$10,d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$355A(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	move.w	-$3AA8(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> sub_1F553C
	addi.w	#$10,d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3546(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$5,d1
	move.l	d1,-(a7)
	move.w	-$3AA8(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> sub_1F553C
	move.w	#$FFFF,-$3B02(a5)
	move.w	#$FFFF,-$3B04(a5)
	move.w	#$FFFF,-$3B06(a5)
	move.w	#$FFFF,-$3B08(a5)
	move.w	#$FFFF,-$3B0A(a5)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
