; ---------------------------------------------------------------------------
; Spark_Update - Spark: per-frame update: range checks, Move, run the state function at +$5C after the +$6C delay (class slot 17, +$4A)
; In:  8(a6) = this
; Out: none
; Evidence: method 17 of class descriptor $1400DE (name string "SPARK", parent ACTOR)
; ---------------------------------------------------------------------------
Spark_Update:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d5
	sub.l	d1,d5
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	clr.b	d7
	cmp.w	-$35C2(a5),d5
	ble.s	loc_13FBDA
	moveq	#$1,d7
loc_13FBDA:
	cmp.w	-$35C0(a5),d5
	bge.s	loc_13FBE2
	moveq	#$1,d7
loc_13FBE2:
	cmp.w	-$35C6(a5),d6
	ble.s	loc_13FBEA
	moveq	#$1,d7
loc_13FBEA:
	cmp.w	-$35C4(a5),d6
	bge.s	loc_13FBF2
	moveq	#$1,d7
loc_13FBF2:
	tst.b	d7
	beq.s	loc_13FC1A
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	tst.w	$68(a4)
	addq.w	#$4,a7
	bgt.w	loc_13FCB8
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_13FCB8
loc_13FC1A:
	tst.b	-$38DE(a5)
	beq.s	loc_13FC24
	moveq	#$2,d7
	bra.s	loc_13FC26
loc_13FC24:
	moveq	#$1,d7
loc_13FC26:
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	tst.w	$68(a4)
	ble.s	loc_13FC44
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_13FC44:
	move.l	$C(a4),d0
	sub.l	d6,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	sub.l	d5,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$412A(a5)	; -> sub_15F8B6
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_13FC6C
	ori.w	#$8,$4(a4)
loc_13FC6C:
	tst.w	$6C(a4)
	ble.s	loc_13FC8A
	cmpi.w	#$FF,$6C(a4)
	bge.s	loc_13FCA2
	sub.w	d7,$6C(a4)
	tst.w	$6C(a4)
	bge.s	loc_13FCA2
	clr.w	$6C(a4)
	bra.s	loc_13FCA2
loc_13FC8A:
	move.l	a4,-(a7)
	movea.l	$5C(a4),a0
	jsr	(a0)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.s	loc_13FCB8
loc_13FCA2:
	moveq	#$8,d0
	and.w	$4(a4),d0
	beq.s	loc_13FCB8
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> sub_1F4A40
	andi.w	#$FFF7,$4(a4)
	addq.w	#$4,a7
loc_13FCB8:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
