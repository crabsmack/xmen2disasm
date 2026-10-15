; ---------------------------------------------------------------------------
; Cyclops_DrawBeam - draw Cyclops's optic beam as hardware sprites, cut short where a wall blocks it, as two alternating piece lists
; In:  8(a6) = player  $C(a6) = beam sprite instance (player +$BC: +2 def, +8 attr, +$14 beam record, +$1C/+$1E cut length, +$24 active)
; Out: none
; Evidence: first frame probes the map along the beam (Tile_TestAt, Tbl_BeamStepCases steps 20 px level/vertical, 10 px diagonal, up to record +$D) and stores the cut (Tbl_BeamCutCases), setting +$90 bit $20 when blocked; then emits pieces of list +2 and list +4 clipped by the cut, recording sprite link indexes in $FFE98E-$FFE99B for Cyclops_BeamVBlankFlicker
; ---------------------------------------------------------------------------
Cyclops_DrawBeam:
	link.w	a6,#$FFE4
	movem.l	d2-d7/a2-a4,-(a7)
	movea.l	$C(a6),a1
	tst.b	$24(a1)
	beq.w	Cyclops_DrawBeam_None
	tst.l	$2(a1)
	beq.w	Cyclops_DrawBeam_None
	tst.l	$14(a1)
	beq.w	Cyclops_DrawBeam_None
	movea.l	$8(a6),a3
	movea.l	$14(a1),a4
	moveq	#$10,d0
	and.b	$2E(a3),d0
	move.b	d0,-$19(a6)
	move.w	$8(a1),-$A(a6)
	tst.b	-$19(a6)
	bne.s	loc_1E166A
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.b	(a4),d1
	ext.w	d1
	add.w	d0,d1
	move.w	d1,-$6(a6)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.b	$1(a4),d1
	ext.w	d1
	add.w	d0,d1
	move.w	d1,-$8(a6)
	bra.s	loc_1E168C
loc_1E166A:
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.b	(a4),d1
	ext.w	d1
	sub.w	d1,d0
	move.w	d0,-$6(a6)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.b	$1(a4),d1
	ext.w	d1
	add.w	d1,d0
	move.w	d0,-$8(a6)
loc_1E168C:
	move.w	g_CameraX(a5),d0
	sub.w	d0,-$6(a6)
	move.w	g_CameraY(a5),d0
	sub.w	d0,-$8(a6)
	move.w	$1E(a1),d6
	move.w	$1C(a1),d7
	bne.w	Cyclops_DrawBeam_Emit
	movea.l	a1,a2
	moveq	#$0,d0
	move.b	$C(a4),d0
	add.w	d0,d0
	lea.l	Tbl_BeamStepCases(pc),a0
	adda.w	(a0,d0.w),a0
	jmp	(a0)
