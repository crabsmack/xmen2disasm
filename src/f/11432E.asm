; ---------------------------------------------------------------------------
; XNpc_StateExplode - XNPC state: call Explode (+$7E)
; In:  8(a6) = this
; Out: none
; Evidence: TAS 318-54508
; ---------------------------------------------------------------------------
XNpc_StateExplode:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
