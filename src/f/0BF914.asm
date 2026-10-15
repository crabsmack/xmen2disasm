; ---------------------------------------------------------------------------
; SavageJungle_PalPhaseUpdate_Case0 - SavageJungle_PalPhaseUpdate case 0: palette line 0 colours 2-5 = $200/$400/$600/$802
; Evidence: switch target
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SavageJungle_PalPhaseUpdate_Case0:
	movea.l	-$3C1A(a5),a0
	move.w	$6(a0),-$3C1E(a5)
	move.w	#$200,-$393C(a5)
	move.w	#$400,-$393A(a5)
	move.w	#$600,-$3938(a5)
	move.w	#$802,-$3936(a5)
	bra.w	SavageJungle_PalPhaseUpdate_Done
