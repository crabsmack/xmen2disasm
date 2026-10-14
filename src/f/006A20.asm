; ---------------------------------------------------------------------------
; sub_006A20	[link-after-rts]
; ---------------------------------------------------------------------------
sub_006A20:
	link.w	a6,#$FFEC
	move.w	-$3598(a5),-$3BB8(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$3598(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	lea.l	$2C82(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	-$3598(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$505A(a5)	; -> sub_1FAD08
	move.w	d0,-$3598(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$3598(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$423A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$185C(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,-$3598(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$3598(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$3D92(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$1A68(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,-$3598(a5)
	unlk	a6
	rts
