; ---------------------------------------------------------------------------
; MagneticGlob_SetFrame - MAGNETICGLOB slot +$56: set the bolt's frame (graphics stay uploaded when unchanged)
; In:  8(a6) = bolt, $C(a6) = frame
; Out: none
; Evidence: +$2F = frame; +$2E bit 5 by comparison with +$38
; ---------------------------------------------------------------------------
MagneticGlob_SetFrame:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	moveq	#-$19,d0
	and.b	(a4),d0
	ext.w	d0
	moveq	#$18,d1
	and.b	$2E(a3),d1
	moveq	#$0,d2
	move.b	d1,d2
	or.w	d0,d2
	move.b	d2,(a4)
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_157C14
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_157C14
	ori.b	#$20,(a4)
	bra.s	loc_157C18
loc_157C14:
	andi.b	#$DF,(a4)
loc_157C18:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
