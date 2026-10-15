; ---------------------------------------------------------------------------
; BroodBoss_ActScream - BROODBOSS script action: scream animation with sound $AE
; In:  8(a6) = this
; Out: d0
; Evidence: sub_1F626A(this, $088A42), Snd $AE, +$6C = $FF; next BroodBoss_StateScream; jt 641
; Found: jt 641
; ---------------------------------------------------------------------------
BroodBoss_ActScream:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$14B2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($AE).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($AE).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	BroodBoss_StateScream(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
