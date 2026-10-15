; ---------------------------------------------------------------------------
; Hologram_ScriptIntro - Hologram AI script (1 entry): Hologram_StartAttackScript
; In:  jmp thunk entered with the hologram on the stack
; Out: -
; Evidence: count word at $0EAEFC (labelled Tbl_HologramAiScript_0EAEFC, really the word $0001); script pointer set from jt[1276]
; ---------------------------------------------------------------------------
Hologram_ScriptIntro:
	jmp	$275A(a5)	; -> Hologram_StartAttackScript
