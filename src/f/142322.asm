; ---------------------------------------------------------------------------
; sub_142322	[link-after-rts]
; ---------------------------------------------------------------------------
sub_142322:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3CDA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.w	$68(a4)
	addq.w	#$8,a7
	bgt.s	loc_14234E
	move.l	a4,-(a7)
	jsr	sub_1422A8(pc)
	addq.w	#$4,a7
	bra.w	loc_1423CE
loc_14234E:
	move.w	$9A(a4),d0
	beq.s	loc_14235E
	subq.w	#$1,d0
	beq.s	loc_142384
	subq.w	#$1,d0
	beq.s	loc_1423AA
	bra.s	loc_1423CE
loc_14235E:
	lea.l	$3CDA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_14286A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1423CE
loc_142384:
	lea.l	$3CFA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_1429A6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1423CE
loc_1423AA:
	lea.l	$3CDA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_14286A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1423CE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
