; ---------------------------------------------------------------------------
; sub_00FC12	[link-after-rts]
; ---------------------------------------------------------------------------
sub_00FC12:
	link.w	a6,#$0
	move.w	$A(a6),-$348E(a5)
	move.w	$E(a6),-$3490(a5)
	move.w	-$348E(a5),d0
	cmp.w	-$3A8E(a5),d0
	ble.s	loc_00FC32
	move.w	-$3A8E(a5),-$348E(a5)
loc_00FC32:
	move.w	-$348E(a5),d0
	cmp.w	-$3A90(a5),d0
	bge.s	loc_00FC42
	move.w	-$3A90(a5),-$348E(a5)
loc_00FC42:
	move.w	-$3490(a5),d0
	cmp.w	-$3A92(a5),d0
	ble.s	loc_00FC52
	move.w	-$3A92(a5),-$3490(a5)
loc_00FC52:
	move.w	-$3490(a5),d0
	cmp.w	-$3A94(a5),d0
	bge.s	loc_00FC62
	move.w	-$3A94(a5),-$3490(a5)
loc_00FC62:
	move.w	-$348E(a5),-$3AC2(a5)
	move.w	-$3490(a5),-$3AC4(a5)
	tst.b	-$3AC0(a5)
	beq.s	loc_00FC7A
	addi.w	#$100,-$3ACC(a5)
loc_00FC7A:
	clr.b	-$3AC0(a5)
	jsr	$4D9A(a5)	; -> sub_1F485A
	movea.l	-$3A54(a5),a0
	jsr	(a0)
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> sub_1F4854
	move.b	#$1,-$3A56(a5)
	move.b	-$3A64(a5),-$3A58(a5)
	unlk	a6
	rts
