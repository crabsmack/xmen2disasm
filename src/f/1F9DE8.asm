; ---------------------------------------------------------------------------
; sub_1F9DE8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F9DE8:
	link.w	a6,#$0
	movea.l	g_DemoInput(a5),a0
	moveq	#$0,d0
	move.b	(a0),d0
	move.w	#$FF,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	move.w	-$3A22(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.w	-$3A24(a5),d0
	ext.l	d0
	cmp.l	d0,d1
	bne.s	loc_1F9E42
	move.l	a0,d0
	addq.l	#$1,g_DemoInput(a5)
	movea.l	g_DemoInput(a5),a0
	addq.l	#$1,g_DemoInput(a5)
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,g_DemoPad(a5)
	move.w	-$3A24(a5),-$3A22(a5)
	moveq	#-$1,d0
	cmp.w	g_DemoPad(a5),d0
	bne.s	loc_1F9E42
	clr.w	g_DemoPad(a5)
	moveq	#$2,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> sub_1F944E
	addq.w	#$4,a7
loc_1F9E42:
	unlk	a6
	rts
