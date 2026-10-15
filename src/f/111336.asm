; ---------------------------------------------------------------------------
; Deathbird_MovePolar_Case3 - Deathbird_MovePolar switch case 3: speed multiplier 3
; In:  inside Deathbird_MovePolar
; Out: -
; Evidence: Sw_1111EA target
; ---------------------------------------------------------------------------
Deathbird_MovePolar_Case3:
	move.l	d6,d0
	lsl.l	#$1,d0
	add.w	d6,d0
	movea.l	$28(a6),a0
	move.w	d0,(a0)
	move.l	d7,d0
	lsl.l	#$1,d0
	add.w	d7,d0
	movea.l	$2C(a6),a0
	move.w	d0,(a0)
	bra.w	$111510
