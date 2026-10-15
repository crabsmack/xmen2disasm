; ---------------------------------------------------------------------------
; LineSegKiller_Kill - LineSegKiller: remove the object (health ran out or explicit kill) (class slot 19, +$52)
; In:  8(a6) = this
; Out: none
; Evidence: method 19 of class descriptor $1389CA (name string "LINESEGKILLER", parent ACTOR)
; ---------------------------------------------------------------------------
LineSegKiller_Kill:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$8C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	pea.l	($3E9).w
	jsr	LineSegKiller_RemoveSegsInBox(pc)
	move.l	a4,-(a7)
	lea.l	$391A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
