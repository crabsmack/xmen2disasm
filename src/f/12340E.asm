; ---------------------------------------------------------------------------
; BigBio_TakeDamage - BigBio: receive a hit from an attacker: damage, hurt state, invulnerability timer (class slot 8, +$26)
; In:  8(a6) = this  $C(a6) = attacker  $13(a6) = byte hit type  $17(a6) = byte damage  $1A/$1E(a6) = words
; Out: none
; Evidence: method 8 of class descriptor $123684 (name string "BIGBIO", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BigBio_TakeDamage:
	link.w	a6,#$FFF8
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$34A2(a5),a0
	move.l	$2(a0),-$4(a6)
	moveq	#$9,d0
	and.w	$A2(a4),d0
	bne.w	loc_1234EA
	move.b	$17(a6),d0
	ext.w	d0
	sub.w	d0,$68(a4)
	move.w	#$14,$6A(a4)
	moveq	#$32,d0
	cmp.w	$68(a4),d0
	bge.s	loc_12346E
	move.l	-$4(a6),-$8(a6)
	lea.l	-$3920(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
loc_123454:
	movea.l	-$8(a6),a0
	addq.l	#$2,-$8(a6)
	move.w	(a0),(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_123454
	move.b	#$1,g_PalBaseDirty(a5)
	bra.s	loc_1234A2
loc_12346E:
	moveq	#$1E,d0
	cmp.w	$68(a4),d0
	bge.s	loc_1234A2
	movea.l	-$4(a6),a0
	lea.l	$20(a0),a0
	move.l	a0,-$8(a6)
	lea.l	-$3920(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
loc_12348A:
	movea.l	-$8(a6),a0
	addq.l	#$2,-$8(a6)
	move.w	(a0),(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_12348A
	move.b	#$1,g_PalBaseDirty(a5)
loc_1234A2:
	tst.w	$68(a4)
	bgt.s	loc_1234CA
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	sub_123346(pc),a0
	move.l	a0,$5C(a4)
	ori.w	#$40,$6(a4)
	move.w	#$14,$6C(a4)
	bra.s	loc_1234EA
loc_1234CA:
	tst.l	$60(a4)
	bne.s	loc_1234D6
	move.l	$5C(a4),$60(a4)
loc_1234D6:
	ori.w	#$40,$6(a4)
	lea.l	sub_123242(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$14,$6C(a4)
loc_1234EA:
	movem.l	-$18(a6),d3/d7/a3-a4
	unlk	a6
	rts
