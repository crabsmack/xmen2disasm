; ---------------------------------------------------------------------------
; BroodBoss_StateAfterBomb - BROODBOSS state: hold frame 5, then the next AI-script step
; In:  8(a6) = this
; Out: none
; Evidence: SetFrame(5) + next-step idiom; reached from both bomb drops; TAS 49896
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateAfterBomb:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$92(a4)
	addq.w	#$8,a7
	bne.s	loc_086FF6
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_087022
loc_086FF6:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_08700A
	clr.w	$90(a4)
loc_08700A:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_087022:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
