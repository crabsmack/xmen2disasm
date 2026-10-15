; ---------------------------------------------------------------------------
; BioNpc_DrawStunned - BIONPC draw callback while shocked/frozen: overlay effect, draw the body while alive or early in the stun
; In:  8(a6) = this
; Out: none
; Evidence: installed in the draw list ($FFEEBC + idx*$14) by BioNpc_TakeDamage for hit types $D-$F; sub_15AE48 effect jt $416A; vtable +$1A Draw
; ---------------------------------------------------------------------------
BioNpc_DrawStunned:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$3FFF,d7
	and.w	d0,d7
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	-$18A6(a5),-(a7)
	lea.l	$3F6A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3F2A(a5)	; -> sub_15AE48
	tst.w	$68(a4)
	lea.l	$20(a7),a7
	bgt.s	loc_114B7A
	cmpi.w	#$F,d7
	ble.s	loc_114B86
loc_114B7A:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_114B86:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
