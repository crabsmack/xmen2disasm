; ---------------------------------------------------------------------------
; HitList_Add - push an object onto a hit list (allocates a node {next, prev, owner})
; In:  8(a6) = object, $C(a6) = list head pointer
; Out: d0 = node (stored by Actor_Activate in obj+$80 / +$84)
; Evidence: HitList_AllocNode, links at the head, node+8 = object; List_Unlink removes; Collide_RunAll walks the lists
; ---------------------------------------------------------------------------
HitList_Add:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	jsr	HitList_AllocNode(pc)
	movea.l	d0,a4
	move.l	a4,d0
	beq.s	loc_15DF5A
	tst.l	(a3)
	beq.s	loc_15DF4A
	movea.l	(a3),a0
	move.l	a4,$4(a0)
loc_15DF4A:
	move.l	(a3),(a4)
	moveq	#$0,d0
	move.l	d0,$4(a4)
	move.l	a4,(a3)
	move.l	$8(a6),$8(a4)
loc_15DF5A:
	move.l	a4,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
