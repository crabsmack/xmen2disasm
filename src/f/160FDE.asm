; ---------------------------------------------------------------------------
; Cam_IsPanning - is a Cam_PanTo pan in progress
; In:  8(a6) = this
; Out: d0 = 1 when +8 == Cam_PanStep
; Evidence: jt 2109; compares the tracking fn pointer
; ---------------------------------------------------------------------------
Cam_IsPanning:
	link.w	a6,#$0
	move.l	d3,-(a7)
	movea.l	$8(a6),a0
	lea.l	Cam_PanStep(pc),a1
	cmpa.l	$8(a0),a1
	seq.b	d3
	neg.b	d3
	move.b	d3,d0
	move.l	-$4(a6),d3
	unlk	a6
	rts
