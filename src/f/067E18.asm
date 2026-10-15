; ---------------------------------------------------------------------------
; BoxInputActor_Draw - vtable +$1A: draw a BOXINPUTACTOR
; In:  8(a6) = this (BOXINPUTACTOR object)
; Out: none
; Evidence: class descriptor BOXINPUTACTOR slot +$1A (tools/classes.py); TAS frames 2346-49094 (349 active)
; ---------------------------------------------------------------------------
BoxInputActor_Draw:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a0
	movea.l	$8C(a0),a4
	moveq	#-$1,d0
	cmp.b	$3C(a4),d0
	beq.s	loc_067E56
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$3,d1
	move.l	d1,-(a7)
	move.w	$38(a4),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.w	$36(a4),d2
	ext.l	d2
	move.l	d2,-(a7)
	moveq	#$0,d2
	move.b	$3E(a4),d2
	move.l	d2,-(a7)
	jsr	PlayerSelect_DrawFrame(pc)
	lea.l	$14(a7),a7
loc_067E56:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
