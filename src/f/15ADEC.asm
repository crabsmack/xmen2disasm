; ---------------------------------------------------------------------------
; SegHook_HurtPlayer - segment-type hook: touching this segment hurts a player (1 damage, type 4)
; In:  8(a6) = word event (0 = touch), $C(a6) = segment, $10(a6) = object, $14(a6) = pointer flags
; Out: d0 = 1 when handled
; Evidence: like SegHook_HurtPlayerStop without blocking; CloneA2_InstallHooks stores its jt address in -$3402 (segment type $16 hook)
; ---------------------------------------------------------------------------
SegHook_HurtPlayer:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$10(a6),a4
	tst.w	$A(a6)
	bne.s	loc_15AE3E
	movea.l	$14(a6),a0
	andi.w	#$FFF7,(a0)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_15AE14
	lea.l	g_Player2(a5),a0
	cmpa.l	a4,a0
	bne.s	loc_15AE3A
loc_15AE14:
	tst.w	$6A(a4)
	bne.s	loc_15AE3A
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_15AE3A:
	moveq	#$1,d0
	bra.s	loc_15AE40
loc_15AE3E:
	moveq	#$0,d0
loc_15AE40:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
