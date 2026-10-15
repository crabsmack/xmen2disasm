; ---------------------------------------------------------------------------
; XPlayer_Deactivate - XPLAYER slot +$46: take the player out of play: stop its timer, leave the hit lists and the draw list
; In:  8(a6) = player
; Out: none
; Evidence: +4 |= $4000; Timer_Stop(+$7C); List_Unlink from g_HitListPlayerAtk/Body, or the enemy lists when +$90 bit $1000000; DrawList_Remove; g_HudDirty = 1
; ---------------------------------------------------------------------------
XPlayer_Deactivate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_1F1CCC
	ori.w	#$4000,$4(a4)
	andi.b	#$DF,$2E(a4)
	move.b	#$FF,$3B(a4)
	move.b	#$FF,$3A(a4)
	move.l	$7C(a4),-(a7)
	jsr	$4FE2(a5)	; -> Timer_Stop
	move.l	#$1000000,d0
	and.l	$90(a4),d0
	addq.w	#$4,a7
	beq.s	loc_1F1C82
	pea.l	g_HitListEnemyAtk(a5)
	move.l	$80(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$80(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	lea.l	$10(a7),a7
	bra.s	loc_1F1CAA
loc_1F1C82:
	pea.l	g_HitListPlayerAtk(a5)
	move.l	$80(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$80(a4)
	pea.l	g_HitListPlayerBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	lea.l	$10(a7),a7
loc_1F1CAA:
	moveq	#-$1,d0
	cmp.w	$88(a4),d0
	bge.s	loc_1F1CC6
	move.w	$88(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F72(a5)	; -> DrawList_Remove
	move.w	#$FFFF,$88(a4)
	addq.w	#$4,a7
loc_1F1CC6:
	move.b	#$1,g_HudDirty(a5)
loc_1F1CCC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
