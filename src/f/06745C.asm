; ---------------------------------------------------------------------------
; PlayerSelect_PlayPickAnim_part1 - part 1 of PlayerSelect_PlayPickAnim: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of PlayerSelect_PlayPickAnim
; Out: continues in PlayerSelect_PlayPickAnim
; Evidence: only reached by branches from PlayerSelect_PlayPickAnim
; ---------------------------------------------------------------------------
PlayerSelect_PlayPickAnim_part1:
	lea.l	$424A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$429A(a5),a0
	movea.l	$2(a0),a4
	addq.w	#$8,a7
	bra.w	PlayerSelect_PlayPickAnim_part3
