; ---------------------------------------------------------------------------
; ChildShip_TakeDamage - vtable +$26: health -= damage, 20-frame invulnerability; at 0 leave the hit/collision lists and crash (ChildShip_StateCrash), else slot +$6E OnHurt
; Evidence: TAS 33414-33436
; ---------------------------------------------------------------------------
ChildShip_TakeDamage:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.b	$17(a6),d7
	movea.l	$8(a6),a4
	tst.b	d7
	ble.w	loc_0B742C
	tst.w	$68(a4)
	ble.s	loc_0B742C
	ext.w	d7
	sub.w	d7,$68(a4)
	move.w	#$14,$6A(a4)
	tst.w	$68(a4)
	bgt.s	loc_0B740E
	move.w	#$FFFF,$6A(a4)
	lea.l	ChildShip_StateCrash(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	pea.l	-$1656(a5)
	move.l	$80(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$80(a4)
	ori.w	#$1,$6(a4)
	ori.w	#$2,$6(a4)
	move.l	d0,$AA(a4)
	lea.l	$10(a7),a7
	bra.s	loc_0B742C
loc_0B740E:
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
loc_0B742C:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
