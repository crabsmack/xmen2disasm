; ---------------------------------------------------------------------------
; SmallBrood_ScrStepKamikaze - SMALLBROOD AI-script step: jmp SmallBrood_ActKamikaze
; Evidence: 4-byte jmp thunk inside a script {word count; jmp d(a5)...} that SmallBrood_Init picks by spawn param +$E; reached through +$5C
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SmallBrood_ScrStepKamikaze:
	jmp	$12C2(a5)	; -> SmallBrood_ActKamikaze
	jmp	$12AA(a5)	; -> SmallBrood_ActShoot
