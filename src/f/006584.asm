; ---------------------------------------------------------------------------
; HUD_Redraw - redraw both HUD panels (full panel if the player is present, a short placeholder otherwise), then the health bars
; In:  none
; Out: none
; Evidence: DMAs $200 or $140 bytes to VRAM $FD00 / $FA00 (sub_1FE17A) by player +4 alive bits, calls HUD_UpdateHealthBars and VDP_WaitVBlank
; ---------------------------------------------------------------------------
HUD_Redraw:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	lea.l	$3F7A(a5),a0
	movea.l	$2(a0),a4
	lea.l	$3F92(a5),a0
	movea.l	$2(a0),a3
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0065CA
	pea.l	($200).w
	move.l	#$FD00,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	lea.l	$C(a7),a7
	bra.s	loc_0065DE
loc_0065CA:
	pea.l	($140).w
	move.l	#$FD00,-(a7)
	move.l	a3,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	lea.l	$C(a7),a7
loc_0065DE:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_006610
	adda.w	#$200,a4
	pea.l	($200).w
	move.l	#$FA00,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	lea.l	$C(a7),a7
	bra.s	loc_006624
loc_006610:
	pea.l	($140).w
	move.l	#$FA00,-(a7)
	move.l	a3,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	lea.l	$C(a7),a7
loc_006624:
	jsr	HUD_UpdateHealthBars(pc)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
