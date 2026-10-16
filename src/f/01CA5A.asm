; ---------------------------------------------------------------------------
; YoyoAcolyte_ScriptHigh - YOYOACOLYTE AI script (jt[143]): ThrowHigh, Idle
; In:  a4 = this
; Out: none
; Evidence: preceded by Tbl_YoyoAcolyteScriptHigh
; ---------------------------------------------------------------------------
YoyoAcolyte_ScriptHigh:
	jmp	$46A(a5)	; -> YoyoAcolyte_ActThrowHigh
loc_01CA5E:
	jmp	$45A(a5)	; -> YoyoAcolyte_ActIdle
