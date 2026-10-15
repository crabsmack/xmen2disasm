; ---------------------------------------------------------------------------
; BroodBoss_StateWallStop - BROODBOSS state: stop the wall and the claw, roar (sound $91)
; In:  8(a6) = this
; Out: d0
; Evidence: animation jt[$1682]; wall +$14 = 0; claw stopped; +$6C = $FF; next BroodBoss_StateChargeStart
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateWallStop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1482(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($91).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($91).w
	jsr	$521A(a5)	; -> Snd_Play
	tst.l	$A2(a4)
	lea.l	$10(a7),a7
	beq.s	loc_0872CE
	movea.l	$A2(a4),a0
	clr.w	$14(a0)
loc_0872CE:
	movea.l	$96(a4),a0
	clr.w	$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	movea.l	$96(a4),a0
	moveq	#$0,d0
	move.l	d0,$92(a0)
	move.w	#$FF,$6C(a4)
	lea.l	BroodBoss_StateChargeStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
