; ---------------------------------------------------------------------------
; ThronePhone_ClassInit - vtable +$5E: per-level class setup for THRONEPHONE (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor THRONEPHONE slot +$5E (tools/classes.py); TAS frames 18540-18540 (1 active)
; ---------------------------------------------------------------------------
ThronePhone_ClassInit:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$81A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3CAA(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
