; ---------------------------------------------------------------------------
; WallCrawlBio_ActCrawlVertical - WALLCRAWLBIO script action: crawl up/down the wall at speed $80 (v-flip by direction, animation by placement type 1-3)
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: placement word +$A via g_PlacementList and +$14 index; Obj_SetAnim
; ---------------------------------------------------------------------------
WallCrawlBio_ActCrawlVertical:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$A0(a4),d7
	asr.l	#$8,d7
	moveq	#$0,d0
	move.b	$14(a4),d0
	movea.l	g_PlacementList(a5),a0
	asl.l	#$4,d0
	lea.l	(a0,d0.l),a3
	move.w	$A(a3),d0
	subq.w	#$1,d0
	beq.s	loc_11DDC6
	subq.w	#$1,d0
	beq.s	loc_11DDD0
	subq.w	#$1,d0
	beq.s	loc_11DDDA
	bra.s	loc_11DDD0
loc_11DDC6:
	lea.l	$2FA2(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_11DDE2
loc_11DDD0:
	lea.l	$2FAA(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_11DDE2
loc_11DDDA:
	lea.l	$2FB2(a5),a0
	movea.l	$2(a0),a3
loc_11DDE2:
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	cmp.w	$AC(a4),d7
	addq.w	#$8,a7
	bne.s	loc_11DE08
	andi.b	#$F7,$2E(a4)
	addi.l	#$100,$A0(a4)
	move.w	#$80,$18(a4)
	bra.s	loc_11DE1C
loc_11DE08:
	ori.b	#$8,$2E(a4)
	subi.l	#$100,$A0(a4)
	move.w	#$FF80,$18(a4)
loc_11DE1C:
	clr.w	$6C(a4)
	lea.l	WallCrawlBio_WaitReachVLimit(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
