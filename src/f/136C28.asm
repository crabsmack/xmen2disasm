; ---------------------------------------------------------------------------
; Hornet_StateFire - Hornet state: fire a gauss bullet in the facing direction
; In:  8(a6) = this
; Out: d0 = flags & 8 (unused)
; Evidence: GaussBullet_Fire(x +/- 8 px, y + 2 px, this, +/-8, 2, flags 3 | $800 when flipped | $8000 when +$2E bit 2), Obj_ChangeAnim(Tbl_HornetAnimFire), +$5C = Hornet_StateShotRecover
; ---------------------------------------------------------------------------
Hornet_StateFire:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),-$4(a6)
	move.l	$C(a4),d4
	moveq	#$8,d7
	moveq	#$2,d5
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_136C52
	move.l	#$8000,d0
	bra.s	loc_136C54
loc_136C52:
	moveq	#$0,d0
loc_136C54:
	move.l	d0,d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_136C6C
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
	ori.l	#$800,d6
loc_136C6C:
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	add.l	d0,-$4(a6)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	add.l	d0,d4
	ori.l	#$3,d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	move.l	d4,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$2E92(a5)	; -> GaussBullet_Fire
	lea.l	$37DA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	lea.l	$20(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	Hornet_StateShotRecover(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$18(a6),d4-d7/a4
	unlk	a6
	rts
