; ---------------------------------------------------------------------------
; SporeMine_RecArm2 - spore handler: arming step 2 (animation jt[$239A], sound $B9, $14 frames)
; In:  8(a6) = spore record
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SporeMine_RecArm2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$219A(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$10(a4)
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.w	d0,$E(a4)
	clr.l	$14(a4)
	pea.l	($B9).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($B9).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	SporeMine_RecArm3(pc),a0
	move.l	a0,$18(a4)
	move.w	#$14,$1C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
