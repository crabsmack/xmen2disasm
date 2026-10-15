; ---------------------------------------------------------------------------
; sub_1F6BD2	[jt 2517]
; ---------------------------------------------------------------------------
sub_1F6BD2:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	lea.l	g_Segs(a5),a4
	clr.w	d7
	move.w	#$FF,d3
loc_1F6BE4:
	clr.b	(a4)
	lea.l	$14(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F6BE4
	clr.w	g_SegFirstFree(a5)
	clr.w	-$3472(a5)
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
