; ---------------------------------------------------------------------------
; ChildShip_StateCrash1 - CHILDSHIP crash: on reaching y $140 shake the screen (Tbl_ChildShipQuake, jt $1DBA) and bounce (vy -$458, gravity $60)
; In:  8(a6) = this
; Out: d0
; Evidence: next ChildShip_StateCrash2; TAS 33438-33450
; Found: link-after-rts
; ---------------------------------------------------------------------------
ChildShip_StateCrash1:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.l	#$14000,$A6(a4)
	blt.s	loc_0B76A2
	move.l	#$14000,$A6(a4)
	lea.l	$1DBA(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	move.w	#$FBA8,$18(a4)
	move.w	#$60,$20(a4)
	clr.w	$6C(a4)
	lea.l	ChildShip_StateCrash2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0B76B4
loc_0B76A2:
	clr.w	$6C(a4)
	lea.l	ChildShip_StateCrash1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B76B4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
