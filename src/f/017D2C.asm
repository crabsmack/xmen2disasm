; ---------------------------------------------------------------------------
; FarAcolyte_StateCastEnd - FARACOLYTE: back to frame 0, then follow the bolt
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: slot $56 SetFrame(0); next FarAcolyte_StateBoltFly
; ---------------------------------------------------------------------------
FarAcolyte_StateCastEnd:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	FarAcolyte_StateBoltFly(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
