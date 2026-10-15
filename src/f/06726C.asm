; ---------------------------------------------------------------------------
; ScalingActor_Draw - vtable +$1A: draw a SCALINGACTOR
; In:  8(a6) = this (SCALINGACTOR object)
; Out: none
; Evidence: class descriptor SCALINGACTOR slot +$1A (tools/classes.py); TAS frames 2346-49094 (336 active)
; ---------------------------------------------------------------------------
ScalingActor_Draw:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	tst.b	$32(a0)
	beq.s	loc_06728A
	move.l	a0,-(a7)
	jsr	sub_06451E(pc)
	addq.w	#$4,a7
	bra.s	loc_0672C6
loc_06728A:
	tst.l	$30(a4)
	beq.s	loc_0672C6
	movea.l	$8C(a4),a0
	tst.b	$35(a0)
	bne.s	loc_0672C6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$C(a7),a7
loc_0672C6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
