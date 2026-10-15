; ---------------------------------------------------------------------------
; RetractFloor_ClassInit - vtable +$5E: per-level class setup for RETRACTFLOOR (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor RETRACTFLOOR slot +$5E (tools/classes.py); TAS frames 14116-14116 (1 active)
; ---------------------------------------------------------------------------
RetractFloor_ClassInit:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$53A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3CCE(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
