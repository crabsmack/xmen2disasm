; ---------------------------------------------------------------------------
; FluxBomb_Draw - FLUXBOMB slot +$1A: draw the particles for the current phase and the bomb sprite
; In:  8(a6) = bomb
; Out: none
; Evidence: phase 1 FluxBomb_DrawImplode, 3 FluxBomb_DrawBurst; Spr_Draw($FFE798, screen x/y)
; ---------------------------------------------------------------------------
FluxBomb_Draw:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$100(a4),d0
	subq.b	#$1,d0
	beq.s	loc_158DEC
	subq.b	#$2,d0
	beq.s	loc_158DF6
	bra.s	loc_158DFE
loc_158DEC:
	move.l	a4,-(a7)
	jsr	FluxBomb_DrawImplode(pc)
	addq.w	#$4,a7
	bra.s	loc_158DFE
loc_158DF6:
	move.l	a4,-(a7)
	jsr	FluxBomb_DrawBurst(pc)
	addq.w	#$4,a7
loc_158DFE:
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
	pea.l	-$1A68(a5)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$C(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
