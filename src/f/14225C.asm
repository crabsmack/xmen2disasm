; ---------------------------------------------------------------------------
; TechWallGun_FindFreeBullet - find a free slot in the wall guns' 16-bullet pool
; In:  none
; Out: d0 = slot (or the pool end when full)
; Evidence: pool $FFE794, 16 x $10 bytes, slot free when +$E high nibble is 0
; ---------------------------------------------------------------------------
TechWallGun_FindFreeBullet:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	movea.l	d0,a4
	movea.l	-$1A6C(a5),a0
	lea.l	(a0),a4
	bra.s	loc_14228A
loc_14226E:
	move.b	$E(a4),d0
	ext.w	d0
	move.w	#$F0,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	tst.l	d0
	bne.s	loc_142286
	move.l	a4,d0
	bra.s	loc_142298
loc_142286:
	lea.l	$10(a4),a4
loc_14228A:
	movea.l	-$1A6C(a5),a0
	lea.l	$100(a0),a0
	cmpa.l	a4,a0
	bhi.s	loc_14226E
	move.l	a4,d0
loc_142298:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
