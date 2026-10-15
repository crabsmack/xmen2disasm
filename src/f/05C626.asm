; ---------------------------------------------------------------------------
; sub_05C626	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C626:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	$C(a3),-(a7)
	move.l	$8(a3),-(a7)
	jsr	$D1A(a5)	; -> sub_05C07C
	move.l	d0,-$4(a6)
	lea.l	$C(a7),a7
	beq.s	loc_05C696
	movea.l	$8C(a3),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	$10(a3),d1
	ext.l	d1
	sub.l	d1,d0
	moveq	#$10,d1
	add.l	d1,d0
	asr.l	#$5,d0
	move.b	d0,$99(a3)
	lea.l	$D32(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	-$4(a6),-(a7)
	move.l	a3,-(a7)
	jsr	$4E72(a5)	; -> sub_1F64B4
	lea.l	sub_05C6AA(pc),a0
	move.l	a0,$5C(a3)
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a3)
	moveq	#$0,d0
	bra.s	loc_05C6A0
loc_05C696:
	lea.l	sub_05C4A0(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$0,d0
loc_05C6A0:
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
