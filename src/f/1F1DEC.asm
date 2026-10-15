; ---------------------------------------------------------------------------
; XPlayer_TakeDamage - XPLAYER slot +$26: lose health and get knocked back (or die), unless invulnerable
; In:  8(a6) = player, $C(a6) = attacker, $10(a6) = byte damage type (5 left, 6 right, 7 raw, 12 = bounce (in the air: jump velocity again, sound $9E)), $14(a6) = byte damage
; Out: d0
; Evidence: ignored while +$6A > 0; health +$68 -= dmg << 8 (raw for type 7); 0 -> XPlayer_StartDeath; knockback vx +/-$100..$200 by type/attacker facing, vy -$100, hurt sound char +8, +$6A = 40, state +$60 (XPlayer_StateHurt); g_HudDirty
; ---------------------------------------------------------------------------
XPlayer_TakeDamage:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	move.b	$13(a6),d6
	movea.l	$8(a6),a4
	move.b	$17(a6),d0
	ext.w	d0
	move.w	d0,d7
	move.l	a4,-(a7)
	jsr	Player_ClimbState(pc)
	move.b	d0,d4
	tst.w	$6A(a4)
	addq.w	#$4,a7
	bgt.w	loc_1F1FE4
	moveq	#$0,d3
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1F1E3C
	movea.l	g_Camera(a5),a0
	moveq	#$8,d0
	and.w	$4A(a0),d0
	bne.s	loc_1F1E3A
	moveq	#$4,d0
	and.w	$4A(a0),d0
	beq.s	loc_1F1E3C
loc_1F1E3A:
	moveq	#$1,d3
loc_1F1E3C:
	move.b	d3,d5
	cmpi.b	#$C,d6
	bne.s	loc_1F1E8C
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.w	loc_1F1FE4
	movea.l	(a4),a0
	move.l	$5C(a4),d0
	cmp.l	$A6(a0),d0
	bne.w	loc_1F1FE4
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	move.w	$10(a0),$18(a4)
	andi.l	#$FFFFFFF9,$90(a4)
	pea.l	($9E).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($9E).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	bra.w	loc_1F1FE4
loc_1F1E8C:
	tst.w	d7
	beq.s	loc_1F1EDE
	cmpi.b	#$7,d6
	beq.s	loc_1F1E9E
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.w	d0,d7
loc_1F1E9E:
	sub.w	d7,$68(a4)
	tst.w	$68(a4)
	bge.s	loc_1F1EAC
	clr.w	$68(a4)
loc_1F1EAC:
	tst.w	$68(a4)
	bgt.s	loc_1F1ED0
	lea.l	XPlayer_StartDeath(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	move.w	#$7FFF,$6A(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
loc_1F1ED0:
	move.b	#$1,g_HudDirty(a5)
	cmpi.b	#$7,d6
	beq.w	loc_1F1FE4
loc_1F1EDE:
	ori.w	#$40,$6(a4)
	tst.b	d4
	bne.w	loc_1F1FA6
	tst.b	d5
	bne.w	loc_1F1FA6
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	andi.b	#$F7,$2E(a4)
	andi.w	#$BFFF,$6(a4)
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	ori.l	#$8,$90(a4)
	movea.l	$8C(a4),a0
	move.b	$8(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	move.b	$8(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.b	d6,d0
	subq.b	#$5,d0
	lea.l	$C(a7),a7
	beq.s	loc_1F1F50
	subq.b	#$1,d0
	beq.s	loc_1F1F60
	bra.s	loc_1F1F70
loc_1F1F50:
	move.w	#$FE00,$16(a4)
	subi.l	#$600,$8(a4)
	bra.s	loc_1F1F9A
loc_1F1F60:
	move.w	#$200,$16(a4)
	addi.l	#$600,$8(a4)
	bra.s	loc_1F1F9A
loc_1F1F70:
	move.l	a3,d0
	beq.s	loc_1F1F8C
	moveq	#$10,d0
	and.b	$2E(a3),d0
	beq.s	loc_1F1F8C
	move.w	#$FF00,$16(a4)
	subi.l	#$300,$8(a4)
	bra.s	loc_1F1F9A
loc_1F1F8C:
	move.w	#$100,$16(a4)
	addi.l	#$300,$8(a4)
loc_1F1F9A:
	move.w	#$FF00,$18(a4)
	move.w	#$3C,$20(a4)
loc_1F1FA6:
	tst.w	$68(a4)
	bgt.s	loc_1F1FCC
	lea.l	XPlayer_StartDeath(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	move.w	#$9C40,$6A(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	bra.s	loc_1F1FE4
loc_1F1FCC:
	tst.b	d4
	bne.s	loc_1F1FDE
	tst.b	d5
	bne.s	loc_1F1FDE
	move.l	$60(a4),$5C(a4)
	clr.w	$6C(a4)
loc_1F1FDE:
	move.w	#$28,$6A(a4)
loc_1F1FE4:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
