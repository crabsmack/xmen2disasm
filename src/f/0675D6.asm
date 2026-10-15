; ---------------------------------------------------------------------------
; PlayerSelect_PlayIdleAnim_part5 - part 5 of PlayerSelect_PlayIdleAnim: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of PlayerSelect_PlayIdleAnim
; Out: continues in PlayerSelect_PlayIdleAnim
; Evidence: only reached by branches from PlayerSelect_PlayIdleAnim
; ---------------------------------------------------------------------------
PlayerSelect_PlayIdleAnim_part5:
	lea.l	$4352(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	PlayerSelect_PlayIdleAnim_part7
