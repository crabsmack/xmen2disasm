; ---------------------------------------------------------------------------
; sub_081BE6	[jt 553]
; ---------------------------------------------------------------------------
sub_081BE6:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	lea.l	$81CC4(pc),a4
	tst.w	-$3B32(a5)
	bne.s	loc_081C3C
	move.w	#$2,-$3B32(a5)
	tst.w	-$3B3A(a5)
	bne.s	loc_081C0A
	move.w	#$1A,-$3B3A(a5)
loc_081C0A:
	subq.w	#$1,-$3B3A(a5)
	move.w	-$3B3A(a5),d0
	move.b	(a4,d0.w),d0
	subq.b	#$1,d0
	move.b	d0,d7
	beq.s	loc_081C2A
	move.w	#$468,-$3966(a5)
	move.w	#$8EE,-$3964(a5)
	bra.s	loc_081C36
loc_081C2A:
	move.w	#$68,-$3966(a5)
	move.w	#$8CC,-$3964(a5)
loc_081C36:
	move.b	#$1,-$3A06(a5)
loc_081C3C:
	subq.w	#$1,-$3B32(a5)
	tst.w	-$3B34(a5)
	bne.s	loc_081CB6
	move.w	#$9,-$3B34(a5)
	tst.w	-$3B3C(a5)
	bne.s	loc_081C58
	move.w	#$6,-$3B3C(a5)
loc_081C58:
	subq.w	#$1,-$3B3C(a5)
	move.w	-$3B3C(a5),d0
	bmi.s	loc_081CAC
	cmpi.w	#$5,d0
	bgt.s	loc_081CAC
	add.w	d0,d0
	move.w	$81C72(pc,d0.w),d0
	jmp	$81C70(pc,d0.w)
