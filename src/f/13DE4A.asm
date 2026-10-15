; ---------------------------------------------------------------------------
; ExplodeFx_BurstSmall - death effect: small burst (5 puffs) - ExplodeFx_Burst(obj, 2)
; In:  8(a6) = object
; Out: none
; Evidence: XNpc_Explode default (stats byte 2 = 1/other), Mine_Explode, bombs; 12 callers (jt 1878); TAS 2547-57171
; ---------------------------------------------------------------------------
ExplodeFx_BurstSmall:
	link.w	a6,#$0
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	jsr	ExplodeFx_Burst(pc)
	unlk	a6
	rts
