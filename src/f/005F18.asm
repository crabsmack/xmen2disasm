; ---------------------------------------------------------------------------
; unk_Player_005F18 - when both players are alive, move P2's two list nodes from lists $FFEBA2/$FFEBA6 to $FFEBAA/$FFEBAE and set P2 +$2E bits 0-1 = 3
; In:  none
; Out: none
; Evidence: jt 3; callers loc_15C5D6 and Players_PlaceAtStart; List_Unlink + HitList_Add (allocate node, push obj on list head). What the lists mean (draw order? palette?) is not known; never ran in the corpus
; ---------------------------------------------------------------------------
unk_Player_005F18:
	link.w	a6,#$0
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_005F9E
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_005F9E
	pea.l	g_HitListPlayerAtk(a5)
	move.l	-$17C8(a5),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,-$17C8(a5)
	pea.l	g_HitListPlayerBody(a5)
	move.l	-$17C4(a5),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,-$17C4(a5)
	pea.l	g_HitListEnemyAtk(a5)
	pea.l	g_Player2(a5)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,-$17C8(a5)
	pea.l	g_HitListEnemyBody(a5)
	pea.l	g_Player2(a5)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,-$17C4(a5)
	moveq	#-$4,d0
	and.b	-$181A(a5),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,-$181A(a5)
loc_005F9E:
	unlk	a6
	rts
