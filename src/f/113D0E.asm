; ---------------------------------------------------------------------------
; XNpc_GetMoveLimit - XNPC slot 29 (+$7A) base: no movement limit (*kind = 2)
; In:  8(a6) = this  $F(a6) = byte direction  $10(a6) = byte* kind out
; Out: d0 = 0
; Evidence: method 29 of Tbl_XNpc_vtable; BabyBio_GetMoveLimit shows the contract; XNpc_HurtReact/XNpc_DeathReact use it to stop knockback at walls (kind 0) or edges (kind 1)
; ---------------------------------------------------------------------------
XNpc_GetMoveLimit:
	link.w	a6,#$0
	movea.l	$10(a6),a0
	move.b	#$2,(a0)
	moveq	#$0,d0
	unlk	a6
	rts
