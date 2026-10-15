; ---------------------------------------------------------------------------
; Tuskette_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a TUSKETTE
; In:  8(a6) = this (TUSKETTE object)
; Out: none
; Evidence: class descriptor TUSKETTE slot +$12 (tools/classes.py); TAS frames 20384-23795 (39 active)
; ---------------------------------------------------------------------------
Tuskette_Init:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$80,$6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d7
	moveq	#$20,d0
	sub.l	d0,d7
	pea.l	($3E8).w
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3EFA(a5)	; -> Seg_FindBelow
	lea.l	$C(a7),a7
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4EBA(a5)	; -> sub_1F6B56
	move.b	#$1,$70(a4)
	move.w	#$1,$68(a4)
	move.w	-$3C60(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	moveq	#$0,d0
	move.b	g_ScnBaniMazaA1(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	lea.l	$20(a7),a7
	bne.s	loc_05DE6C
	andi.b	#$FB,$2E(a4)
	bra.s	loc_05DE72
loc_05DE6C:
	ori.b	#$4,$2E(a4)
loc_05DE72:
	moveq	#$0,d0
	move.l	d0,$A0(a4)
	move.l	d0,$A4(a4)
	move.b	$7(a3),$96(a4)
	tst.w	$8(a3)
	beq.s	loc_05DE8E
	move.w	$8(a3),d1
	bra.s	loc_05DE92
loc_05DE8E:
	move.w	#$80,d1
loc_05DE92:
	move.w	d1,$98(a4)
	tst.w	$A(a3)
	beq.s	loc_05DEA2
	move.w	$A(a3),d0
	bra.s	loc_05DEA4
loc_05DEA2:
	moveq	#$2,d0
loc_05DEA4:
	ext.l	d0
	lsl.l	#$8,d0
	move.w	d0,$9A(a4)
	tst.w	$C(a3)
	beq.s	loc_05DECC
	move.w	$2(a3),d0
	sub.w	$C(a3),d0
	move.w	d0,$9C(a4)
	move.w	$C(a3),d0
	add.w	$2(a3),d0
	move.w	d0,$9E(a4)
	bra.s	loc_05DEDC
loc_05DECC:
	movea.l	$76(a4),a0
	move.w	$8(a0),$9C(a4)
	move.w	$C(a0),$9E(a4)
loc_05DEDC:
	move.b	$96(a4),d0
	cmpi.b	#$7,d0
	bhi.w	loc_05E038
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_05DDBE(pc,d1.w),d1
	jmp	Sw_05DDBE-2(pc,d1.w)
