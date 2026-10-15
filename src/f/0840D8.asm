; ---------------------------------------------------------------------------
; SmallBrood_ScrStepApproach - SMALLBROOD AI-script step: jmp SmallBrood_ActApproach (next entry jmp SmallBrood_ActShoot)
; Evidence: script thunks; reached through +$5C
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SmallBrood_ScrStepApproach:
	jmp	$1292(a5)	; -> SmallBrood_ActApproach
loc_0840DC:
	jmp	$12AA(a5)	; -> SmallBrood_ActShoot
