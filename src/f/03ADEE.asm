; ---------------------------------------------------------------------------
; RollingDiscs_Move - vtable +$4E: per-frame movement of a ROLLINGDISCS
; In:  8(a6) = this (ROLLINGDISCS object)
; Out: none
; Evidence: class descriptor ROLLINGDISCS slot +$4E (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
RollingDiscs_Move:
	link.w	a6,#$0
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	unlk	a6
	rts
