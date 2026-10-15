; ---------------------------------------------------------------------------
; Hologram_ScriptDying - Hologram AI script (3 entries): SeqA, SeqB, ExplodeWhenReady
; In:  jmp thunks
; Out: -
; Evidence: count word at $0EAF02 (jt[1277] $280A), used by Hologram_StartDyingScript
; ---------------------------------------------------------------------------
Hologram_ScriptDying:
	jmp	$276A(a5)	; -> Hologram_SeqA_Pose1
loc_0EAF08:
	jmp	$2772(a5)	; -> Hologram_SeqB_Pose3
loc_0EAF0C:
	jmp	$2752(a5)	; -> Hologram_ExplodeWhenReady
