; ---------------------------------------------------------------------------
; XNpc_StateStunStart - XNPC stun: inactive/no-hit flags ($5000), shake 12 frames
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: next XNpc_StateStun
; ---------------------------------------------------------------------------
XNpc_StateStunStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$5000,$6(a4)
	move.b	#$C,$90(a4)
	clr.w	$6C(a4)
	lea.l	XNpc_StateStun(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
