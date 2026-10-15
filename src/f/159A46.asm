; ---------------------------------------------------------------------------
; Magneto_SetFrame - MAGNETO slot +$56: set a frame through the bank helpers
; In:  8(a6) = player, $C(a6) = frame
; Out: none
; Evidence: +$30 = Magneto_FrameBank(frame), bank change invalidates +$38, +$2F = Magneto_FrameInBank(frame); then like Actor_SetFrame
; ---------------------------------------------------------------------------
Magneto_SetFrame:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.l	$2(a4),-$4(a6)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	Magneto_FrameBank(pc)
	move.l	d0,$2(a4)
	cmp.l	-$4(a6),d0
	beq.s	loc_159A7C
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
loc_159A7C:
	ext.l	d7
	move.l	d7,-(a7)
	jsr	Magneto_FrameInBank(pc)
	move.w	d0,d7
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_159AA0
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_159AA0
	ori.b	#$20,(a4)
	bra.s	loc_159AAA
loc_159AA0:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_159AAA:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
