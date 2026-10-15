; ---------------------------------------------------------------------------
; ControlPanel_Draw - in display mode 5 (+$9A) draw the current pattern step's sprite (g_ControlPanelSprDef2, byte dx/dy/frame from step +$94 of table +$90), otherwise the parent Draw (CONTROLPANEL override of slot +$1A Draw)
; In:  8(a6) = this
; Out: none
; Evidence: slot +$1A of the CONTROLPANEL descriptor $0DE48E; TAS frames 2712-6946 (1135 frames active)
; ---------------------------------------------------------------------------
ControlPanel_Draw:
	link.w	a6,#$FFFC
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$5,d0
	cmp.w	$9A(a3),d0
	bne.s	loc_0DE13E
	move.w	g_ControlPanelSprDef2(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	adda.w	d0,a0
	move.l	a0,-$4(a6)
	move.w	$94(a3),d0
	ext.l	d0
	movea.l	$90(a3),a0
	asl.l	#$2,d0
	lea.l	$2(a0,d0.l),a4
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.b	(a4),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,d6
	add.l	d0,d6
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.b	$1(a4),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,d7
	add.l	d0,d7
	movea.l	-$4(a6),a0
	move.b	$2(a4),$1(a0)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$C(a7),a7
	bra.s	loc_0DE154
loc_0DE13E:
	move.l	a3,-(a7)
	lea.l	$2582(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_0DE154:
	movem.l	-$14(a6),d6-d7/a3-a4
	unlk	a6
	rts
