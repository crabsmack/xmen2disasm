; ---------------------------------------------------------------------------
; BioBalls_SpawnPuff - spawn a short ACTOR effect (animation $11E782) at pixel (x, y), optionally mirrored
; In:  $A/$E(a6) = word x, y  $13(a6) = byte mirror
; Out: d0
; Evidence: ACTOR New + ExplodeFx_ChainRepeat; called when BioBalls_MotionRoll finishes
; ---------------------------------------------------------------------------
BioBalls_SpawnPuff:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$E(a6),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	move.w	$A(a6),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.s	loc_12011C
	tst.b	$13(a6)
	beq.s	loc_1200FA
	ori.b	#$10,$2E(a4)
loc_1200FA:
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#-$20,d1
	move.l	d1,-(a7)
	moveq	#-$10,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$3302(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3AFA(a5)	; -> ExplodeFx_ChainRepeat
	lea.l	$18(a7),a7
loc_12011C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
