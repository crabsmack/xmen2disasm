; ---------------------------------------------------------------------------
; YoyoAcolyte_ScriptMixA - YOYOACOLYTE AI script (jt[145]): Level, Idle, High, Idle, Low, Idle
; In:  a4 = this
; Out: none
; Evidence: preceded by Tbl_YoyoAcolyteScriptMixALen; the last thunk at $01CA82 is still raw (never ran)
; ---------------------------------------------------------------------------
YoyoAcolyte_ScriptMixA:
	jmp	$462(a5)	; -> YoyoAcolyte_ActThrowLevel
loc_01CA72:
	jmp	$45A(a5)	; -> YoyoAcolyte_ActIdle
loc_01CA76:
	jmp	$46A(a5)	; -> YoyoAcolyte_ActThrowHigh
loc_01CA7A:
	jmp	$45A(a5)	; -> YoyoAcolyte_ActIdle
loc_01CA7E:
	jmp	$472(a5)	; -> YoyoAcolyte_ActThrowLow
