; ---------------------------------------------------------------------------
; sub_098FB6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_098FB6:
	link.w	a6,#$0
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$433A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C3E(a5)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$1542(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	movea.l	-$3B1C(a5),a0
	move.w	d0,$4(a0)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$37B2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$1A84(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3662(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$1A88(a5)
	jsr	$2E8A(a5)	; -> sub_1190D6
	unlk	a6
	rts
