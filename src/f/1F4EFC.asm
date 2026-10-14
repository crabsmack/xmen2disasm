; ---------------------------------------------------------------------------
; sub_1F4EFC	[jt 2489]
; ---------------------------------------------------------------------------
sub_1F4EFC:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	moveq	#$0,d0
	move.b	-$3A56(a5),d0
	cmpi.w	#$1,d0
	bne.s	loc_1F4F62
	clr.b	-$3A56(a5)
	move.l	#$74000003,($C00004).l
	move.w	-$3AC2(a5),d0
	ext.l	d0
	move.w	-$3AD2(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$1FF,d0
	and.l	d1,d0
	neg.l	d0
	move.w	d0,($C00000).l
	move.l	#$40000010,($C00004).l
	move.w	-$3AC4(a5),d0
	ext.l	d0
	move.w	-$3AD4(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$FF,d0
	and.l	d1,d0
	move.w	d0,($C00000).l
loc_1F4F62:
	moveq	#$0,d0
	move.b	-$3ABA(a5),d0
	cmpi.w	#$1,d0
	beq.s	loc_1F4F7A
	moveq	#$0,d0
	move.b	-$3A58(a5),d0
	cmpi.w	#$1,d0
	bne.s	loc_1F4FCC
loc_1F4F7A:
	clr.b	-$3A58(a5)
	move.l	#$74020003,($C00004).l
	move.w	-$3AC6(a5),d0
	ext.l	d0
	move.w	-$3AD6(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$1FF,d0
	and.l	d1,d0
	neg.l	d0
	move.w	d0,($C00000).l
	move.l	#$40020010,($C00004).l
	move.w	-$3AC8(a5),d0
	ext.l	d0
	move.w	-$3AD8(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$FF,d0
	and.l	d1,d0
	move.w	d0,($C00000).l
loc_1F4FCC:
	moveq	#$0,d0
	move.b	-$3A5C(a5),d0
	cmpi.w	#$1,d0
	bne.s	loc_1F5028
	clr.b	-$3A5C(a5)
	move.l	#$40000010,($C00004).l
	move.w	-$3AC4(a5),d0
	ext.l	d0
	move.w	-$3AD4(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$FF,d0
	and.l	d1,d0
	move.w	d0,($C00000).l
	move.l	#$40020010,($C00004).l
	move.w	-$3AC8(a5),d0
	ext.l	d0
	move.w	-$3AD8(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$FF,d0
	and.l	d1,d0
	move.w	d0,($C00000).l
loc_1F5028:
	moveq	#$0,d0
	move.b	-$3A5A(a5),d0
	cmpi.w	#$1,d0
	bne.s	loc_1F50AE
	clr.b	-$3A5A(a5)
	move.l	#$74000003,($C00004).l
	move.w	-$3AC2(a5),d0
	ext.l	d0
	move.w	-$3AD2(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$1FF,d0
	and.l	d1,d0
	neg.l	d0
	move.w	d0,($C00000).l
	move.l	#$74020003,($C00004).l
	move.w	-$3AC6(a5),d0
	ext.l	d0
	move.w	-$3AD6(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$1FF,d0
	and.l	d1,d0
	neg.l	d0
	move.w	d0,($C00000).l
	move.l	#$40000010,($C00004).l
	clr.w	d7
	moveq	#$28,d3
loc_1F5096:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	-$BC6(a5),a0
	move.w	(a0,d0.w),($C00000).l
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F5096
loc_1F50AE:
	move.w	-$3A90(a5),d0
	cmp.w	-$3A98(a5),d0
	beq.s	loc_1F510A
	move.w	-$3A90(a5),d0
	cmp.w	-$3A98(a5),d0
	ble.s	loc_1F50DE
	move.w	-$3A90(a5),d0
	cmp.w	-$348E(a5),d0
	bne.s	loc_1F50D6
	move.w	-$3A90(a5),d0
	subq.w	#$1,-$3A90(a5)
	bra.s	loc_1F510A
loc_1F50D6:
	move.w	-$3A98(a5),-$3A90(a5)
	bra.s	loc_1F510A
loc_1F50DE:
	move.w	-$3A90(a5),d0
	cmp.w	-$348E(a5),d0
	bne.s	loc_1F50F2
	move.w	-$3A90(a5),d0
	addq.w	#$1,-$3A90(a5)
	bra.s	loc_1F510A
loc_1F50F2:
	move.w	-$348E(a5),d0
	cmp.w	-$3A98(a5),d0
	ble.s	loc_1F5104
	move.w	-$3A98(a5),-$3A90(a5)
	bra.s	loc_1F510A
loc_1F5104:
	move.w	-$348E(a5),-$3A90(a5)
loc_1F510A:
	move.w	-$3A8E(a5),d0
	cmp.w	-$3A96(a5),d0
	beq.s	loc_1F5166
	move.w	-$3A8E(a5),d0
	cmp.w	-$3A96(a5),d0
	bge.s	loc_1F513A
	move.w	-$3A8E(a5),d0
	cmp.w	-$348E(a5),d0
	bne.s	loc_1F5132
	move.w	-$3A8E(a5),d0
	addq.w	#$1,-$3A8E(a5)
	bra.s	loc_1F5166
loc_1F5132:
	move.w	-$3A96(a5),-$3A8E(a5)
	bra.s	loc_1F5166
loc_1F513A:
	move.w	-$3A8E(a5),d0
	cmp.w	-$348E(a5),d0
	bne.s	loc_1F514E
	move.w	-$3A8E(a5),d0
	subq.w	#$1,-$3A8E(a5)
	bra.s	loc_1F5166
loc_1F514E:
	move.w	-$348E(a5),d0
	cmp.w	-$3A96(a5),d0
	bge.s	loc_1F5160
	move.w	-$3A96(a5),-$3A8E(a5)
	bra.s	loc_1F5166
loc_1F5160:
	move.w	-$348E(a5),-$3A8E(a5)
loc_1F5166:
	move.w	-$3A94(a5),d0
	cmp.w	-$3A9C(a5),d0
	beq.s	loc_1F51C2
	move.w	-$3A94(a5),d0
	cmp.w	-$3A9C(a5),d0
	ble.s	loc_1F5196
	move.w	-$3A94(a5),d0
	cmp.w	-$3490(a5),d0
	bne.s	loc_1F518E
	move.w	-$3A94(a5),d0
	subq.w	#$1,-$3A94(a5)
	bra.s	loc_1F51C2
loc_1F518E:
	move.w	-$3A9C(a5),-$3A94(a5)
	bra.s	loc_1F51C2
loc_1F5196:
	move.w	-$3A94(a5),d0
	cmp.w	-$3490(a5),d0
	bne.s	loc_1F51AA
	move.w	-$3A94(a5),d0
	addq.w	#$1,-$3A94(a5)
	bra.s	loc_1F51C2
loc_1F51AA:
	move.w	-$3490(a5),d0
	cmp.w	-$3A9C(a5),d0
	ble.s	loc_1F51BC
	move.w	-$3A9C(a5),-$3A94(a5)
	bra.s	loc_1F51C2
loc_1F51BC:
	move.w	-$3490(a5),-$3A94(a5)
loc_1F51C2:
	move.w	-$3A92(a5),d0
	cmp.w	-$3A9A(a5),d0
	beq.s	loc_1F521E
	move.w	-$3A92(a5),d0
	cmp.w	-$3A9A(a5),d0
	bge.s	loc_1F51F2
	move.w	-$3A92(a5),d0
	cmp.w	-$3490(a5),d0
	bne.s	loc_1F51EA
	move.w	-$3A92(a5),d0
	addq.w	#$1,-$3A92(a5)
	bra.s	loc_1F521E
loc_1F51EA:
	move.w	-$3A9A(a5),-$3A92(a5)
	bra.s	loc_1F521E
loc_1F51F2:
	move.w	-$3A92(a5),d0
	cmp.w	-$3490(a5),d0
	bne.s	loc_1F5206
	move.w	-$3A92(a5),d0
	subq.w	#$1,-$3A92(a5)
	bra.s	loc_1F521E
loc_1F5206:
	move.w	-$3490(a5),d0
	cmp.w	-$3A9A(a5),d0
	bge.s	loc_1F5218
	move.w	-$3A9A(a5),-$3A92(a5)
	bra.s	loc_1F521E
loc_1F5218:
	move.w	-$3490(a5),-$3A92(a5)
loc_1F521E:
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
