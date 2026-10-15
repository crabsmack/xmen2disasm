; ---------------------------------------------------------------------------
; BrainChild_ClassInit - does nothing: only calls the empty SavageA4_NopStatic (this class's override of: per-level class setup for BRAINCHILD)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the BRAINCHILD descriptor $0B7BAC; TAS frames 33387-33387 (1 frames active)
; ---------------------------------------------------------------------------
BrainChild_ClassInit:
	link.w	a6,#$0
	jsr	SavageA4_NopStatic(pc)
	unlk	a6
	rts
