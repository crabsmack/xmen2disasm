; ---------------------------------------------------------------------------
; ChildShip_StateReleaseChild - CHILDSHIP crash: release a BRAINCHILD from the wreck (same facing, 20-frame invulnerability), wait $3C frames
; In:  8(a6) = this
; Out: d0
; Evidence: Tbl_BrainChild_vtable +$0E New; next ChildShip_StateDie; TAS 33489
; Found: link-after-rts
; ---------------------------------------------------------------------------
ChildShip_StateReleaseChild:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$1D82(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$1D82(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_0B77CA
	move.w	#$14,$6A(a3)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0B77CA
	ori.b	#$10,$2E(a3)
loc_0B77CA:
	move.w	#$3C,$6C(a4)
	lea.l	ChildShip_StateDie(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
