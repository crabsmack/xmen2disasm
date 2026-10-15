; ---------------------------------------------------------------------------
; XPlayer_AirAttackUp - XPLAYER slot +$BA: Up+B in the air: play the up air-attack animation
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: gravity char +$E, Obj_SetAnim(char +$32), attack sound char +$2C, state XPlayer_StateAirAttack
; ---------------------------------------------------------------------------
XPlayer_AirAttackUp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	movea.l	a0,a1
	adda.w	$32(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	cmpi.w	#$FF,d0
	addq.w	#$8,a7
	beq.s	loc_1F2840
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
	addq.w	#$8,a7
loc_1F2840:
	clr.w	$6C(a4)
	lea.l	XPlayer_StateAirAttack(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
