; ---------------------------------------------------------------------------
; ChildShip_StateCrash3 - CHILDSHIP crash: final impact - shake and stop
; In:  8(a6) = this
; Out: d0
; Evidence: next ChildShip_StateReleaseChild
; Found: link-after-rts
; ---------------------------------------------------------------------------
ChildShip_StateCrash3:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.l	#$14000,$A6(a4)
	blt.s	loc_0B7762
	move.l	#$14000,$A6(a4)
	lea.l	$1DBA(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.w	$6C(a4)
	lea.l	ChildShip_StateReleaseChild(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0B7774
loc_0B7762:
	clr.w	$6C(a4)
	lea.l	ChildShip_StateCrash3(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B7774:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
