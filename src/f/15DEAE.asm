; ---------------------------------------------------------------------------
; HitList_Init - clear the four hit-list heads and the 50-node pool
; In:  none
; Out: none
; Evidence: heads $FFEBA2 (player attackers), $FFEBA6 (player bodies), $FFEBAA (enemy attackers), $FFEBAE (enemy bodies); 50 nodes x $C at $FFEBB2 with +8 owner = 0
; ---------------------------------------------------------------------------
HitList_Init:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	g_HitNodes(a5),a3
	movea.l	a3,a4
	moveq	#$0,d0
	move.l	d0,g_HitListEnemyBody(a5)
	move.l	d0,g_HitListEnemyAtk(a5)
	move.l	d0,g_HitListPlayerBody(a5)
	move.l	d0,g_HitListPlayerAtk(a5)
	clr.w	d7
	moveq	#$32,d3
loc_15DED2:
	moveq	#$0,d0
	move.l	d0,$8(a4)
	lea.l	$C(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_15DED2
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
