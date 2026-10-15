; ---------------------------------------------------------------------------
; BroodBoss_Init - parent (BROODBOSSPARTS) Init, then no motion, damage 1, states BroodBoss_StateSetup / hurt BroodBoss_StateHurt, sprite def jt $153A (palette 2), flags |= $5102, +$71 = 5, health 24, shared arm frame -$3B10 = $FF, AI script jt $14BA (+$90); arena from the map: floor y (segment below, or y+$5A) for both debris pools (Debris_SetFloorY, bounce limit 3), left edge -$3B20 (placement +6 or x-$220), ceiling -$3B22, left wall -$3B24 (BROODBOSS override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = placement entry
; Out: none
; Evidence: slot +$12 of the BROODBOSS descriptor $088D6E; TAS frames 49283-49283 (1 frames active)
; ---------------------------------------------------------------------------
BroodBoss_Init:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$150A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.b	#$1,$70(a4)
	lea.l	BroodBoss_StateSetup(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	lea.l	BroodBoss_StateHurt(pc),a0
	move.l	a0,$60(a4)
	lea.l	$153A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	andi.b	#$FB,$2E(a4)
	clr.b	$42(a4)
	ori.w	#$5102,$6(a4)
	move.b	#$5,$71(a4)
	move.w	#$18,$68(a4)
	moveq	#$0,d0
	move.l	d0,$96(a4)
	move.w	#$FF,-$3B10(a5)
	move.l	d0,$9E(a4)
	move.l	d0,$A2(a4)
	lea.l	$14BA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$90(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	movea.l	$14(a6),a0
	move.w	$2(a0),d7
	move.w	$4(a0),d6
	pea.l	($3E8).w
	ext.l	d6
	move.l	d6,d0
	moveq	#$20,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3EFA(a5)	; -> Seg_FindBelow
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$24(a7),a7
	beq.s	loc_0867C0
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_0867B8
	move.w	$A(a3),d0
	bra.s	loc_0867BC
loc_0867B8:
	move.w	$E(a3),d0
loc_0867BC:
	move.w	d0,d7
	bra.s	loc_0867C6
loc_0867C0:
	move.w	d6,d7
	add.w	#$5A,d7
loc_0867C6:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	-$3B1C(a5),-(a7)
	jsr	$3B4A(a5)	; -> Debris_SetFloorY
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	-$3B1C(a5),-(a7)
	jsr	$3B5A(a5)	; -> Debris_SetBounceLimit
	ext.l	d7
	move.l	d7,-(a7)
	move.l	-$3B14(a5),-(a7)
	jsr	$3B4A(a5)	; -> Debris_SetFloorY
	movea.l	$14(a6),a0
	move.w	$6(a0),d7
	beq.s	loc_0867FA
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_08680A
loc_0867FA:
	movea.l	$14(a6),a0
	move.w	$2(a0),d0
	ext.l	d0
	sub.l	#$220,d0
loc_08680A:
	move.l	d0,-$3B20(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	movea.l	$14(a6),a0
	move.w	$4(a0),d1
	ext.l	d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	move.w	$2(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$3F02(a5)	; -> Seg_FindAbove
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$24(a7),a7
	beq.s	loc_086856
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_08684C
	move.w	$A(a3),d0
	bra.s	loc_086850
loc_08684C:
	move.w	$E(a3),d0
loc_086850:
	move.w	d0,d7
	subq.w	#$8,d7
	bra.s	loc_086862
loc_086856:
	movea.l	$14(a6),a0
	move.w	$4(a0),d7
	sub.w	#$70,d7
loc_086862:
	move.w	d7,-$3B22(a5)
	moveq	#$14,d0
	move.l	d0,-(a7)
	movea.l	$14(a6),a0
	move.w	$4(a0),d1
	ext.l	d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	move.w	$2(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$3F0A(a5)	; -> Seg_FindLeft
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_0868AC
	move.w	$8(a3),d0
	cmp.w	$C(a3),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0868A4
	move.w	$8(a3),d0
	bra.s	loc_0868A8
loc_0868A4:
	move.w	$C(a3),d0
loc_0868A8:
	move.w	d0,d7
	bra.s	loc_0868B8
loc_0868AC:
	movea.l	$14(a6),a0
	move.w	$2(a0),d7
	sub.w	#$220,d7
loc_0868B8:
	move.w	d7,-$3B24(a5)
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
