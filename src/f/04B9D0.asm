; ---------------------------------------------------------------------------
; Apocalypse_ActOrbitFrom0 - APOCALYPSE script action: start its orbit at angle 0 with frame 0
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$8E = 0; next Apocalypse_StateOrbitStep
; ---------------------------------------------------------------------------
Apocalypse_ActOrbitFrom0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$8E(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Apocalypse_StateOrbitStep(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
