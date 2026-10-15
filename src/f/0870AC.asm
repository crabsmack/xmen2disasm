; ---------------------------------------------------------------------------
; BroodBoss_StateShockOn - BROODBOSS state: start the floor shockwave for $F frames (sound $F5)
; In:  8(a6) = this
; Out: d0
; Evidence: -$3B0C |= 2 (BroodBoss_Update then hurts players on the arena floor), Snd $F5, +$6C = $F, next BroodBoss_StateShockOff
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateShockOn:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$2,g_SceneVar3B0C(a5)
	pea.l	($F5).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F5).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	move.w	#$F,$6C(a4)
	lea.l	BroodBoss_StateShockOff(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
