; ---------------------------------------------------------------------------
; EvilMaker_ScrStepKill - EVILMAKER AI-script step: jmp EvilMaker_ActKill
; Evidence: jmp thunk in an EVILMAKER script (EvilMaker_Init picks jt[$17EA])
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
EvilMaker_ScrStepKill:
	jmp	$15AA(a5)	; -> EvilMaker_ActKill
	jmp	$15B2(a5)	; -> EvilMaker_ActDropCyclops
	jmp	$1592(a5)	; -> EvilMaker_StateIdle
	jmp	$159A(a5)	; -> EvilMaker_ActWait60
	jmp	$15BA(a5)	; -> EvilMaker_ActDropGambit
	jmp	$1592(a5)	; -> EvilMaker_StateIdle
	jmp	$159A(a5)	; -> EvilMaker_ActWait60
	jmp	$15A2(a5)	; -> EvilMaker_ActDropBeast
	jmp	$1592(a5)	; -> EvilMaker_StateIdle
	jmp	$159A(a5)	; -> EvilMaker_ActWait60
	jmp	$15CA(a5)	; -> EvilMaker_ActDropNightcrawler
	jmp	$1592(a5)	; -> EvilMaker_StateIdle
	jmp	$159A(a5)	; -> EvilMaker_ActWait60
	jmp	$15D2(a5)	; -> EvilMaker_ActDropPsylocke
	jmp	$1592(a5)	; -> EvilMaker_StateIdle
	jmp	$159A(a5)	; -> EvilMaker_ActWait60
	jmp	$15DA(a5)	; -> EvilMaker_ActDropWolverine
	jmp	$1592(a5)	; -> EvilMaker_StateIdle
	jmp	$159A(a5)	; -> EvilMaker_ActWait60
	jmp	$15C2(a5)	; -> EvilMaker_ActDropMagneto
	jmp	$1592(a5)	; -> EvilMaker_StateIdle
	jmp	$159A(a5)	; -> EvilMaker_ActWait60
	jmp	$15AA(a5)	; -> EvilMaker_ActKill
