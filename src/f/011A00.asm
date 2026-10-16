; ---------------------------------------------------------------------------
; BigAcolyte_FightScript - BIGACOLYTE fight AI script: 20 jmp thunks to the BigAcolyte_Act* actions
; In:  a4 = this
; Out: none
; Evidence: preceded by Tbl_BigAcolyteFightScript ($14); installed by BigAcolyte_ActStartFight
; ---------------------------------------------------------------------------
BigAcolyte_FightScript:
	jmp	$182(a5)	; -> BigAcolyte_ActRise1
	jmp	$1B2(a5)	; -> BigAcolyte_ActWait30
	jmp	$17A(a5)	; -> BigAcolyte_ActRise2
	jmp	$1B2(a5)	; -> BigAcolyte_ActWait30
	jmp	$1AA(a5)	; -> BigAcolyte_ActGoLow1
	jmp	$17A(a5)	; -> BigAcolyte_ActRise2
	jmp	$1B2(a5)	; -> BigAcolyte_ActWait30
	jmp	$1A2(a5)	; -> BigAcolyte_ActGoMid2
	jmp	$182(a5)	; -> BigAcolyte_ActRise1
	jmp	$1B2(a5)	; -> BigAcolyte_ActWait30
	jmp	$182(a5)	; -> BigAcolyte_ActRise1
	jmp	$1B2(a5)	; -> BigAcolyte_ActWait30
	jmp	$18A(a5)	; -> BigAcolyte_ActGoTop
	jmp	$192(a5)	; -> BigAcolyte_ActGoLowShoot
	jmp	$1B2(a5)	; -> BigAcolyte_ActWait30
	jmp	$1A2(a5)	; -> BigAcolyte_ActGoMid2
	jmp	$182(a5)	; -> BigAcolyte_ActRise1
	jmp	$19A(a5)	; -> BigAcolyte_ActGoMidShoot
	jmp	$1B2(a5)	; -> BigAcolyte_ActWait30
	jmp	$172(a5)	; -> BigAcolyte_ActStartFight
