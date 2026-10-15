; ---------------------------------------------------------------------------
; ControlPanel_StateDamaged2 - CONTROLPANEL state: damaged twice (frame 3, flag bit 3)
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6E(8)
; Found: link-after-rts
; ---------------------------------------------------------------------------
ControlPanel_StateDamaged2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.w	#$FF,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
