; ---------------------------------------------------------------------------
; CoreZap_HitActor - CoreZap: if the actor is alive, not invulnerable and overlapping, deal 1 damage (hit type 4)
; In:  8(a6) = this  $C(a6) = actor
; Out: none
; Evidence: box +$54..+$5A overlap, +$6A cooldown 0, actor vtable +$26 TakeDamage; called from CoreZap_Update
; ---------------------------------------------------------------------------
CoreZap_HitActor:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0EBD6E
	tst.w	$6A(a4)
	bne.s	loc_0EBD6E
	move.w	$56(a3),d0
	cmp.w	$5A(a4),d0
	bgt.s	loc_0EBD6E
	move.w	$5A(a3),d0
	cmp.w	$56(a4),d0
	blt.s	loc_0EBD6E
	move.w	$54(a3),d0
	cmp.w	$58(a4),d0
	bgt.s	loc_0EBD6E
	move.w	$58(a3),d0
	cmp.w	$54(a4),d0
	blt.s	loc_0EBD6E
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_0EBD6E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
