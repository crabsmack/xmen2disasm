; ---------------------------------------------------------------------------
; XClone_TakeDamage - vtable +$26: +$B8 += 60, parent TakeDamage; if the hit kills it and the attacker is the same character, set bit (8+type) in -$3B08; spark effect and sound $D8 at the hit point; hurt frame from the clone record
; Evidence: Clone_CharTypeOf on both; Debris_Spawn(x, y, -$3B1C, size 6..16) + Snd $D8; SetFrame(record +$AC byte $28); TAS 53176-57449
; ---------------------------------------------------------------------------
XClone_TakeDamage:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	move.b	$17(a6),d4
	movea.l	$C(a6),a3
	move.w	$1E(a6),d5
	move.w	$1A(a6),d6
	movea.l	$8(a6),a4
	move.w	$A6(a4),-$2(a6)
	move.l	a4,-(a7)
	jsr	Clone_CharTypeOf(pc)
	move.w	d0,d7
	addi.b	#$3C,$B8(a4)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.w	d4
	ext.l	d4
	move.l	d4,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	lea.l	$1902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	lea.l	$1C(a7),a7
	bne.s	loc_0957C8
	tst.w	$68(a4)
	bgt.s	loc_0957E0
loc_0957C8:
	move.l	a3,-(a7)
	jsr	Clone_CharTypeOf(pc)
	cmp.w	d7,d0
	addq.w	#$4,a7
	bne.s	loc_0957E0
	move.b	d7,d0
	addq.b	#$8,d0
	moveq	#$1,d1
	lsl.l	d0,d1
	or.w	d1,-$3B08(a5)
loc_0957E0:
	tst.w	d6
	ble.s	loc_09584C
	tst.w	d5
	ble.s	loc_09584C
	ext.w	d4
	ext.l	d4
	move.l	d4,d7
	lsl.l	#$1,d7
	cmpi.w	#$6,d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0957FE
	move.w	d7,d0
	bra.s	loc_095800
loc_0957FE:
	moveq	#$6,d0
loc_095800:
	move.w	d0,d7
	cmpi.w	#$10,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_095810
	move.w	d7,d0
	bra.s	loc_095812
loc_095810:
	moveq	#$10,d0
loc_095812:
	move.w	d0,d7
	ext.l	d7
	move.l	d7,-(a7)
	move.l	-$3B1C(a5),-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3B6A(a5)	; -> Debris_Spawn
	pea.l	($D8).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D8).w
	jsr	$521A(a5)	; -> Snd_Play
	move.w	-$2(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	-$3B1C(a5),-(a7)
	jsr	$3B4A(a5)	; -> Debris_SetFloorY
	lea.l	$20(a7),a7
loc_09584C:
	moveq	#$10,d0
	and.w	$4(a4),d0
	bne.s	loc_09586C
	movea.l	$AC(a4),a0
	moveq	#$0,d0
	move.b	$28(a0),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_09586C:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
