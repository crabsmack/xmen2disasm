; ---------------------------------------------------------------------------
; FarAcolyte_ClassInit - vtable +$5E: per-level class setup for FARACOLYTE (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor FARACOLYTE slot +$5E (tools/classes.py); TAS frames 10312-11766 (2 active)
; ---------------------------------------------------------------------------
FarAcolyte_ClassInit:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2CA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_FarAcolyteSprDef2(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2D2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_FarAcolyteSprDef3(a5)
	unlk	a6
	rts
