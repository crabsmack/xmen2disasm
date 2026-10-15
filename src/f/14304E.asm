; ---------------------------------------------------------------------------
; TechWallGun_UpdateBullets - timer callback: update every live bullet in the pool
; In:  8(a6) = pool
; Out: none
; Evidence: 16 slots of $10; TechWallGun_UpdateBullet when +$E != 0; created by TechWallGun_ClassInit
; ---------------------------------------------------------------------------
TechWallGun_UpdateBullets:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	a3,a4
	moveq	#$10,d7
	bra.s	loc_143074
loc_143060:
	tst.b	$E(a4)
	beq.s	loc_14306E
	move.l	a4,-(a7)
	jsr	TechWallGun_UpdateBullet(pc)
	addq.w	#$4,a7
loc_14306E:
	subq.w	#$1,d7
	lea.l	$10(a4),a4
loc_143074:
	tst.w	d7
	bne.s	loc_143060
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
