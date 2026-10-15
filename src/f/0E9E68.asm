; ---------------------------------------------------------------------------
; Hologram_WaitPlayersInArena - Hologram: when both players are in the arena, lock it and start the script after 60 frames
; In:  8(a6) = this
; Out: none
; Evidence: Hologram_PlayerInArena for both players, Hologram_LockArena; script pointer +$8E, index +$8C; TAS frame 7812
; ---------------------------------------------------------------------------
Hologram_WaitPlayersInArena:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_Player1(a5)
	move.l	a4,-(a7)
	jsr	Hologram_PlayerInArena(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_0E9ECC
	pea.l	g_Player2(a5)
	move.l	a4,-(a7)
	jsr	Hologram_PlayerInArena(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_0E9ECC
	move.l	a4,-(a7)
	jsr	Hologram_LockArena(pc)
	tst.l	$8E(a4)
	addq.w	#$4,a7
	bne.s	loc_0E9EAE
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_0E9ECC
loc_0E9EAE:
	clr.w	$8C(a4)
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_0E9ECC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
