; ---------------------------------------------------------------------------
; Hologram_ScriptAttack - Hologram AI script: pose 0, raise, wait, lower, then the four bolt attacks with pauses
; In:  jmp thunks
; Out: -
; Evidence: count word at $0EAF10 (jt[1278] $2812), used by Hologram_StartAttackScript
; ---------------------------------------------------------------------------
Hologram_ScriptAttack:
	jmp	$2762(a5)	; -> Hologram_ActPose0
loc_0EAF16:
	jmp	$277A(a5)	; -> Hologram_Raise_Pose3
loc_0EAF1A:
	jmp	$27B2(a5)	; -> Hologram_ActWaitB
loc_0EAF1E:
	jmp	$2782(a5)	; -> Hologram_Lower_Pose3
loc_0EAF22:
	jmp	$27BA(a5)	; -> Hologram_ActWait30
loc_0EAF26:
	jmp	$278A(a5)	; -> Hologram_Fire1_Pose6
loc_0EAF2A:
	jmp	$27AA(a5)	; -> Hologram_ActPose0WaitA
loc_0EAF2E:
	jmp	$2792(a5)	; -> Hologram_Fire2_Pose6
loc_0EAF32:
	jmp	$27AA(a5)	; -> Hologram_ActPose0WaitA
loc_0EAF36:
	jmp	$279A(a5)	; -> Hologram_Fire3_Pose5
loc_0EAF3A:
	jmp	$27AA(a5)	; -> Hologram_ActPose0WaitA
loc_0EAF3E:
	jmp	$27A2(a5)	; -> Hologram_Fire4_Pose5
loc_0EAF42:
	jmp	$27AA(a5)	; -> Hologram_ActPose0WaitA
loc_0EAF46:
	jmp	$2762(a5)	; -> Hologram_ActPose0
loc_0EAF4A:
	jmp	$277A(a5)	; -> Hologram_Raise_Pose3
loc_0EAF4E:
	jmp	$27B2(a5)	; -> Hologram_ActWaitB
loc_0EAF52:
	jmp	$2782(a5)	; -> Hologram_Lower_Pose3
loc_0EAF56:
	jmp	$27BA(a5)	; -> Hologram_ActWait30
loc_0EAF5A:
	jmp	$27A2(a5)	; -> Hologram_Fire4_Pose5
loc_0EAF5E:
	jmp	$27AA(a5)	; -> Hologram_ActPose0WaitA
loc_0EAF62:
	jmp	$279A(a5)	; -> Hologram_Fire3_Pose5
loc_0EAF66:
	jmp	$27AA(a5)	; -> Hologram_ActPose0WaitA
loc_0EAF6A:
	jmp	$2792(a5)	; -> Hologram_Fire2_Pose6
loc_0EAF6E:
	jmp	$27AA(a5)	; -> Hologram_ActPose0WaitA
loc_0EAF72:
	jmp	$278A(a5)	; -> Hologram_Fire1_Pose6
loc_0EAF76:
	jmp	$27AA(a5)	; -> Hologram_ActPose0WaitA
