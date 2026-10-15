; ---------------------------------------------------------------------------
; SporeMine_ClassInit - vtable +$5E: per-level class setup for SPOREMINE: load its resources (sub_1F62C0) into class globals
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the SPOREMINE descriptor $0BF580; TAS frames 27879-29685 (2 frames active)
; ---------------------------------------------------------------------------
SporeMine_ClassInit:
	link.w	a6,#$0
	jsr	sub_0BEE38(pc)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$237A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3C22(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
