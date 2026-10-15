; ---------------------------------------------------------------------------
; TechWallGun_UpdateBullet_Draw - TechWallGun_UpdateBullet tail: build the bullet's sprite attributes (frame, flips, priority) and write it to the sprite table
; In:  a3 = bullet slot, a6 frame of TechWallGun_UpdateBullet
; Out: d0
; Evidence: tile = g_TechWallGunSprDef record base | $6000 + frame*4, flips from +$E bits $20/$10, priority from the live player; reached from every switch case
; ---------------------------------------------------------------------------
TechWallGun_UpdateBullet_Draw:
	move.w	g_TechWallGunSprDef(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	move.w	#$6000,d1
	or.w	$6(a0,d0.w),d1
	ext.l	d1
	move.l	d1,d7
	move.b	$E(a3),d0
	ext.w	d0
	move.w	#$F0,d1
	and.b	d0,d1
	moveq	#$0,d6
	move.b	d1,d6
	move.b	$F(a3),d0
	ext.w	d0
	ext.l	d0
	lsl.l	#$2,d0
	add.l	d0,d7
	moveq	#$20,d0
	and.l	d6,d0
	beq.s	loc_142FB6
	ori.l	#$800,d7
loc_142FB6:
	moveq	#$10,d0
	and.l	d6,d0
	beq.s	loc_142FC2
	ori.l	#$1000,d7
loc_142FC2:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_142FE6
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
	bra.s	loc_142FEC
loc_142FE6:
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
loc_142FEC:
	movea.l	d0,a0
	moveq	#$4,d0
	and.b	$2E(a0),d0
	beq.s	loc_142FFC
	ori.l	#$8000,d7
loc_142FFC:
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	d5,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$5,$2(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	d7,$4(a0)
	move.w	d4,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
loc_143044:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
