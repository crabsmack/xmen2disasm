; ---------------------------------------------------------------------------
; Beast_GroundSpecial - BEAST slot +$DE: ground special: stomp (start)
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: attack sound char +$2C, stop, stomp animation (jt $4472 data), delay $FF, next Beast_StateStomp
; ---------------------------------------------------------------------------
Beast_GroundSpecial:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$4272(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	Beast_StateStomp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
