; ---------------------------------------------------------------------------
; XNpc_OnHurt - took damage but survived: XNpc_HurtReact(this, damage, type) (knockback, stun, hurt state) (XNPC base of slot 26, +$6E; called from XNpc_TakeDamage)
; In:  8(a6) = this  $F(a6) = byte damage  $13(a6) = byte hit type
; Out: none
; Evidence: method 26 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_OnHurt:
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
	jsr	XNpc_HurtReact(pc)
	unlk	a6
	rts
