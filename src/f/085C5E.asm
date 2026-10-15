; ---------------------------------------------------------------------------
; LittleLeg_New - LITTLELEG slot +$0A: create a little-leg object at (x, y): three sprites, an update timer and a draw-list entry
; In:  8(a6) = unused, $C(a6) = word x, $10(a6) = word y
; Out: d0 = object (0 if out of memory)
; Evidence: Mem_StackAlloc($68), Mem_Set, vtable Tbl_LittleLeg_vtable, x/y into +4/+8 and +6/+A, three sprite instances via Spr_SetFromDef, walking on; Timer_Create(slot +$0E, 1, this, 1) -> +$62; DrawList_Add(slot +$12, ...) -> +$66; called by BroodBoss_StateSetup at (x+$6A, y-$24); TAS 49291
; Found: jt 612
; ---------------------------------------------------------------------------
LittleLeg_New:
	link.w	a6,#$0
	move.l	a4,-(a7)
	pea.l	Str_Empty_085D4A(pc)
	moveq	#$68,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	movea.l	d0,a4
	move.l	a4,d0
	addq.w	#$8,a7
	beq.w	loc_085D40
	moveq	#$68,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	lea.l	$14EA(a5),a0
	move.l	$2(a0),(a4)
	move.w	$E(a6),$8(a4)
	move.w	$E(a6),$4(a4)
	move.w	$12(a6),$A(a4)
	move.w	$12(a6),$6(a4)
	move.w	g_SceneVar3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	$16(a4)
	jsr	$3F42(a5)	; -> Spr_SetFromDef
	ori.b	#$4,$16(a4)
	move.w	g_SceneVar3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	$32(a4)
	jsr	$3F42(a5)	; -> Spr_SetFromDef
	ori.b	#$4,$32(a4)
	move.w	g_SceneVar3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	$4E(a4)
	jsr	$3F42(a5)	; -> Spr_SetFromDef
	ori.b	#$4,$4E(a4)
	clr.b	$C(a4)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	LittleLeg_SetWalking(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	movea.l	(a4),a0
	move.l	$E(a0),-(a7)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,$62(a4)
	lea.l	$3C(a7),a7
	beq.s	loc_085D1E
	move.l	$62(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_085D1E:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$7F,d1
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	move.l	$12(a0),-(a7)
	jsr	$4F6A(a5)	; -> DrawList_Add
	move.w	d0,$66(a4)
	lea.l	$18(a7),a7
loc_085D40:
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
