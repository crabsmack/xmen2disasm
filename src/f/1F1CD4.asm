; ---------------------------------------------------------------------------
; XPlayer_Activate - XPLAYER slot +$3E: put the player in play: start its timer, join the hit lists and the draw list
; In:  8(a6) = player
; Out: none
; Evidence: +4 &= $B3FF; Timer_Start; HitList_Add to g_HitListPlayerAtk/Body (enemy lists when +$90 bit $1000000); DrawList_Add(vtable +$1A); g_HudDirty
; ---------------------------------------------------------------------------
XPlayer_Activate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$B3FF,$4(a4)
	move.l	$7C(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	move.l	#$1000000,d0
	and.l	$90(a4),d0
	addq.w	#$4,a7
	beq.s	loc_1F1D1C
	pea.l	g_HitListEnemyAtk(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$80(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	lea.l	$10(a7),a7
	bra.s	loc_1F1D3C
loc_1F1D1C:
	pea.l	g_HitListPlayerAtk(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$80(a4)
	pea.l	g_HitListPlayerBody(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	lea.l	$10(a7),a7
loc_1F1D3C:
	tst.w	$88(a4)
	bge.s	loc_1F1D7A
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	and.w	$6(a4),d1
	moveq	#$0,d2
	move.w	d1,d2
	move.l	d2,-(a7)
	moveq	#$0,d1
	move.b	$42(a4),d1
	move.l	d1,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	move.l	$1A(a0),-(a7)
	jsr	$4F6A(a5)	; -> DrawList_Add
	move.w	d0,$88(a4)
	lea.l	$18(a7),a7
loc_1F1D7A:
	move.b	#$1,g_HudDirty(a5)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
