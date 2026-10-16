; ---------------------------------------------------------------------------
; YoyoAcolyte_ScriptLow - YOYOACOLYTE AI script (jt[144]): ThrowLow, Idle
; In:  a4 = this
; Out: none
; Evidence: preceded by Tbl_YoyoAcolyteScriptLow
; ---------------------------------------------------------------------------
YoyoAcolyte_ScriptLow:
	jmp	$472(a5)	; -> YoyoAcolyte_ActThrowLow
loc_01CA68:
	jmp	$45A(a5)	; -> YoyoAcolyte_ActIdle
