; ---------------------------------------------------------------------------
; ControlPanel_Init - vtable +$12 constructor: run the parent's Init, then set up a CONTROLPANEL
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the CONTROLPANEL descriptor $0DE48E; TAS frames 2711-6810 (18 frames active); calls parent ACTOR slot +$12
; ---------------------------------------------------------------------------
ControlPanel_Init:
	link.w	a6,#$FFF0
	movem.l	d5-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$14(a6),a4
	movea.l	$8(a6),a3
	move.l	a4,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a3,-(a7)
	lea.l	$2582(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a3)
	clr.w	$20(a3)
	move.w	#$64,$68(a3)
	lea.l	ControlPanel_StateHit(pc),a0
	move.l	a0,$60(a3)
	ori.w	#$4081,$6(a3)
	move.w	-$3BFE(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a3),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a3)
	move.l	a4,d0
	lea.l	$18(a7),a7
	bne.s	loc_0DDF86
	lea.l	-$10(a6),a4
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$2(a4)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,$4(a4)
	clr.w	$6(a4)
	move.w	#$B4,$8(a4)
	move.w	#$300,$A(a4)
	clr.l	$C(a4)
loc_0DDF86:
	move.w	$6(a4),$98(a3)
	move.w	$8(a4),d7
	beq.s	loc_0DDF98
	move.w	d7,$9E(a3)
	bra.s	loc_0DDF9E
loc_0DDF98:
	move.w	#$B4,$9E(a3)
loc_0DDF9E:
	move.w	$A(a4),d7
	beq.s	loc_0DDFAA
	move.w	d7,$A0(a3)
	bra.s	loc_0DDFB0
loc_0DDFAA:
	move.w	#$300,$A0(a3)
loc_0DDFB0:
	move.b	$D(a4),$A2(a3)
	move.w	$98(a3),d7
	cmpi.w	#$F,d7
	bge.s	loc_0DDFC4
	tst.w	d7
	bge.s	loc_0DDFCA
loc_0DDFC4:
	clr.w	d7
	clr.w	$98(a3)
loc_0DDFCA:
	ext.l	d7
	movea.l	-$3BFA(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	adda.l	d0,a0
	move.l	a0,$8C(a3)
	movea.l	a0,a4
	move.w	(a4),d7
	btst	#$0,d7
	beq.s	loc_0DE018
	lea.l	ControlPanel_StateArm(pc),a0
	move.l	a0,$5C(a3)
	lea.l	ControlPanel_StateArm(pc),a0
	move.l	a0,$64(a3)
	pea.l	($FF).w
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	ori.w	#$2,$6(a3)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
	bra.s	loc_0DE06A
loc_0DE018:
	moveq	#$8,d0
	and.w	d7,d0
	beq.s	loc_0DE036
	lea.l	ControlPanel_StateDamaged2(pc),a0
	move.l	a0,$5C(a3)
	lea.l	ControlPanel_StateDamaged2(pc),a0
	move.l	a0,$64(a3)
	move.w	#$3,$9A(a3)
	bra.s	loc_0DE06A
loc_0DE036:
	moveq	#$4,d0
	and.w	d7,d0
	beq.s	loc_0DE054
	lea.l	ControlPanel_StateDamaged1(pc),a0
	move.l	a0,$5C(a3)
	lea.l	ControlPanel_StateDamaged1(pc),a0
	move.l	a0,$64(a3)
	move.w	#$2,$9A(a3)
	bra.s	loc_0DE06A
loc_0DE054:
	lea.l	ControlPanel_StateIntact(pc),a0
	move.l	a0,$5C(a3)
	lea.l	ControlPanel_StateIntact(pc),a0
	move.l	a0,$64(a3)
	move.w	#$1,$9A(a3)
loc_0DE06A:
	moveq	#$D,d0
	move.l	$8(a3),d5
	asr.l	d0,d5
	moveq	#$D,d0
	move.l	$C(a3),d1
	asr.l	d0,d1
	move.l	d1,d6
	subq.l	#$1,d6
	ext.l	d6
	movea.l	-$3A72(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d5
	add.l	d5,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d7
	move.w	#$200,d0
	and.w	d7,d0
	beq.s	loc_0DE0AA
	ori.b	#$10,$2E(a3)
loc_0DE0AA:
	movem.l	-$24(a6),d5-d7/a3-a4
	unlk	a6
	rts
