; ---------------------------------------------------------------------------
; XClone_SpawnByType - create the evil clone of the type in a spawn record (1 Beast, 2 Cyclops, 3 Gambit, 4 Magneto, 5 Nightcrawler, 6 Psylocke, 7 Wolverine)
; In:  8(a6) = record {+2 x, +4 y, +6 type}, $C(a6) = player (used when type = 0)
; Out: d0 = object or 0
; Evidence: switch on type -> Tbl_EvilBeast/Cyclops/Gambit/Magneto/Nightcrawler/Psylocke/Wolverine_vtable +$0E New(0, desc, x << 8, y << 8, rec); type 0 -> Clone_CharTypeOf(player); jt 791
; Found: jt 791
; ---------------------------------------------------------------------------
XClone_SpawnByType:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	movea.l	d0,a3
	move.w	$6(a4),d7
	bne.s	loc_098DD0
	tst.l	$C(a6)
	beq.s	loc_098DD0
	move.l	$C(a6),-(a7)
	jsr	Clone_CharTypeOf(pc)
	move.w	d0,d7
	addq.w	#$4,a7
loc_098DD0:
	move.w	d7,d0
	subq.w	#$1,d0
	bmi.w	XClone_SpawnByType_Done
	cmpi.w	#$6,d0
	bgt.w	XClone_SpawnByType_Done
	add.w	d0,d0
	move.w	Sw_098DA8(pc,d0.w),d0
	jmp	Sw_098DA8-2(pc,d0.w)
