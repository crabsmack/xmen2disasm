; ---------------------------------------------------------------------------
; DropBomb_ClassInit - empty: returns at once (this class's override of: per-level class setup for DROPBOMB)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the DROPBOMB descriptor $082294; TAS frames 47903-49269 (2 frames active)
; ---------------------------------------------------------------------------
DropBomb_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
