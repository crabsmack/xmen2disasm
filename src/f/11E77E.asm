; ---------------------------------------------------------------------------
; BioBalls_ScriptIdle - BIOBALLS AI script (1 entry): BioBalls_StateIdle
; In:  jmp thunk
; Out: -
; Evidence: thunk at $11E77E after the BIOBALLS code
; ---------------------------------------------------------------------------
BioBalls_ScriptIdle:
	jmp	$333A(a5)	; -> BioBalls_StateIdle
