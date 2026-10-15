; ---------------------------------------------------------------------------
; MagnetoBoss_StateIntroWait1 - MAGNETOBOSS intro: wait for the shake to end, then 60 frames
; In:  8(a6) = this
; Out: none
; Evidence: g_CamShake == 0; next MagnetoBoss_StateIntroShake2
; ---------------------------------------------------------------------------
MagnetoBoss_StateIntroWait1:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	g_CamShake(a5)
	bne.s	loc_036CC2
	move.w	#$3C,$6C(a4)
	lea.l	MagnetoBoss_StateIntroShake2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_036CC2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
