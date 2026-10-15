; ---------------------------------------------------------------------------
; YoyoAcolyte_ClassInit - vtable +$5E: per-level class setup for YOYOACOLYTE (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor YOYOACOLYTE slot +$5E (tools/classes.py); TAS frames 11770-14117 (2 active)
; ---------------------------------------------------------------------------
YoyoAcolyte_ClassInit:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$4CA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3CD2(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
