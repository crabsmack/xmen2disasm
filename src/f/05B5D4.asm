; ---------------------------------------------------------------------------
; Boulder_StateStart - BOULDER first state: frame 0, no motion, wait for the ground
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next Boulder_StateWaitGround
; ---------------------------------------------------------------------------
Boulder_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Boulder_StateWaitGround(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
