; ---------------------------------------------------------------------------
; YoyoAcolyte_ScriptLevel - YOYOACOLYTE AI script (jt[142]): ThrowLevel, Idle
; In:  a4 = this
; Out: none
; Evidence: preceded by Tbl_YoyoAcolyteScriptLevelLen
; ---------------------------------------------------------------------------
YoyoAcolyte_ScriptLevel:
	jmp	$462(a5)	; -> YoyoAcolyte_ActThrowLevel
loc_01CA54:
	jmp	$45A(a5)	; -> YoyoAcolyte_ActIdle
