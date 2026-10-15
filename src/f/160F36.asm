; ---------------------------------------------------------------------------
; Cam_PanTo - CAMERA slot +$36: pan the camera to a point at given speeds, optionally keeping x and/or y locked afterwards
; In:  8(a6) = this, $C/$10(a6) = words target x/y, $14/$18(a6) = words speed x/y (abs), $1C/$20(a6) = bytes lock x / lock y (+$4A bits 1/2)
; Out: none
; Evidence: start = g_CameraX/Y, +$10/+$18 cleared, saves tracking fn +8 in +$20, +8 = Cam_PanStep
; ---------------------------------------------------------------------------
Cam_PanTo:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	move.w	$1A(a6),d6
	move.w	$16(a6),d7
	movea.l	$8(a6),a4
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_160F58
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_160F5E
loc_160F58:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_160F5E:
	move.w	d0,$54(a4)
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_160F70
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_160F76
loc_160F70:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_160F76:
	move.w	d0,$56(a4)
	move.w	$E(a6),$38(a4)
	move.w	$12(a6),$3A(a4)
	move.w	g_CameraX(a5),$30(a4)
	move.w	g_CameraY(a5),$32(a4)
	moveq	#$0,d0
	move.l	d0,$10(a4)
	move.l	d0,$18(a4)
	tst.b	$1F(a6)
	beq.s	loc_160FA8
	ori.w	#$1,$4A(a4)
loc_160FA8:
	tst.b	$23(a6)
	beq.s	loc_160FB4
	ori.w	#$2,$4A(a4)
loc_160FB4:
	move.l	$8(a4),$20(a4)
	lea.l	Cam_PanStep(pc),a0
	move.l	a0,$8(a4)
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
