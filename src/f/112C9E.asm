; ---------------------------------------------------------------------------
; sub_112C9E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_112C9E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	moveq	#$3C,d1
	add.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	cmp.l	d0,d2
	bgt.s	loc_112CD6
	move.l	$8(a4),d0
	asr.l	#$8,d0
	moveq	#$3C,d1
	sub.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	add.l	#$140,d2
	cmp.l	d0,d2
	bge.s	loc_112D04
loc_112CD6:
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	move.l	$9E(a4),-(a7)
	jsr	$4FE2(a5)	; -> Timer_Stop
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_112A2E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112D16
loc_112D04:
	clr.w	$6C(a4)
	lea.l	sub_112C9E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_112D16:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
