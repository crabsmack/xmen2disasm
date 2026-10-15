; ---------------------------------------------------------------------------
; sub_0377D6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0377D6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.w	#$750,g_CameraX(a5)
	blt.s	loc_037814
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	pea.l	($B0).w
	pea.l	($750).w
	moveq	#$5,d1
	move.l	d1,-(a7)
	jsr	$72A(a5)	; -> sub_0358D8
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_03781C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_037814:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
