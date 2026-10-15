; ---------------------------------------------------------------------------
; MagnetoBoss_StateIntroWait2 - MAGNETOBOSS intro: wait for the shake to end, then 50 frames
; In:  8(a6) = this
; Out: none
; Evidence: next MagnetoBoss_StateIntroShake3
; ---------------------------------------------------------------------------
MagnetoBoss_StateIntroWait2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	g_CamShake(a5)
	bne.s	loc_036D34
	move.w	#$32,$6C(a4)
	lea.l	MagnetoBoss_StateIntroShake3(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_036D34:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
