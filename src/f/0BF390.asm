; ---------------------------------------------------------------------------
; SporeMine_RecArm4 - spore handler: arming step 4 (animation jt[$23AA], sound $B9, $D frames)
; In:  8(a6) = spore record
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SporeMine_RecArm4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$21AA(a5),a0
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
	lea.l	SporeMine_RecExplode(pc),a0
	move.l	a0,$18(a4)
	move.w	#$D,$1C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
