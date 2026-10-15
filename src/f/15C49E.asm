; ---------------------------------------------------------------------------
; Pause_CheatUnlock - Pause_HandleInput switch: a cheat code was completed: play its sound and set its unlock flag
; In:  a6 frame of Pause_HandleInput
; Out: none
; Evidence: case 0 sound $1B flag $10; case 1 sound $22 flag $20 + 99 lives each; cases 2/3 sound $36 flags $C0; case 4 sound $37 ...; then Pause_HandleInput_EndCode
; ---------------------------------------------------------------------------
Pause_CheatUnlock:
	moveq	#$1B,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$1B,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ori.w	#$10,-$3C5E(a5)
	addq.w	#$8,a7
	bra.w	Pause_HandleInput_EndCode
loc_15C4BA:
	moveq	#$22,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$22,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ori.w	#$20,-$3C5E(a5)
	move.w	#$63,-$38A8(a5)
	move.w	#$63,-$38AA(a5)
	addq.w	#$8,a7
	bra.w	Pause_HandleInput_EndCode
loc_15C4E2:
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ori.w	#$C0,-$3C5E(a5)
	addq.w	#$8,a7
	bra.w	Pause_HandleInput_EndCode
loc_15C4FE:
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ori.w	#$C0,-$3C5E(a5)
	addq.w	#$8,a7
	bra.w	Pause_HandleInput_EndCode
loc_15C51A:
	moveq	#$37,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$37,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$8,a7
	bne.w	Pause_HandleInput_EndCode
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	Pause_HandleInput_EndCode
	jsr	$3A(a5)	; -> unk_Player_005F18
	bra.s	Pause_HandleInput_EndCode
loc_15C564:
	moveq	#$39,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$39,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ori.w	#$2000,-$3C5E(a5)
	addq.w	#$8,a7
	bra.s	Pause_HandleInput_EndCode
loc_15C57E:
	moveq	#$26,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$26,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ori.w	#$400,-$3C5E(a5)
	addq.w	#$8,a7
	bra.s	Pause_HandleInput_EndCode
loc_15C598:
	moveq	#$24,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$24,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ori.w	#$200,-$3C5E(a5)
	addq.w	#$8,a7
	bra.s	Pause_HandleInput_EndCode
loc_15C5B2:
	moveq	#$4F,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$4F,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.w	#$63,-$38A8(a5)
	move.w	#$63,-$38AA(a5)
	ori.w	#$27F0,-$3C5E(a5)
	addq.w	#$8,a7
