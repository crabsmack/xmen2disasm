; ---------------------------------------------------------------------------
; Mine_SpawnFromRec - Mine: create the object for a spawn record (static, class slot 10, +$2E)
; In:  8(a6) = spawn record (class ptr at +0)  $C(a6) = spawn record
; Out: d0 = object or 0
; Evidence: method 10 of class descriptor $13AF1A (name string "MINE", parent ACTOR)
; ---------------------------------------------------------------------------
Mine_SpawnFromRec:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a4
	move.l	$A(a4),-(a7)
	jsr	Mine_PoolAdd(pc)
	movea.l	d0,a3
	move.l	a3,d0
	beq.s	loc_13ABC2
	move.l	a4,$8(a3)
	move.b	#$FF,$5(a4)
	andi.b	#$FE,$4(a4)
	ori.b	#$2,$4(a4)
loc_13ABC2:
	moveq	#$0,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
