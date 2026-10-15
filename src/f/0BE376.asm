; ---------------------------------------------------------------------------
; Barbarian_StateAttack_Done - tail of Barbarian_StateAttack
; Evidence: switch exit
; ---------------------------------------------------------------------------
Barbarian_StateAttack_Done:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
