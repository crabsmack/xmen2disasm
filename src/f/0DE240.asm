; ---------------------------------------------------------------------------
; ControlPanel_StateDamaged1 - CONTROLPANEL state: damaged once (frame 2, flag bit 2)
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6E(4)
; Found: link-after-rts
; ---------------------------------------------------------------------------
ControlPanel_StateDamaged1:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.w	#$FF,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
