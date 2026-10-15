; ---------------------------------------------------------------------------
; PlayerSelect_PlayIdleAnim_part7 - part 7 of PlayerSelect_PlayIdleAnim: shared exit split off by the code-flow tools (not a separate function)
; In:  registers/frame of PlayerSelect_PlayIdleAnim
; Out: continues in PlayerSelect_PlayIdleAnim
; Evidence: only reached by branches from PlayerSelect_PlayIdleAnim; ends with rts
; ---------------------------------------------------------------------------
PlayerSelect_PlayIdleAnim_part7:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
