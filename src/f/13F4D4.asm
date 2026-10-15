; ---------------------------------------------------------------------------
; Debris_CreatePool - allocate a debris pool for n pieces, load its graphics and start its update timer
; In:  8(a6) = word n  $C(a6) = sprite definition (0 = none)  $13(a6) = byte SprDef_Add arg
; Out: d0 = pool
; Evidence: Mem_StackAlloc(n*$14 + $C, Str_DebrisPoolTag); header {+0 byte used, +1 byte max, +2 floor 400, +4 SprDef_Add slot or -1, +6 timer, +$A bounce limit}; Timer_Create(Debris_Update, 0, pool, 1); Debris_SetBounceLimit(4); callers BigAcolyte_ActAppear, CloneA5_RunScene (jt 1896)
; ---------------------------------------------------------------------------
Debris_CreatePool:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	move.w	$A(a6),d6
	move.w	d6,d1
	ext.l	d1
	lsl.l	#$2,d1
	move.l	d1,d0
	lsl.l	#$2,d1
	add.l	d0,d1
	move.w	d1,d7
	pea.l	Str_DebrisPoolTag(pc)
	ext.l	d7
	move.l	d7,d0
	moveq	#$C,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	movea.l	d0,a4
	clr.b	(a4)
	move.b	d6,$1(a4)
	move.w	#$190,$2(a4)
	move.l	a3,d0
	addq.w	#$8,a7
	beq.s	loc_13F530
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,$4(a4)
	addq.w	#$8,a7
	bra.s	loc_13F536
loc_13F530:
	move.w	#$FFFF,$4(a4)
loc_13F536:
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	Debris_Update(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,$6(a4)
	lea.l	$10(a7),a7
	beq.s	loc_13F55C
	move.l	$6(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_13F55C:
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Debris_SetBounceLimit(pc)
	lea.l	$C(a4),a3
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.l	a4,d0
	lea.l	$14(a7),a7
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
