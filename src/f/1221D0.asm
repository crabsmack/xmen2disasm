; ---------------------------------------------------------------------------
; BigBio_StateStartMorph - BIGBIO: set shape Tbl_BigBioOrbShape (jt $3492), jump to the arena side and morph
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: +$B0 arena left; next StateMorphToShape
; ---------------------------------------------------------------------------
BigBio_StateStartMorph:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$8,$A2(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$3492(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	BigBio_SetOrbShape(pc)
	tst.b	$B6(a4)
	lea.l	$10(a7),a7
	beq.s	loc_12221A
	move.w	$B0(a4),d0
	ext.l	d0
	add.l	#$15E,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	bra.s	loc_12222A
loc_12221A:
	move.w	$B0(a4),d0
	ext.l	d0
	moveq	#$32,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
loc_12222A:
	clr.w	$6C(a4)
	lea.l	BigBio_StateMorphToShape(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
