; ---------------------------------------------------------------------------
; Cyclops_TakeDamage	[jt 2400]
; ---------------------------------------------------------------------------
Cyclops_TakeDamage:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BCA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	tst.l	$BE(a4)
	lea.l	$18(a7),a7
	beq.s	loc_1E3C4A
	move.l	a4,-(a7)
	jsr	Cyclops_EndBeam(pc)
	addq.w	#$4,a7
loc_1E3C4A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
