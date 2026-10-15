; ---------------------------------------------------------------------------
; ExodusBlast_StateStart - EXODUSBLAST first state: hidden (frame $FF), then launch
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: slot $56 SetFrame($FF); next ExodusBlast_StateLaunch
; ---------------------------------------------------------------------------
ExodusBlast_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	ExodusBlast_StateLaunch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
