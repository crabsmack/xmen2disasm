; ---------------------------------------------------------------------------
; BioNpc_TakeDamage - BioNpc: receive a hit from an attacker: damage, hurt state, invulnerability timer (class slot 8, +$26)
; In:  8(a6) = this  $C(a6) = attacker  $13(a6) = byte hit type  $17(a6) = byte damage  $1A/$1E(a6) = words
; Out: none
; Evidence: method 8 of class descriptor $113B10 (name string "BIONPC", parent XNPC)
; ---------------------------------------------------------------------------
BioNpc_TakeDamage:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	move.b	$17(a6),d6
	move.b	$13(a6),d7
	movea.l	$8(a6),a4
	move.w	#$1E,$6A(a4)
	move.b	d7,d0
	subi.b	#$D,d0
	beq.s	loc_114D36
	subq.b	#$1,d0
	beq.s	loc_114D52
	subq.b	#$1,d0
	beq.s	loc_114D6C
	bra.s	loc_114D86
loc_114D36:
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$1E,d1
	or.w	d0,d1
	move.w	d1,$94(a4)
	bra.w	loc_114DD2
loc_114D52:
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$1E,d1
	or.w	d0,d1
	move.w	d1,$94(a4)
	bra.s	loc_114DD2
loc_114D6C:
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$1E,d1
	or.w	d0,d1
	move.w	d1,$94(a4)
	bra.s	loc_114DD2
loc_114D86:
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$3FFF,d1
	and.w	d0,d1
	bne.w	loc_114E66
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BDA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
	bra.w	loc_114E66
loc_114DD2:
	lea.l	BioNpc_UpdateStunned(pc),a0
	movea.l	$7C(a4),a1
	move.l	a0,$C(a1)
	tst.w	$88(a4)
	blt.s	loc_114E02
	move.w	$88(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_DrawNodes(a5),a0
	lea.l	(a0,d0.w),a3
	lea.l	BioNpc_DrawStunned(pc),a0
	move.l	a0,$8(a3)
loc_114E02:
	ext.w	d6
	sub.w	d6,$68(a4)
	moveq	#$3,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	moveq	#$E,d0
	lsl.l	d0,d1
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$3FFF,d2
	and.w	d0,d2
	moveq	#$0,d0
	move.w	d2,d0
	or.l	d1,d0
	move.w	d0,$94(a4)
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$7(a0),d0
	cmpi.w	#$FF,d0
	addq.w	#$8,a7
	beq.s	loc_114E66
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_114E66:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
