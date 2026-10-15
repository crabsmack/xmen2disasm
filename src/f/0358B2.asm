; ---------------------------------------------------------------------------
; loc_0358B2
; ---------------------------------------------------------------------------
loc_0358B2:
	tst.w	d7
	seq.b	d3
	neg.b	d3
	ext.w	d3
	and.w	d3,-$3B02(a5)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
