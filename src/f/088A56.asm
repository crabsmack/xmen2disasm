; ---------------------------------------------------------------------------
; BroodBoss_ScrStepClaw - BROODBOSS AI script, steps 0-16 (first step jmp BroodBoss_ActClaw)
; Evidence: jmp d(a5) thunks of the 44-entry script {word $2C @ $088A54; thunks}, continued in the next file; jt[659] ($14BA(a5), Tbl_BroodBossScriptLen = the count word) is set by BroodBoss_Init
; Found: runtime: executed in 1 run(s) (1 run(s) (tas))
; ---------------------------------------------------------------------------
BroodBoss_ScrStepClaw:
	jmp	$13EA(a5)	; -> BroodBoss_ActClaw
loc_088A5A:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
loc_088A5E:
	jmp	$13E2(a5)	; -> BroodBoss_ActWait30
loc_088A62:
	jmp	$1402(a5)	; -> BroodBoss_ActStomp
loc_088A66:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
loc_088A6A:
	jmp	$140A(a5)	; -> BroodBoss_ActStop
loc_088A6E:
	jmp	$13F2(a5)	; -> BroodBoss_ActDropBomb
loc_088A72:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
loc_088A76:
	jmp	$13EA(a5)	; -> BroodBoss_ActClaw
loc_088A7A:
	jmp	$13E2(a5)	; -> BroodBoss_ActWait30
loc_088A7E:
	jmp	$1402(a5)	; -> BroodBoss_ActStomp
loc_088A82:
	jmp	$1402(a5)	; -> BroodBoss_ActStomp
loc_088A86:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
loc_088A8A:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
loc_088A8E:
	jmp	$1412(a5)	; -> BroodBoss_ActBringWall
loc_088A92:
	jmp	$141A(a5)	; -> BroodBoss_ActChargeWall
loc_088A96:
	jmp	$1422(a5)	; -> BroodBoss_ActAdvance
