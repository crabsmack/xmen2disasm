; ---------------------------------------------------------------------------
; Cerebro_TextOpSetCursor - text script ops 1-3 (set cursor, wait N frames, clear window + set cursor)
; In:  a4 = script pointer
; Out: none
; Evidence: cases 1-3 of Sw_065532 in Cerebro_RunTextScript; cursor g_SceneVar3B04/g_SceneVar3B06 = window origin g_TextWinLeft/g_TextWinTop + signed bytes
; ---------------------------------------------------------------------------
Cerebro_TextOpSetCursor:
	move.b	(a4)+,d0
	ext.w	d0
	move.w	g_TextWinLeft(a5),d1
	add.w	d0,d1
	move.w	d1,g_SceneVar3B04(a5)
	move.b	(a4)+,d0
	ext.w	d0
	move.w	g_TextWinTop(a5),d1
	add.w	d0,d1
	move.w	d1,g_SceneVar3B06(a5)
	bra.w	loc_06569A
loc_0655E4:
	move.w	(a4)+,d7
	moveq	#$3,d0
	cmp.b	(a4),d0
	beq.s	loc_0655F0
	tst.b	(a4)
	bne.s	loc_0655F6
loc_0655F0:
	move.w	#$2,g_SceneVar3B02(a5)
loc_0655F6:
	jsr	Cerebro_FrameHook(pc)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	subq.w	#$1,d7
	tst.w	d7
	beq.w	loc_06569A
	moveq	#$2,d0
	cmp.w	g_SceneVar3B02(a5),d0
	beq.s	loc_0655F6
	bra.w	loc_06569A
loc_065612:
	move.w	#$2,g_SceneVar3B02(a5)
	jsr	Cerebro_ClearTextWindow(pc)
	move.b	(a4)+,d0
	ext.w	d0
	move.w	g_TextWinLeft(a5),d1
	add.w	d0,d1
	move.w	d1,g_SceneVar3B04(a5)
	move.b	(a4)+,d0
	ext.w	d0
	move.w	g_TextWinTop(a5),d1
	add.w	d0,d1
	move.w	d1,g_SceneVar3B06(a5)
	bra.s	loc_06569A
