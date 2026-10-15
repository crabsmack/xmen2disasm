; ---------------------------------------------------------------------------
; BroodBossArm_Init - vtable +$12 constructor: BROODBOSSARM sprite set $091D22, flags $5083, frame $FF
; Evidence: calls BROODBOSSPARTS Init; created by BroodBoss_StateSetup at (x+$31, y-$C)
; ---------------------------------------------------------------------------
BroodBossArm_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$14FA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$154A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	ori.w	#$5083,$6(a4)
	move.w	#$FF,$6C(a4)
	move.b	#$14,$42(a4)
	ori.b	#$4,$2E(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
