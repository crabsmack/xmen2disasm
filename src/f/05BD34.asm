; ---------------------------------------------------------------------------
; Boulder_TakeDamage - vtable +$26: a BOULDER takes a hit
; In:  8(a6) = this (BOULDER object)
; Out: none
; Evidence: class descriptor BOULDER slot +$26 (tools/classes.py); TAS frames 20774-20978 (3 active)
; ---------------------------------------------------------------------------
Boulder_TakeDamage:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	bne.s	loc_05BD8A
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
	move.l	a4,-(a7)
	lea.l	$D22(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_05BD8A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
