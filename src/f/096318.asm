; ---------------------------------------------------------------------------
; XClone_DieRestartMusic - XCLONE: restart music $5F and play the type-8 death effect
; In:  8(a6) = this
; Out: none
; Evidence: Music_PlayStage($5F) (music, as CloneA2_RunScene), sub_13E808(this) (XNPC Explode case 8); jt 727; TAS 55078-56844
; Found: jt 727
; ---------------------------------------------------------------------------
XClone_DieRestartMusic:
	link.w	a6,#$0
	moveq	#$5F,d0
	move.l	d0,-(a7)
	jsr	$232A(a5)	; -> Music_PlayStage
	move.l	$8(a6),-(a7)
	jsr	$3AE2(a5)	; -> sub_13E808
	unlk	a6
	rts
