; ---------------------------------------------------------------------------
; SavageJungle_PalPhaseUpdate_Case0 - SavageJungle_PalPhaseUpdate case 0 (phase 1): reload the phase timer from the script, base palette line 2 colours 2-5 = $200/$400/$600/$802
; In:  inside SavageJungle_PalPhaseUpdate
; Out: -
; Evidence: switch target; -$3C1E := script(-$3C1A)+6; writes -$393C..-$3936 = g_PalBase(-$3980)+$44..+$4A = line 2 ($20 bytes per line) colours 2-5
; Found: runtime: executed in 1 run(s) (1 run(s) (tas))
; ---------------------------------------------------------------------------
SavageJungle_PalPhaseUpdate_Case0:
	movea.l	g_JunglePalScript(a5),a0
	move.w	$6(a0),g_JunglePalTimer(a5)
	move.w	#$200,g_PalBase+$44(a5)
	move.w	#$400,g_PalBase+$46(a5)
	move.w	#$600,g_PalBase+$48(a5)
	move.w	#$802,g_PalBase+$4A(a5)
	bra.w	SavageJungle_PalPhaseUpdate_Done
