; ---------------------------------------------------------------------------
; Seg_SetEndpoints - set a floor segment's endpoints and recompute its length
; In:  4(a7) = segment, then words x1, y1, x2, y2 (stack args, no frame)
; Out: none
; Evidence: +8/+$A/+$C/+$E, then Seg_ComputeLength
; ---------------------------------------------------------------------------
Seg_SetEndpoints:
	move.l	a3,-(a7)
	movea.l	$8(a7),a3
	move.w	$E(a7),$8(a3)
	move.w	$12(a7),$A(a3)
	move.w	$16(a7),$C(a3)
	move.w	$1A(a7),$E(a3)
	move.l	a3,-(a7)
	jsr	Seg_ComputeLength(pc)
	addq.w	#$4,a7
	movea.l	(a7)+,a3
	rts
