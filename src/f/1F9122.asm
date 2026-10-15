; ---------------------------------------------------------------------------
; DrawList_Remove - unlink draw-list node N and free it
; In:  8(a6) = word: node index (0-29)
; Out: d0 = byte g_DrawListZero(a5)
; Evidence: ignored unless flags bit $8000 set; clears flags, fixes next/prev and head/tail; callers pass the index saved from DrawList_Add then set it to -1
; ---------------------------------------------------------------------------
DrawList_Remove:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	lea.l	g_DrawNodes(a5),a3
	move.w	$A(a6),d7
	blt.s	loc_1F913A
	cmpi.w	#$1D,d7
	ble.s	loc_1F9142
loc_1F913A:
	move.b	g_DrawListZero(a5),d0
	bra.w	loc_1F91DE
loc_1F9142:
	move.l	d7,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	(a3,d0.w),a4
	moveq	#$0,d0
	move.w	$12(a4),d0
	move.w	#$8000,d1
	and.w	d0,d1
	bne.s	loc_1F9166
	move.b	g_DrawListZero(a5),d0
	bra.s	loc_1F91DE
loc_1F9166:
	clr.w	$12(a4)
	tst.l	$4(a4)
	bne.s	loc_1F919E
	tst.l	(a4)
	beq.s	loc_1F9192
	tst.l	(a4)
	beq.s	loc_1F9180
	movea.l	(a4),a0
	move.l	$4(a4),$4(a0)
loc_1F9180:
	tst.l	$4(a4)
	beq.s	loc_1F918C
	movea.l	$4(a4),a0
	move.l	(a4),(a0)
loc_1F918C:
	move.l	(a4),g_DrawListHead(a5)
	bra.s	loc_1F91DA
loc_1F9192:
	moveq	#$0,d0
	move.l	d0,g_DrawListTail(a5)
	move.l	d0,g_DrawListHead(a5)
	bra.s	loc_1F91DA
loc_1F919E:
	tst.l	(a4)
	bne.s	loc_1F91C2
	tst.l	(a4)
	beq.s	loc_1F91AE
	movea.l	(a4),a0
	move.l	$4(a4),$4(a0)
loc_1F91AE:
	tst.l	$4(a4)
	beq.s	loc_1F91BA
	movea.l	$4(a4),a0
	move.l	(a4),(a0)
loc_1F91BA:
	move.l	$4(a4),g_DrawListTail(a5)
	bra.s	loc_1F91DA
loc_1F91C2:
	tst.l	(a4)
	beq.s	loc_1F91CE
	movea.l	(a4),a0
	move.l	$4(a4),$4(a0)
loc_1F91CE:
	tst.l	$4(a4)
	beq.s	loc_1F91DA
	movea.l	$4(a4),a0
	move.l	(a4),(a0)
loc_1F91DA:
	move.b	g_DrawListZero(a5),d0
loc_1F91DE:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
