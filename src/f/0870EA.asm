; ---------------------------------------------------------------------------
; BroodBoss_StateShockOff - BROODBOSS state: end the shockwave, reset two effect sprites, roar, next step
; In:  8(a6) = this
; Out: none
; Evidence: -$3B0C &= ~2, Snd_Stop $F5, sub_1FB142/sub_1FAD44 on the sprite instances at $FFCC6A/$FFCC7E, sub_1F626A(this, $0889AA), next-step idiom
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateShockOff:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$FFFD,-$3B0C(a5)
	pea.l	($F5).w
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$3582(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$3582(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$1472(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	tst.l	$92(a4)
	lea.l	$2C(a7),a7
	bne.s	loc_087156
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_087182
loc_087156:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_08716A
	clr.w	$90(a4)
loc_08716A:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_087182:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
