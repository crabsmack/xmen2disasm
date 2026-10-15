; ---------------------------------------------------------------------------
; YoyoAcolyte_Init_Script0 - YoyoAcolyte_Init switch case 0: AI script jt $492 (YoyoAcolyte_ScriptLevel)
; In:  a4 = this
; Out: none
; Evidence: switch on the spawn parameter in YoyoAcolyte_Init
; ---------------------------------------------------------------------------
YoyoAcolyte_Init_Script0:
	lea.l	$492(a5),a0
	move.l	$2(a0),-$14(a6)
	bra.s	YoyoAcolyte_Init_SetScript
