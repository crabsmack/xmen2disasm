; ---------------------------------------------------------------------------
; Deathbird_MovePolar_Case0 - Deathbird_MovePolar switch cases 0-2: speed multiplier 0, 1 or 2
; In:  inside Deathbird_MovePolar
; Out: -
; Evidence: Sw_1111EA targets Deathbird_MovePolar_Case0/11130E/11131E
; ---------------------------------------------------------------------------
Deathbird_MovePolar_Case0:
	movea.l	$28(a6),a0
	clr.w	(a0)
	movea.l	$2C(a6),a0
	clr.w	(a0)
	bra.w	$111510
loc_11130E:
	movea.l	$28(a6),a0
	move.w	d6,(a0)
	movea.l	$2C(a6),a0
	move.w	d7,(a0)
	bra.w	$111510
loc_11131E:
	move.l	d6,d0
	lsl.l	#$1,d0
	movea.l	$28(a6),a0
	move.w	d0,(a0)
	move.l	d7,d0
	lsl.l	#$1,d0
	movea.l	$2C(a6),a0
	move.w	d0,(a0)
	bra.w	$111510
