; ---------------------------------------------------------------------------
; sub_00FDAA	[jt 19]
; ---------------------------------------------------------------------------
sub_00FDAA:
	link.w	a6,#$FFE0
	move.l	a4,-(a7)
	lea.l	-$20(a6),a4
	move.l	a4,-$3B14(a5)
	lea.l	$AA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$5C,d0
	move.l	d0,-(a7)
	moveq	#$F,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$9A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$A2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$A2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	move.b	#$1,-$38B4(a5)
	clr.w	-$3496(a5)
	clr.w	-$3498(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	jsr	sub_00FD44(pc)
	lea.l	sub_00FD78(pc),a0
	move.l	a0,-$388E(a5)
	clr.b	-$38DE(a5)
	clr.w	-$3CDC(a5)
	clr.w	-$3CE0(a5)
	clr.w	-$3CDE(a5)
	clr.w	-$3CE2(a5)
	clr.w	-$3CE6(a5)
	clr.w	-$3CE4(a5)
	jsr	sub_00FB54(pc)
	jsr	$2E8A(a5)	; -> sub_1190D6
	move.b	#$1,g_SndMute(a5)
	jsr	$5002(a5)	; -> sub_1FA6FE
	clr.b	g_SndMute(a5)
	jsr	$5242(a5)	; -> Snd_StopAll
	movea.l	-$24(a6),a4
	unlk	a6
	rts
