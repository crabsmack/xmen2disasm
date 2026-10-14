; ---------------------------------------------------------------------------
; sub_1E1928
; ---------------------------------------------------------------------------
sub_1E1928:
	tst.b	-$3A0A(a5)
	beq.s	loc_1E197C
	tst.b	-$1872(a5)
	beq.s	loc_1E197C
	move.l	-$1870(a5),-$186C(a5)
	move.b	-$1869(a5),-$1871(a5)
	beq.s	loc_1E19B6
	lea.l	-$1FDA(a5),a0
	moveq	#$0,d0
	move.b	-$186C(a5),d0
	lsl.w	#$3,d0
	move.b	$2(a0,d0.w),-$1868(a5)
	moveq	#$0,d0
	move.b	-$186E(a5),d0
	subq.w	#$1,d0
	lsl.w	#$3,d0
	move.b	$2(a0,d0.w),-$1866(a5)
	addq.w	#$2,d0
	swap	d0
	ori.l	#$70000003,d0
	move.l	d0,($C00004).l
	move.w	-$1866(a5),($C00000).l
loc_1E197C:
	tst.b	-$1871(a5)
	beq.s	loc_1E19B6
	move.b	-$186A(a5),-$1867(a5)
	moveq	#$1,d0
	and.l	-$3A10(a5),d0
	bne.s	loc_1E1996
	move.b	-$186B(a5),-$1867(a5)
loc_1E1996:
	moveq	#$0,d0
	move.b	-$186C(a5),d0
	lsl.w	#$3,d0
	addq.w	#$2,d0
	swap	d0
	ori.l	#$70000003,d0
	move.l	d0,($C00004).l
	move.w	-$1868(a5),($C00000).l
loc_1E19B6:
	rts
