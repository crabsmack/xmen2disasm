; ---------------------------------------------------------------------------
; LightBeam_Activate - vtable +$3E: activate a LIGHTBEAM (entered the active window)
; In:  8(a6) = this (LIGHTBEAM object)
; Out: none
; Evidence: class descriptor LIGHTBEAM slot +$3E (tools/classes.py); TAS frames 45425-45425 (1 active)
; ---------------------------------------------------------------------------
LightBeam_Activate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$10D2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	move.l	$7C(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$7C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
