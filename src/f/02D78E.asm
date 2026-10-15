; ---------------------------------------------------------------------------
; Exodus_ClassInit - vtable +$5E: per-level class setup for EXODUS (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor EXODUS slot +$5E (tools/classes.py); TAS frames 17148-17148 (1 active)
; ---------------------------------------------------------------------------
Exodus_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	sub_02D756(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$5F2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3CB4(a5)
	unlk	a6
	rts
