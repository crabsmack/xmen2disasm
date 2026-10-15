; ---------------------------------------------------------------------------
; ChildShip_StateCrash - CHILDSHIP state: shot down - wreck trail jt[$1FC2], fall (vy $100, gravity $100)
; In:  8(a6) = this
; Out: d0
; Evidence: next ChildShip_StateCrash1; TAS 33437
; Found: link-after-rts
; ---------------------------------------------------------------------------
ChildShip_StateCrash:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1DC2(a5),a0
	move.l	$2(a0),$94(a4)
	move.w	#$100,$18(a4)
	move.w	#$100,$20(a4)
	clr.w	$6C(a4)
	lea.l	ChildShip_StateCrash1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
