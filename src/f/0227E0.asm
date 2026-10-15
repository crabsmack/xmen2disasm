; ---------------------------------------------------------------------------
; sub_0227E0	[jt 155]
; ---------------------------------------------------------------------------
sub_0227E0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	jsr	$5242(a5)	; -> Snd_StopAll
	lea.l	$4E2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
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
	lea.l	$4D2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$A2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	clr.w	-$3496(a5)
	clr.w	-$3498(a5)
	move.b	#$1,-$38B4(a5)
	lea.l	sub_0226F4(pc),a0
	move.l	a0,-$388E(a5)
	clr.b	-$38DE(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	jsr	sub_0227D8(pc)
	jsr	sub_0227A4(pc)
	jsr	sub_022716(pc)
	pea.l	sub_0226B2(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	jsr	$2E8A(a5)	; -> sub_1190D6
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	sub_0226D0(pc)
	moveq	#$3C,d1
	move.l	d1,-(a7)
	pea.l	$3F32(a5)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	jsr	$5002(a5)	; -> sub_1FA6FE
	jsr	$5242(a5)	; -> Snd_StopAll
	movea.l	-$4(a6),a4
	unlk	a6
	rts
