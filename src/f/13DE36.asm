; ---------------------------------------------------------------------------
; ExplodeFx_BurstMedium - death effect: medium burst (7 puffs) - ExplodeFx_Burst(obj, 1)
; In:  8(a6) = object
; Out: none
; Evidence: XNpc_Explode for stats byte 2 = 2, Pop type 0, many StateDie functions (10 callers; jt 1877)
; ---------------------------------------------------------------------------
ExplodeFx_BurstMedium:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	jsr	ExplodeFx_Burst(pc)
	unlk	a6
	rts
