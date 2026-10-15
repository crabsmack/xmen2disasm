; ---------------------------------------------------------------------------
; YoyoAcolyte_ScriptMixB - YOYOACOLYTE AI script (jt[146]): Low, Idle, High, Idle, Level, Idle
; In:  a4 = this
; Out: none
; Evidence: preceded by word count 6 at $01CA86
; ---------------------------------------------------------------------------
YoyoAcolyte_ScriptMixB:
	jmp	$472(a5)	; -> YoyoAcolyte_ActThrowLow
loc_01CA8C:
	jmp	$45A(a5)	; -> YoyoAcolyte_ActIdle
loc_01CA90:
	jmp	$46A(a5)	; -> YoyoAcolyte_ActThrowHigh
loc_01CA94:
	jmp	$45A(a5)	; -> YoyoAcolyte_ActIdle
loc_01CA98:
	jmp	$462(a5)	; -> YoyoAcolyte_ActThrowLevel
loc_01CA9C:
	jmp	$45A(a5)	; -> YoyoAcolyte_ActIdle
