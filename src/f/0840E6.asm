; ---------------------------------------------------------------------------
; SmallBrood_ScrStepWalk - SMALLBROOD AI-script step: jmp SmallBrood_ActWalk (next entry jmp SmallBrood_ActJump)
; Evidence: script thunks; reached through +$5C
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SmallBrood_ScrStepWalk:
	jmp	$129A(a5)	; -> SmallBrood_ActWalk
loc_0840EA:
	jmp	$12B2(a5)	; -> SmallBrood_ActJump
