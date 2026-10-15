; ---------------------------------------------------------------------------
; EvilMaker_ActDropBeast - EVILMAKER script action: drop a capsule holding clone type 1 (EVILBEAST)
; In:  8(a6) = this
; Out: none
; Evidence: builds a 16-byte spawn record {x, y, word +6 = 1} at its position, EvilDrop_Spawn(rec, jt[$1B92]); next step; jt 688; type 1 = Tbl_EvilBeast_vtable in XClone_SpawnByType
; Found: jt 688
; ---------------------------------------------------------------------------
EvilMaker_ActDropBeast:
	link.w	a6,#$FFF0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	-$10(a6)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$E(a6)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$C(a6)
	move.w	#$1,-$A(a6)
	lea.l	$1992(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$10(a6)
	jsr	$15FA(a5)	; -> EvilDrop_Spawn
	tst.l	$8E(a4)
	lea.l	$14(a7),a7
	bne.s	loc_094800
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09482C
loc_094800:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_094814
	clr.w	$8C(a4)
loc_094814:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_09482C:
	movea.l	-$14(a6),a4
	unlk	a6
	rts
