; ---------------------------------------------------------------------------
; ThronePhone_StateInit - THRONEPHONE first state: remember the Magneto boss object (g_BgLockObj), then wait for it
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$8C = g_BgLockObj; next ThronePhone_StateWaitMagneto
; ---------------------------------------------------------------------------
ThronePhone_StateInit:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	g_BgLockObj(a5),$8C(a4)
	clr.w	$6C(a4)
	lea.l	ThronePhone_StateWaitMagneto(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
