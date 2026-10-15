; ---------------------------------------------------------------------------
; ChildShip_StateCrash2 - CHILDSHIP crash: second impact - shake, bounce (vy -$592, gravity $100)
; In:  8(a6) = this
; Out: d0
; Evidence: next ChildShip_StateCrash3
; Found: link-after-rts
; ---------------------------------------------------------------------------
ChildShip_StateCrash2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.l	#$14000,$A6(a4)
	blt.s	loc_0B7702
	move.l	#$14000,$A6(a4)
	lea.l	$1DBA(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	move.w	#$FA6E,$18(a4)
	move.w	#$100,$20(a4)
	clr.w	$6C(a4)
	lea.l	ChildShip_StateCrash3(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0B7714
loc_0B7702:
	clr.w	$6C(a4)
	lea.l	ChildShip_StateCrash2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B7714:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
