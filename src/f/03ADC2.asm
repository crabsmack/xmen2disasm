; ---------------------------------------------------------------------------
; RollingDiscs_Update - vtable +$4A: per-frame update of a ROLLINGDISCS
; In:  8(a6) = this (ROLLINGDISCS object)
; Out: none
; Evidence: class descriptor ROLLINGDISCS slot +$4A (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
RollingDiscs_Update:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
