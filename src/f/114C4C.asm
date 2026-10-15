; ---------------------------------------------------------------------------
; BioNpc_UpdateStunned - BIONPC update timer while stunned: shake; when the stun ends restore Update and the draw callback, or OnDeath(1, $D) if dead
; In:  8(a6) = this
; Out: none
; Evidence: installed into the object's timer (+$7C)+$C by BioNpc_TakeDamage; vtable +$72
; ---------------------------------------------------------------------------
BioNpc_UpdateStunned:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$3FFF,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	bls.w	loc_114D00
	moveq	#$0,d0
	move.b	-$38DE(a5),d0
	addq.w	#$1,d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	BioNpc_StunShake(pc)
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$3FFF,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	addq.w	#$8,a7
	bhi.s	loc_114D00
	movea.l	(a4),a0
	movea.l	$7C(a4),a1
	move.l	$4A(a0),$C(a1)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	ext.w	d0
	ext.l	d0
	moveq	#$E,d1
	move.w	$94(a4),d2
	lsr.w	d1,d2
	moveq	#$0,d1
	move.w	d2,d1
	or.l	d0,d1
	move.b	d1,$2E(a4)
	tst.w	$68(a4)
	bgt.s	loc_114CDC
	moveq	#$D,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
	bra.s	loc_114D00
loc_114CDC:
	tst.w	$88(a4)
	blt.s	loc_114D00
	move.w	$88(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_DrawNodes(a5),a0
	lea.l	(a0,d0.w),a3
	movea.l	(a4),a0
	move.l	$1A(a0),$8(a3)
loc_114D00:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
