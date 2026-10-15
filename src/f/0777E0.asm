; ---------------------------------------------------------------------------
; LightBeam_ClassInit - vtable +$5E: per-level class setup for LIGHTBEAM (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor LIGHTBEAM slot +$5E (tools/classes.py); TAS frames 45409-45409 (1 active)
; ---------------------------------------------------------------------------
LightBeam_ClassInit:
	link.w	a6,#$0
	jsr	sub_0777C2(pc)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$109A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3C5C(a5)
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$3886(a5),a0
	move.w	$6(a0,d0.w),-$3B10(a5)
	unlk	a6
	rts
