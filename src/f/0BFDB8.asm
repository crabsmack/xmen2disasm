; ---------------------------------------------------------------------------
; SwampPlatform_ClassInit - vtable +$5E: per-level class setup for SWAMPPLATFORM: load its resources (SprDef_Add) into class globals
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the SWAMPPLATFORM descriptor $0C005A; TAS frames 27881-29687 (2 frames active)
; ---------------------------------------------------------------------------
SwampPlatform_ClassInit:
	link.w	a6,#$0
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$2392(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C16(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
