; ---------------------------------------------------------------------------
; Exodus_DropPlayerFromSeg - make a player standing on floor segment S fall
; In:  8(a6) = player, $C(a6) = floor segment
; Out: d0
; Evidence: present, +4 bit $1000 clear and +$76 == S -> sub_1F6530; caller Exodus_CheckFloorHit
; ---------------------------------------------------------------------------
Exodus_DropPlayerFromSeg:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_02DCDC
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_02DCDC
	move.l	$76(a4),d0
	cmp.l	$C(a6),d0
	bne.s	loc_02DCDC
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	addq.w	#$4,a7
loc_02DCDC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
