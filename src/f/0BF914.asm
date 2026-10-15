; ---------------------------------------------------------------------------
; SavageJungle_PalPhaseUpdate_Case0 - SavageJungle_PalPhaseUpdate case 0: palette line 0 colours 2-5 = $200/$400/$600/$802
; Evidence: switch target
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SavageJungle_PalPhaseUpdate_Case0:
	movea.l	-$3C1A(a5),a0
	move.w	$6(a0),-$3C1E(a5)
	move.w	#$200,g_PalBase+$44(a5)
	move.w	#$400,g_PalBase+$46(a5)
	move.w	#$600,g_PalBase+$48(a5)
	move.w	#$802,g_PalBase+$4A(a5)
	bra.w	SavageJungle_PalPhaseUpdate_Done
