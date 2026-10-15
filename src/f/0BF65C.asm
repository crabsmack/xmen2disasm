; ---------------------------------------------------------------------------
; SpikeBall_ClassInit - vtable +$5E: per-level class setup for SPIKEBALL: load its resources (sub_1F62C0) into class globals
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the SPIKEBALL descriptor $0BF820; TAS frames 27879-29685 (2 frames active)
; ---------------------------------------------------------------------------
SpikeBall_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	SpikeBall_Nop6A(pc)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$2382(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3C20(a5)
	unlk	a6
	rts
