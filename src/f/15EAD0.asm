; ---------------------------------------------------------------------------
; Actor_Nop66 - ACTOR slot +$66: no-op that loads this into a4
; In:  8(a6) = this
; Out: none
; Evidence: movea.l 8(a6),a4 then restores a4; the same 6-instruction body appears in every class
; ---------------------------------------------------------------------------
Actor_Nop66:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	-$4(a6),a4
	unlk	a6
	rts
