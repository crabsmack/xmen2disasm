; ---------------------------------------------------------------------------
; BroodBoss_ActDropBomb2 - BROODBOSS script action: bomb-drop animation with rumble $91 (second variant, bomb further right)
; In:  8(a6) = this
; Out: d0
; Evidence: same as BroodBoss_ActDropBomb; next BroodBoss_StateDropBomb2; jt 635
; Found: jt 635
; ---------------------------------------------------------------------------
BroodBoss_ActDropBomb2:
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
	lea.l	BroodBoss_StateDropBomb2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
