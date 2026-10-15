; ---------------------------------------------------------------------------
; Exodus_StateRiseEnd - EXODUS: snap back to the saved x and descend again after 55 frames
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next Exodus_StateDescend
; ---------------------------------------------------------------------------
Exodus_StateRiseEnd:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.l	$98(a4)
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	andi.b	#$FD,$AC(a4)
	move.w	#$37,$6C(a4)
	lea.l	Exodus_StateDescend(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
