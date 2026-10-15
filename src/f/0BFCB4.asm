; ---------------------------------------------------------------------------
; SwampBubbles_Deactivate - Deactivate
; In:  8(a6) = this
; Evidence: slot +$46 of the SWAMPBUBBLES descriptor $0BFCE4; never runs in the corpus; calls parent ACTOR slot +$46
; ---------------------------------------------------------------------------
SwampBubbles_Deactivate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2242(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
