; ---------------------------------------------------------------------------
; MagnetoBoss_StateIntroShake2 - MAGNETOBOSS intro: second shake (jt $95A) and wall crack
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next MagnetoBoss_StateIntroWait2
; ---------------------------------------------------------------------------
MagnetoBoss_StateIntroShake2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$75A(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$A,d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	MagnetoBoss_CrackWall(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_StateIntroWait2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
