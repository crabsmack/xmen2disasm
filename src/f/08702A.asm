; ---------------------------------------------------------------------------
; BroodBoss_ActStomp - BROODBOSS script action: stomp - animation Tbl_BroodBossAnim4 (jt $148A) with rumble $91
; In:  8(a6) = this
; Out: d0
; Evidence: +$6C = $FF (wait for the animation), next BroodBoss_StateStompLand; jt 636; TAS 49664-50094
; Found: jt 636
; ---------------------------------------------------------------------------
BroodBoss_ActStomp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$148A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($91).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($91).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	BroodBoss_StateStompLand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
