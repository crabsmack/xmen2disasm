; ---------------------------------------------------------------------------
; SavageMediumBio_TakeDamage - only calls BIONPC's TakeDamage (BioNpc_TakeDamage, through Tbl_BioNpc_vtable), which SAVAGEBIOBASE inherits anyway (SAVAGEMEDIUMBIO override of slot +$26 TakeDamage; adds nothing)
; In:  8(a6) = this, $C(a6) = attacker, then hit parameters (see ACTOR +$26 $15E680)
; Out: none
; Evidence: slot +$26 of the SAVAGEMEDIUMBIO descriptor $0BD39C; jt $2BDA = Tbl_BioNpc_vtable, slot +$26 = $114D0A; TAS frames 33579-33579 (1 frames active)
; ---------------------------------------------------------------------------
SavageMediumBio_TakeDamage:
	link.w	a6,#$0
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$2BDA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	unlk	a6
	rts
