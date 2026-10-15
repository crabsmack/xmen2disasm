; ---------------------------------------------------------------------------
; XClone_KillAndCount - kill a clone and count it (g_CloneMakerKills += 1)
; In:  8(a6) = object
; Out: d0 = old count
; Evidence: slot +$52 Kill then increments g_CloneMakerKills, which EvilMaker_StateWaitKills compares with 2; jt 792
; Found: jt 792
; ---------------------------------------------------------------------------
XClone_KillAndCount:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	move.w	g_CloneMakerKills(a5),d0
	addq.w	#$1,g_CloneMakerKills(a5)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
