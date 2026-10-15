; ---------------------------------------------------------------------------
; Boulder_Deactivate - vtable +$46: deactivate a BOULDER
; In:  8(a6) = this (BOULDER object)
; Out: none
; Evidence: class descriptor BOULDER slot +$46 (tools/classes.py); TAS frames 20742-20997 (4 active)
; ---------------------------------------------------------------------------
Boulder_Deactivate:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$D22(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	unlk	a6
	rts
