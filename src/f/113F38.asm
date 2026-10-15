; ---------------------------------------------------------------------------
; XNpc_OnDeath - XNpc: XNPC hook: health ran out (class slot 27, +$72; called from XNpc_TakeDamage)
; In:  8(a6) = this  $F(a6) = byte damage  $13(a6) = byte hit type
; Out: none
; Evidence: method 27 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_OnDeath:
	link.w	a6,#$0
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$F(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	jsr	sub_11410E(pc)
	unlk	a6
	rts
