; ---------------------------------------------------------------------------
; Cyclops_StartBeam - fire the optic beam: pick its sprite by direction, strength 1/2/4 by health and meter, 14-frame timer, beam sprite and screen origin
; In:  8(a6) = player  $C(a6) = beam record (jt data, 3 word offsets by level then x/y byte offsets, +9 attack type, +$C direction 0 level 1 up 2 down 3/4 diagonals, +$D length)  $13(a6) = byte: v-flip
; Out: none
; Evidence: vertical records -> +$BD = 0, Art_CyclopsBeamVertSpr; diagonal -> 1, Art_CyclopsBeamDiagSpr; else 2, Art_CyclopsBeamLevelSpr; Snd_Play($A1, or $A2 with a full meter); level = (health > $700) + meter full: +$70 = 1 << level, +$D0 = record + record[level]; +$E0 = 1, +$A8 = 14, +$71 = record +9; Spr_Init(+$BC, ...); +$C4 attr, +$D4/+$D6 origin in screen coords
; ---------------------------------------------------------------------------
Cyclops_StartBeam:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	clr.w	d7
	tst.l	$BE(a4)
	beq.s	loc_1E2D1C
	move.l	a4,-(a7)
	jsr	Cyclops_EndBeam(pc)
	addq.w	#$4,a7
loc_1E2D1C:
	lea.l	$4A92(a5),a0
	cmpa.l	$2(a0),a3
	beq.s	loc_1E2D44
	lea.l	$4A62(a5),a0
	cmpa.l	$2(a0),a3
	beq.s	loc_1E2D44
	lea.l	$4A5A(a5),a0
	cmpa.l	$2(a0),a3
	beq.s	loc_1E2D44
	lea.l	$4A7A(a5),a0
	cmpa.l	$2(a0),a3
	bne.s	loc_1E2D54
loc_1E2D44:
	clr.b	$BD(a4)
	lea.l	$4B5A(a5),a0
	move.l	$2(a0),$BE(a4)
	bra.s	loc_1E2D9E
loc_1E2D54:
	lea.l	$4A8A(a5),a0
	cmpa.l	$2(a0),a3
	beq.s	loc_1E2D7C
	lea.l	$4A82(a5),a0
	cmpa.l	$2(a0),a3
	beq.s	loc_1E2D7C
	lea.l	$4A52(a5),a0
	cmpa.l	$2(a0),a3
	beq.s	loc_1E2D7C
	lea.l	$4A4A(a5),a0
	cmpa.l	$2(a0),a3
	bne.s	loc_1E2D8E
loc_1E2D7C:
	move.b	#$1,$BD(a4)
	lea.l	$4B4A(a5),a0
	move.l	$2(a0),$BE(a4)
	bra.s	loc_1E2D9E
loc_1E2D8E:
	move.b	#$2,$BD(a4)
	lea.l	$4B52(a5),a0
	move.l	$2(a0),$BE(a4)
loc_1E2D9E:
	move.l	#$800,d0
	and.l	$90(a4),d0
	beq.s	loc_1E2DBE
	pea.l	($A2).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($A2).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	bra.s	loc_1E2DD0
loc_1E2DBE:
	pea.l	($A1).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($A1).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_1E2DD0:
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1E2DDA
	addq.w	#$1,d7
loc_1E2DDA:
	move.l	#$800,d0
	and.l	$90(a4),d0
	beq.s	loc_1E2DE8
	addq.w	#$1,d7
loc_1E2DE8:
	moveq	#$1,d0
	lsl.l	d7,d0
	move.b	d0,$70(a4)
	ext.l	d7
	move.l	d7,d0
	add.l	d0,d0
	add.l	a3,d0
	movea.l	d0,a0
	move.w	(a0),d0
	ext.l	d0
	add.l	a3,d0
	move.l	d0,$D0(a4)
	move.b	#$1,$E0(a4)
	move.w	#$E,$A8(a4)
	movea.l	$D0(a4),a0
	move.b	$9(a0),$71(a4)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	$34(a4),d1
	ext.l	d1
	moveq	#$2B,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	$BE(a4),-(a7)
	move.l	d0,-(a7)
	pea.l	$BC(a4)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	d0,d6
	tst.b	$13(a6)
	lea.l	$1C(a7),a7
	beq.s	loc_1E2E52
	ori.b	#$8,$BC(a4)
	bra.s	loc_1E2E58
loc_1E2E52:
	andi.b	#$F7,$BC(a4)
loc_1E2E58:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1E2E68
	ori.b	#$10,$BC(a4)
	bra.s	loc_1E2E7C
loc_1E2E68:
	andi.b	#$EF,$BC(a4)
	moveq	#$9,d0
	cmp.b	$71(a4),d0
	bne.s	loc_1E2E7C
	move.b	#$A,$71(a4)
loc_1E2E7C:
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_1E2E8C
	ori.b	#$4,$BC(a4)
	bra.s	loc_1E2E92
loc_1E2E8C:
	andi.b	#$FB,$BC(a4)
loc_1E2E92:
	clr.w	$CA(a4)
	move.w	#$2000,d0
	or.w	$C2(a4),d0
	move.w	d0,$C4(a4)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_1E2EB0
	ori.w	#$8000,$C4(a4)
loc_1E2EB0:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1E2EE0
	move.l	$8(a4),d0
	asr.l	#$8,d0
	movea.l	$D0(a4),a0
	move.b	(a0),d1
	ext.w	d1
	add.w	d0,d1
	move.w	d1,$D4(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.b	$1(a0),d1
	ext.w	d1
	add.w	d0,d1
	move.w	d1,$D6(a4)
	bra.s	loc_1E2F0A
loc_1E2EE0:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	movea.l	$D0(a4),a0
	move.b	(a0),d1
	ext.w	d1
	sub.w	d1,d0
	move.w	d0,$D4(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	movea.l	$D0(a4),a0
	move.b	$1(a0),d1
	ext.w	d1
	add.w	d0,d1
	move.w	d1,$D6(a4)
loc_1E2F0A:
	move.w	g_CameraX(a5),d0
	sub.w	d0,$D4(a4)
	move.w	g_CameraY(a5),d0
	sub.w	d0,$D6(a4)
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
