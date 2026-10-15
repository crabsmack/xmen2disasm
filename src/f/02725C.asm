; ---------------------------------------------------------------------------
; Zapper_ClassInit - vtable +$5E: per-level class setup for ZAPPER (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor ZAPPER slot +$5E (tools/classes.py); TAS frames 14120-14120 (1 active)
; ---------------------------------------------------------------------------
Zapper_ClassInit:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$58A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3CCC(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
