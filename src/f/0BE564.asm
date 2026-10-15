; ---------------------------------------------------------------------------
; Barbarian_ClassInit - per-level class setup: Barbarian_Nop6A, then install Barbarian_SegHook1A in -$3402 (BARBARIAN override of slot +$5E ClassInit; loads no resources)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Out: none
; Evidence: slot +$5E of the BARBARIAN descriptor $0BE74E; TAS frames 27879-32204 (4 frames active)
; ---------------------------------------------------------------------------
Barbarian_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	Barbarian_Nop6A(pc)
	addq.w	#$4,a7
	lea.l	Barbarian_SegHook1A(pc),a0
	move.l	a0,-$3402(a5)
	unlk	a6
	rts
