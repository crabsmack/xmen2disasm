; ---------------------------------------------------------------------------
; BigAcolyte_Deactivate - parent Deactivate, then release the camera (camera slot +$3A UnlockAxes) (BIGACOLYTE override of slot +$46 Deactivate)
; In:  8(a6) = this (BIGACOLYTE object)
; Out: none
; Evidence: class descriptor BIGACOLYTE slot +$46 (tools/classes.py); TAS frames 13659-13659 (1 active)
; ---------------------------------------------------------------------------
BigAcolyte_Deactivate:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$1CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	unlk	a6
	rts
