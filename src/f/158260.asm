; ---------------------------------------------------------------------------
; FluxBomb_New - FLUXBOMB slot +$0E: (re)use the single static bomb object: kill the old one, Init and Activate
; In:  8(a6) = unused, $C(a6) = descriptor, $10..$18(a6) = Init args
; Out: d0 = $FFE7AC
; Evidence: if $FFE7B0 bit 15 -> Kill; +$12 Init, +$3E Activate
; ---------------------------------------------------------------------------
FluxBomb_New:
	link.w	a6,#$0
	move.l	a4,-(a7)
	lea.l	g_FluxBombObj(a5),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	beq.s	loc_158284
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_158284:
	move.l	$C(a6),(a4)
	move.l	$18(a6),-(a7)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	move.l	a4,d0
	lea.l	$14(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
