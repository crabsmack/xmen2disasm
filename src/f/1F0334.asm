; ---------------------------------------------------------------------------
; XPlayer_StartDeath - player death: death sound, death frame, start the blinking countdown
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: Snd_Stop $D5, restart $52; SetFrame(char +$28); +$6E = 10, +$A6 = 20, +$10 = 0; state XPlayer_StateDeathBlink; installed by XPlayer_TakeDamage when health reaches 0
; ---------------------------------------------------------------------------
XPlayer_StartDeath:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($D5).w
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$52,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$52,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$28(a0),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.w	#$A,$6E(a4)
	move.w	#$14,$A6(a4)
	clr.w	$10(a4)
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	XPlayer_StateDeathBlink(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
