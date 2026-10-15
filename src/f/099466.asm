; ---------------------------------------------------------------------------
; XClone_TileHookReward - clone-maker tile hook [6]: after a clone is killed by its own character, flash a reward effect at the screen centre (once per $A0 frames)
; In:  $10(a6) = object
; Out: d0 = 0
; Evidence: needs -$3B06 = 0 and bit (8 + Clone_CharTypeOf(obj)) of -$3B08 (set by XClone_TakeDamage); sets -$3B08 bit 2, -$3B06 = $A0, effect actor with $09A224; installed in $FFC720 by XClone_InstallTileHooks
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_TileHookReward:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	clr.b	d7
	tst.w	-$3B06(a5)
	ble.s	loc_09947C
	moveq	#$0,d0
	bra.w	loc_09951C
loc_09947C:
	move.l	$10(a6),-(a7)
	jsr	Clone_CharTypeOf(pc)
	move.w	d0,d6
	move.w	-$3B08(a5),d0
	ext.l	d0
	move.b	d6,d1
	addq.b	#$8,d1
	moveq	#$1,d2
	lsl.l	d1,d2
	and.l	d0,d2
	addq.w	#$4,a7
	beq.s	loc_09949C
	moveq	#$1,d7
loc_09949C:
	tst.b	d7
	bne.s	loc_0994A4
	moveq	#$0,d0
	bra.s	loc_09951C
loc_0994A4:
	ori.w	#$2,-$3B08(a5)
	move.w	#$A0,-$3B06(a5)
	moveq	#$1,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_CameraY(a5),d1
	ext.l	d1
	moveq	#$70,d2
	add.l	d2,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	move.w	g_CameraX(a5),d1
	ext.l	d1
	add.l	#$A0,d1
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
	beq.s	loc_09951C
	ori.b	#$4,$2E(a4)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#-$10,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	lea.l	$1982(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3AFA(a5)	; -> sub_13EFA0
	lea.l	$18(a7),a7
loc_09951C:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
