; ---------------------------------------------------------------------------
; sub_07746A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_07746A:
	link.w	a6,#$0
	jsr	sub_077462(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$10A2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AA8(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E0A(a5)	; -> sub_1F5500
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.w	-$3AA8(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> sub_1F553C
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	moveq	#$10,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$10A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	-$3582(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.w	-$3AA8(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E0A(a5)	; -> sub_1F5500
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	-$3AA8(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> sub_1F553C
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$10A2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$356E(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	unlk	a6
	rts
