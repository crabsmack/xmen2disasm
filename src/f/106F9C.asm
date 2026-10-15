; ---------------------------------------------------------------------------
; Platform1_SteerByPad_LeftRight - case of Platform1_SteerByPad: Left gives -speed, Right gives +speed
; In:  a3 = player, a4 = this, d7 = speed
; Out: -
; Evidence: switch target inside Platform1_SteerByPad
; ---------------------------------------------------------------------------
Platform1_SteerByPad_LeftRight:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_106FB0
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_106FB8
loc_106FB0:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_106FB8:
	beq.s	loc_106FC8
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.w	loc_1070DE
loc_106FC8:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_106FDC
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_106FE4
loc_106FDC:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_106FE4:
	beq.w	loc_1070DE
	move.w	d7,$16(a4)
	bra.w	loc_1070DE
loc_106FF0:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_107004
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_10700C
loc_107004:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_10700C:
	beq.s	loc_10701C
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.w	loc_1070DE
loc_10701C:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_107030
	move.w	-$3B9E(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_107038
loc_107030:
	move.w	-$3B9E(a5),d0
	and.w	-$3A38(a5),d0
loc_107038:
	beq.w	loc_1070DE
	move.w	d7,$16(a4)
	bra.w	loc_1070DE
loc_107044:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_107058
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_107060
loc_107058:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_107060:
	beq.s	loc_107068
	move.w	d7,$16(a4)
	bra.s	loc_1070DE
loc_107068:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_10707C
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_107084
loc_10707C:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_107084:
	beq.s	loc_1070DE
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.s	loc_1070DE
