; ---------------------------------------------------------------------------
; SmallBrood_Shoot - SMALLBROOD slot +$82: fire a shot from offset (dx, dy), mirrored by the sprite flips
; In:  8(a6) = this, $C(a6) = word dx, $10(a6) = word dy, $14(a6) = byte: 1 = shot belongs to this object
; Out: none
; Evidence: GaussBullet_Fire(x + dx*256, y + dy*256, owner, dx, dy, flags) allocates a shot in the pool at $FFE554 (speed $C00, sound $ED); h-flip (+$2E bit 4) negates dx and sets $800, v-flip (bit 3) negates dy; called by SmallBrood_StateFire with ($12, -$1C, 0); jt 588
; Found: jt 588
; ---------------------------------------------------------------------------
SmallBrood_Shoot:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	move.w	$12(a6),d6
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	move.l	$8(a4),-$4(a6)
	move.l	$C(a4),d4
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_08461C
	move.l	#$8000,d0
	bra.s	loc_08461E
loc_08461C:
	moveq	#$0,d0
loc_08461E:
	move.l	d0,d5
	moveq	#$0,d0
	movea.l	d0,a3
	moveq	#$8,d1
	and.b	$2E(a4),d1
	beq.s	loc_084634
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	move.w	d0,d6
loc_084634:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_08464A
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
	ori.l	#$800,d5
loc_08464A:
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	add.l	d0,-$4(a6)
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	add.l	d0,d4
	tst.b	$17(a6)
	beq.s	loc_08466A
	movea.l	a4,a3
	ori.l	#$2,d5
loc_08466A:
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a3,-(a7)
	move.l	d4,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$2E92(a5)	; -> GaussBullet_Fire
	lea.l	$18(a7),a7
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
