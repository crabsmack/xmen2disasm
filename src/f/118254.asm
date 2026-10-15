; ---------------------------------------------------------------------------
; ObjList_ForEachInBox - walk an object list and call fn(actor, x1, y1) for every actor whose box overlaps (x1,y1)-(x2,y2) (skipping hit-cooldown actors unless asked); stop when fn returns true
; In:  $A/$E(a6) = word x1, y1  $12/$16(a6) = word x2, y2  $18(a6) = list head  $1C(a6) = fn  $23(a6) = byte include invulnerable
; Out: d0.b = 1 if anything overlapped
; Evidence: list nodes {next, ?, actor}; boxes +$54-$5A; used by Explosion_Update with lists $FFEBAE/$FFEBA6
; ---------------------------------------------------------------------------
ObjList_ForEachInBox:
	link.w	a6,#$FFFE
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$18(a6),a3
	move.w	$16(a6),d4
	move.w	$12(a6),d5
	move.w	$E(a6),d6
	move.w	$A(a6),d7
	clr.b	-$1(a6)
	bra.s	loc_1182C2
loc_118276:
	movea.l	$8(a3),a4
	cmp.w	$5A(a4),d7
	bgt.s	loc_1182C0
	cmp.w	$56(a4),d5
	blt.s	loc_1182C0
	cmp.w	$58(a4),d6
	bgt.s	loc_1182C0
	cmp.w	$54(a4),d4
	blt.s	loc_1182C0
	tst.b	$23(a6)
	bne.s	loc_11829E
	tst.w	$6A(a4)
	bne.s	loc_1182C0
loc_11829E:
	move.b	#$1,-$1(a6)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	$1C(a6),a0
	jsr	(a0)
	tst.b	d0
	lea.l	$C(a7),a7
	beq.s	loc_1182C0
	moveq	#$1,d0
	bra.s	loc_1182CA
loc_1182C0:
	movea.l	(a3),a3
loc_1182C2:
	move.l	a3,d0
	bne.s	loc_118276
	move.b	-$1(a6),d0
loc_1182CA:
	movem.l	-$1A(a6),d4-d7/a3-a4
	unlk	a6
	rts
