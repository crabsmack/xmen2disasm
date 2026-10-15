; ---------------------------------------------------------------------------
; Exodus_ClassInit - vtable +$5E: per-level class setup for EXODUS (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor EXODUS slot +$5E (tools/classes.py); TAS frames 17148-17148 (1 active)
; ---------------------------------------------------------------------------
Exodus_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	Exodus_NopStatic(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$5F2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_ExodusSprDef(a5)
	unlk	a6
	rts
