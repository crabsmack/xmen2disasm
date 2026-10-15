; ---------------------------------------------------------------------------
; ICandy_PoolInit - set up the ICandy pool: base, slot stride and count; clear every slot's flags (0 disables the pool)
; In:  8(a6) = base  $E(a6) = word stride  $12(a6) = word count
; Out: none
; Evidence: writes $FFE54E/$FFE54C/$FFE552 read by ICandy_PoolAlloc; called from Scene_PreLoadReset and BROODBOSS setup
; ---------------------------------------------------------------------------
ICandy_PoolInit:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$E(a6),d6
	moveq	#$0,d0
	movea.l	d0,a4
	move.w	$12(a6),g_ICandyCount(a5)
	move.l	$8(a6),g_ICandyPool(a5)
	tst.w	g_ICandyCount(a5)
	beq.s	loc_118788
	tst.l	g_ICandyPool(a5)
	bne.s	loc_118798
loc_118788:
	clr.w	g_ICandyCount(a5)
	clr.w	g_ICandyStride(a5)
	moveq	#$0,d0
	move.l	d0,g_ICandyPool(a5)
	bra.s	loc_1187B8
loc_118798:
	move.w	d6,g_ICandyStride(a5)
	moveq	#$0,d7
	movea.l	g_ICandyPool(a5),a4
	bra.s	loc_1187AE
loc_1187A4:
	clr.w	$4(a4)
	move.l	d7,d0
	addq.l	#$1,d7
	adda.w	d6,a4
loc_1187AE:
	move.w	g_ICandyCount(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_1187A4
loc_1187B8:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
