; ---------------------------------------------------------------------------
; BigBio_InActivateWindow - BigBio: may this inactive object activate now (camera range test) (class slot 13, +$3A)
; In:  8(a6) = this
; Out: d0.b = 1 to activate
; Evidence: method 13 of class descriptor $123684 (name string "BIGBIO", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BigBio_InActivateWindow:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1219C8
	move.l	$C(a4),d0
	add.l	#$1000,d0
	cmp.l	g_Player1+$C(a5),d0
	bge.s	loc_1219C8
	moveq	#$0,d0
	bra.s	loc_1219F6
loc_1219C8:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1219F4
	move.l	$C(a4),d0
	add.l	#$1000,d0
	cmp.l	g_Player2+$C(a5),d0
	bge.s	loc_1219F4
	moveq	#$0,d0
	bra.s	loc_1219F6
loc_1219F4:
	moveq	#$1,d0
loc_1219F6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
