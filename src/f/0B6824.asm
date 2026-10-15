; ---------------------------------------------------------------------------
; BrainBabyBio_OnDeath - BRAINBABYBIO slot +$72 OnDeath: turn into a SAVAGEMEDIUMBIO (same facing, 20-frame invulnerability, SavageMediumBio_SetHome($18E, $140)) and remove itself
; In:  8(a6) = this
; Out: none
; Evidence: Tbl_SavageMediumBio_vtable +$0E New at its position; slot +$52; jt 920; TAS 33558
; Found: jt 920
; ---------------------------------------------------------------------------
BrainBabyBio_OnDeath:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$207A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$207A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_0B6884
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0B686C
	ori.b	#$10,$2E(a3)
loc_0B686C:
	move.w	#$14,$6A(a3)
	pea.l	($140).w
	pea.l	($18E).w
	move.l	a3,-(a7)
	jsr	$203A(a5)	; -> SavageMediumBio_SetHome
	lea.l	$C(a7),a7
loc_0B6884:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
