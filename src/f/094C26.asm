; ---------------------------------------------------------------------------
; EvilMaker_ScrStepKill - EVILMAKER AI-script step: jmp EvilMaker_ActKill
; Evidence: jmp thunk in an EVILMAKER script (EvilMaker_Init picks jt[$17EA])
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
EvilMaker_ScrStepKill:
	jmp	$15AA(a5)	; -> EvilMaker_ActKill
