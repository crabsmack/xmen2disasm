; ---------------------------------------------------------------------------
; sub_0AB30C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB30C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	-$3B5E(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_0AB336
	clr.w	$6C(a4)
	lea.l	sub_0AB41E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0AB348
loc_0AB336:
	clr.w	$6C(a4)
	lea.l	sub_0AB350(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0AB348:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
