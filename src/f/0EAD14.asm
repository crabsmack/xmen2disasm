; ---------------------------------------------------------------------------
; Hologram_Init - Hologram constructor: parent Init, sprite def, AI script at +$8C, state Hologram_StateStart, flags |= $5083, +$92/+$94 = placement params +6/+8 (defaults 40/180), a type-$14 segment 60x200 around it in +$A2, and a 60-tick timer running Hologram_VBlankFlicker (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry (not null-checked)
; Out: none
; Evidence: AiScript_Set(this+$8C, jt $2A02); Seg_Create($14, 0, x-30, y-100, x+30, y+100); Timer_Create + Timer_Start; method 3 of class descriptor $0EAE16 (name string "HOLOGRAM", parent ACTOR)
; ---------------------------------------------------------------------------
Hologram_Init:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$27F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	g_HologramSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	lea.l	$2802(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	Hologram_StateStart(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$5083,$6(a4)
	move.w	#$28,$92(a4)
	move.w	#$B4,$94(a4)
	move.w	$10(a4),d0
	ext.l	d0
	move.l	d0,d4
	moveq	#$1E,d0
	sub.l	d0,d4
	move.w	$10(a4),d1
	ext.l	d1
	move.l	d1,d5
	add.l	d0,d5
	move.w	$12(a4),d1
	ext.l	d1
	move.l	d1,d6
	moveq	#$64,d1
	sub.l	d1,d6
	move.w	$12(a4),d2
	ext.l	d2
	move.l	d2,d7
	add.l	d1,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$14,d1
	move.l	d1,-(a7)
	jsr	$4F1A(a5)	; -> Seg_Create
	move.l	d0,$A2(a4)
	lea.l	$38(a7),a7
	move.w	$6(a3),d7
	beq.s	loc_0EADD8
	move.w	d7,$92(a4)
loc_0EADD8:
	move.w	$8(a3),d7
	beq.s	loc_0EADE2
	move.w	d7,$94(a4)
loc_0EADE2:
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	$27FA(a5)
	moveq	#$3C,d1
	move.l	d1,-(a7)
	pea.l	$3F32(a5)
	jsr	$4FD2(a5)	; -> Timer_Create
	movea.l	d0,a4
	move.l	a4,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	move.b	#$1,-$3BE0(a5)
	clr.b	-$3BDD(a5)
	lea.l	$14(a7),a7
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
