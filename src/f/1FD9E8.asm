; ---------------------------------------------------------------------------
; sub_1FD9E8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1FD9E8:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.b	$B(a6),d7
	tst.b	-$3A1A(a5)
	beq.s	loc_1FDA06
	tst.b	d7
	beq.s	loc_1FDA02
	move.w	-$3A20(a5),d0
	bra.s	loc_1FDA4E
loc_1FDA02:
	moveq	#$0,d0
	bra.s	loc_1FDA4E
loc_1FDA06:
	jsr	$4D9A(a5)	; -> sub_1F485A
	jsr	$51F2(a5)	; -> sub_1FE3D8
	tst.b	d7
	beq.s	loc_1FDA1A
	jsr	$51A2(a5)	; -> sub_1FE018
	move.w	d0,d7
	bra.s	loc_1FDA20
loc_1FDA1A:
	jsr	$51AA(a5)	; -> sub_1FE01E
	move.w	d0,d7
loc_1FDA20:
	jsr	$51FA(a5)	; -> sub_1FE3EC
	jsr	$4DA2(a5)	; -> sub_1F4854
	moveq	#$C,d0
	and.w	d7,d0
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$C,d0
	cmp.l	d1,d0
	bne.s	loc_1FDA3A
	andi.w	#$FFF3,d7
loc_1FDA3A:
	moveq	#$3,d0
	and.w	d7,d0
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3,d0
	cmp.l	d1,d0
	bne.s	loc_1FDA4C
	andi.w	#$FFFC,d7
loc_1FDA4C:
	move.w	d7,d0
loc_1FDA4E:
	move.l	-$4(a6),d7
	unlk	a6
	rts
