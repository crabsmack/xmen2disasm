; ---------------------------------------------------------------------------
; XNpc_TakeDamage_Default - XNpc_TakeDamage hit types 5-8 and out-of-range: pass to ACTOR TakeDamage
; In:  inside XNpc_TakeDamage
; Out: -
; Evidence: Sw_113D20 targets; parent +$26 via Tbl_XNpc_vtable
; ---------------------------------------------------------------------------
XNpc_TakeDamage_Default:
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BD2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
	bra.w	XNpc_TakeDamage_Done
