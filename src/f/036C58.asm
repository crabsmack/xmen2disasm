; ---------------------------------------------------------------------------
; MagnetoBoss_StateIntroShake1 - MAGNETOBOSS intro: first screen shake and wall crack
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: g_CamShake = jt $952 script; MagnetoBoss_CrackWall(0, 1, 10, 0); next MagnetoBoss_StateIntroWait1
; ---------------------------------------------------------------------------
MagnetoBoss_StateIntroShake1:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$752(a5),a0
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
	lea.l	MagnetoBoss_StateIntroWait1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
