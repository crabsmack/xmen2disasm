; ---------------------------------------------------------------------------
; BroodBoss_ActDropBomb - BROODBOSS script action: start the bomb-drop animation with rumble sound $91
; In:  8(a6) = this
; Out: d0
; Evidence: Obj_SetAnim(this, jt[$1692]), Snd $91, +$6C = $FF, next BroodBoss_StateDropBomb; jt 634
; ---------------------------------------------------------------------------
BroodBoss_ActDropBomb:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1492(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($91).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($91).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	BroodBoss_StateDropBomb(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
