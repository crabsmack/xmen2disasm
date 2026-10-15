; ---------------------------------------------------------------------------
; CoreShields_Init - CoreShields: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $0EBE7E (name string "CORESHIELDS", parent ACTOR)
; ---------------------------------------------------------------------------
CoreShields_Init:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$288A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	-$3BD8(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	lea.l	CoreShields_StateStart(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$81,$6(a4)
	ori.b	#$4,$2E(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.w	$9A(a4)
	clr.w	$90(a4)
	moveq	#$8,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	$92(a4)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.w	$6(a3),d7
	beq.s	loc_0EBBC4
	move.w	d7,$8C(a4)
	bra.s	loc_0EBBCA
loc_0EBBC4:
	move.w	#$28,$8C(a4)
loc_0EBBCA:
	move.w	$8(a3),d7
	beq.s	loc_0EBBD6
	move.w	d7,$8C(a4)
	bra.s	loc_0EBBDC
loc_0EBBD6:
	move.w	#$B4,$8C(a4)
loc_0EBBDC:
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	move.w	d6,d0
	add.w	#$FFCB,d0
	move.w	d0,$56(a4)
	move.w	d7,d0
	add.w	#$FFDB,d0
	move.w	d0,$54(a4)
	move.w	d6,d0
	add.w	#$FFFB,d0
	move.w	d0,$5A(a4)
	move.w	d7,d0
	add.w	#$FFFC,d0
	move.w	d0,$58(a4)
	move.w	$56(a4),$4E(a4)
	move.w	$54(a4),$4C(a4)
	move.w	$5A(a4),$52(a4)
	move.w	$58(a4),$50(a4)
	move.w	#$2,g_PalBase+$64(a5)
	move.w	#$4,g_PalBase+$66(a5)
	move.w	#$6,g_PalBase+$68(a5)
	move.w	#$8,g_PalBase+$6A(a5)
	move.w	#$A,g_PalBase+$6C(a5)
	move.w	#$C,g_PalBase+$6E(a5)
	move.w	#$AE,g_PalBase+$72(a5)
	move.w	#$CE,g_PalBase+$74(a5)
	move.w	#$EE,g_PalBase+$76(a5)
	move.w	#$2EE,g_PalBase+$78(a5)
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
