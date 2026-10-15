; ---------------------------------------------------------------------------
; BroodBoss_ScrStepScream - BROODBOSS AI-script step: jmp BroodBoss_ActScream
; Evidence: jmp thunk in a BROODBOSS script
; Found: runtime: executed in 64 run(s) (fuzz-01800-s1...)
; ---------------------------------------------------------------------------
BroodBoss_ScrStepScream:
	jmp	$142A(a5)	; -> BroodBoss_ActScream
loc_088A9E:
	jmp	$13E2(a5)	; -> BroodBoss_ActWait30
loc_088AA2:
	jmp	$13EA(a5)	; -> BroodBoss_ActClaw
loc_088AA6:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
loc_088AAA:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
loc_088AAE:
	jmp	$1402(a5)	; -> BroodBoss_ActStomp
loc_088AB2:
	jmp	$13E2(a5)	; -> BroodBoss_ActWait30
loc_088AB6:
	jmp	$1402(a5)	; -> BroodBoss_ActStomp
loc_088ABA:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
loc_088ABE:
	jmp	$140A(a5)	; -> BroodBoss_ActStop
loc_088AC2:
	jmp	$13F2(a5)	; -> BroodBoss_ActDropBomb
loc_088AC6:
	jmp	$13E2(a5)	; -> BroodBoss_ActWait30
loc_088ACA:
	jmp	$13FA(a5)	; -> BroodBoss_ActDropBomb2
loc_088ACE:
	jmp	$1402(a5)	; -> BroodBoss_ActStomp
loc_088AD2:
	jmp	$1402(a5)	; -> BroodBoss_ActStomp
loc_088AD6:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
loc_088ADA:
	jmp	$13EA(a5)	; -> BroodBoss_ActClaw
loc_088ADE:
	jmp	$13DA(a5)	; -> BroodBoss_ActWait60
