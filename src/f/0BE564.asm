; ---------------------------------------------------------------------------
; Barbarian_ClassInit - vtable +$5E: per-level class setup for BARBARIAN
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the BARBARIAN descriptor $0BE74E; TAS frames 27879-32204 (4 frames active)
; ---------------------------------------------------------------------------
Barbarian_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	Barbarian_Nop6A(pc)
	addq.w	#$4,a7
	lea.l	sub_0BD52C(pc),a0
	move.l	a0,-$3402(a5)
	unlk	a6
	rts
