; ---------------------------------------------------------------------------
; Actor_SpawnFromRec - ACTOR slot +$2E: create the object for a spawn record (New at the record position) and mark the record live
; In:  8(a6) = descriptor   $C(a6) = spawn record
; Out: d0 = object or 0
; Evidence: vtable +$0E New(0, rec+0, x<<8, y<<8, rec+$A); obj+$14 = byte $FFF633; rec+5 = obj+$15 (object index); rec+4 bit 0 cleared, bit 1 set
; ---------------------------------------------------------------------------
Actor_SpawnFromRec:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$C(a6),a4
	move.w	$6(a4),d0
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	move.w	$8(a4),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	move.l	$A(a4),-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	move.l	(a4),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	movea.l	$8(a6),a0
	movea.l	(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	beq.s	loc_15DBE6
	move.b	-$BCD(a5),$14(a3)
	move.b	$15(a3),$5(a4)
	andi.b	#$FE,$4(a4)
	ori.b	#$2,$4(a4)
loc_15DBE6:
	move.l	a3,d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
