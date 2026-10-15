; ---------------------------------------------------------------------------
; Pad_Get - current buttons for player 1 or 2, or the recorded demo input while a demo plays
; In:  8(a6) = byte: 1 = player 1, 0 = player 2
; Out: d0 = word: buttons with opposite directions cleared
; Evidence: if byte -$3A1A(a5) (demo active): P1 gets word -$3A20(a5), P2 gets 0; else Pad_GetP1Clean/Pad_GetP2Clean under Irq_Disable + Z80_BusRequest; only caller Pad_Update
; ---------------------------------------------------------------------------
Pad_Get:
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
	jsr	$4D9A(a5)	; -> Irq_Disable
	jsr	$51F2(a5)	; -> Z80_BusRequest
	tst.b	d7
	beq.s	loc_1FDA1A
	jsr	$51A2(a5)	; -> Pad_GetP1Clean
	move.w	d0,d7
	bra.s	loc_1FDA20
loc_1FDA1A:
	jsr	$51AA(a5)	; -> Pad_GetP2Clean
	move.w	d0,d7
loc_1FDA20:
	jsr	$51FA(a5)	; -> Z80_BusFree
	jsr	$4DA2(a5)	; -> Irq_Enable
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
