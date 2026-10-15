; ---------------------------------------------------------------------------
; ChildShip_Update - vtable +$4A: per-frame update of a CHILDSHIP
; In:  8(a6) = this
; Evidence: slot +$4A of the CHILDSHIP descriptor $0B7C3A; TAS frames 33389-33550 (154 frames active); calls parent XNPC slot +$4A
; ---------------------------------------------------------------------------
ChildShip_Update:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$38DE(a5)
	beq.s	loc_0B720A
	moveq	#$2,d0
	bra.s	loc_0B720C
loc_0B720A:
	moveq	#$1,d0
loc_0B720C:
	move.w	d0,d7
	move.l	a4,-(a7)
	lea.l	$1D8A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_0B7224:
	tst.l	$94(a4)
	beq.s	loc_0B7286
	movea.l	$94(a4),a0
	cmpi.w	#$3E8,(a0)
	blt.s	loc_0B7240
	lea.l	$1DC2(a5),a0
	move.l	$2(a0),$94(a4)
	bra.s	loc_0B7286
loc_0B7240:
	tst.w	$6E(a4)
	bgt.s	loc_0B7286
	movea.l	$94(a4),a0
	move.w	(a0),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d5
	add.l	$8(a4),d5
	move.w	$2(a0),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d6
	add.l	$C(a4),d6
	moveq	#$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	move.l	d6,-(a7)
	move.l	d5,-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	addq.l	#$8,$94(a4)
	move.w	#$3,$6E(a4)
	lea.l	$C(a7),a7
loc_0B7286:
	move.w	d7,d0
	subq.w	#$1,d7
	tst.w	d7
	bgt.s	loc_0B7224
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
