; ---------------------------------------------------------------------------
; Boulder_Kill - vtable +$52: kill a BOULDER
; In:  8(a6) = this (BOULDER object)
; Out: none
; Evidence: class descriptor BOULDER slot +$52 (tools/classes.py); TAS frames 20742-20997 (4 active)
; ---------------------------------------------------------------------------
Boulder_Kill:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$D22(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	unlk	a6
	rts
