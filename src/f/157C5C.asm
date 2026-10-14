; ---------------------------------------------------------------------------
; sub_157C5C	[jt 1974]
; ---------------------------------------------------------------------------
sub_157C5C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	lea.l	-$1952(a5),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	beq.s	loc_157C80
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_157C80:
	move.l	$C(a6),(a4)
	move.l	$18(a6),-(a7)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	move.l	a4,d0
	lea.l	$14(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
