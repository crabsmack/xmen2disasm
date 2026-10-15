; ---------------------------------------------------------------------------
; PlayerSelect_PlayPickAnim_part3 - part 3 of PlayerSelect_PlayPickAnim: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of PlayerSelect_PlayPickAnim
; Out: continues in PlayerSelect_PlayPickAnim
; Evidence: only reached by branches from PlayerSelect_PlayPickAnim; ends with rts
; ---------------------------------------------------------------------------
PlayerSelect_PlayPickAnim_part3:
	move.l	a4,d0
	beq.s	loc_067538
	moveq	#$0,d0
	move.b	$2C(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_067538
	moveq	#$0,d0
	move.b	$2C(a4),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$0,d0
	move.b	$2C(a4),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_067538:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
