; ---------------------------------------------------------------------------
; EvilDrop_ClassInit - does nothing: only calls the empty EvilDrop_NopStatic (this class's override of: per-level class setup for EVILDROP)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the EVILDROP descriptor $095126; TAS frames 49269-49269 (1 frames active)
; ---------------------------------------------------------------------------
EvilDrop_ClassInit:
	link.w	a6,#$0
	jsr	EvilDrop_NopStatic(pc)
	unlk	a6
	rts
