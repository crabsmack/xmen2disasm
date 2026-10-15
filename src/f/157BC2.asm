; ---------------------------------------------------------------------------
; MagnetoShots_Reset - mark the single magnetic bolt and flux bomb slots as free
; In:  none
; Out: none
; Evidence: clears the flag words of the static objects $FFE8AE (bolt, +4 = $FFE8B2) and $FFE7AC (bomb, +4 = $FFE7B0)
; ---------------------------------------------------------------------------
MagnetoShots_Reset:
	link.w	a6,#$0
	clr.w	-$194E(a5)
	clr.w	-$1A50(a5)
	unlk	a6
	rts
