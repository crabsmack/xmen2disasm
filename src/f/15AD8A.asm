; ---------------------------------------------------------------------------
; SegHook_HurtPlayerStop - segment-type hook: touching this segment stops the object and hurts a player (1 damage, type 4)
; In:  8(a6) = word event (0 = touch), $C(a6) = segment, $10(a6) = object, $14(a6) = pointer flags
; Out: d0 = 0
; Evidence: event 0: *flags &= ~8, obj +4 |= $100 (blocked); players without hit cooldown -> vtable +$26(obj, 0, 4, 1, 0, 0); installed in the segment hook table (-$3402 = type $16) by scene code
; ---------------------------------------------------------------------------
SegHook_HurtPlayerStop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$10(a6),a4
	tst.w	$A(a6)
	bne.s	loc_15ADE2
	movea.l	$14(a6),a0
	andi.w	#$FFF7,(a0)
	ori.w	#$100,$4(a4)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_15ADB8
	lea.l	g_Player2(a5),a0
	cmpa.l	a4,a0
	bne.s	loc_15ADDE
loc_15ADB8:
	tst.w	$6A(a4)
	bne.s	loc_15ADDE
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
loc_15ADDE:
	moveq	#$0,d0
	bra.s	loc_15ADE4
loc_15ADE2:
	moveq	#$0,d0
loc_15ADE4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
