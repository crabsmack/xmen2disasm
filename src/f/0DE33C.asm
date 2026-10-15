; ---------------------------------------------------------------------------
; ControlPanel_StateArm - CONTROLPANEL state: fire interval +$9C = 10, then fire
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
ControlPanel_StateArm:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$A,$9C(a4)
	clr.w	$6C(a4)
	lea.l	ControlPanel_StateFire(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
