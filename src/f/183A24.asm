; ---------------------------------------------------------------------------
; Beast_RollProbeCb - segment-touch hook used while probing the roll path: mark that something was hit
; In:  8(a6) = unused, $C(a6) = object, $10(a6) = pointer segment flags
; Out: none
; Evidence: obj+$7B = 1, *flags |= $8000; installed in $FFCD78 by Beast_RollPathClear
; ---------------------------------------------------------------------------
Beast_RollProbeCb:
	link.w	a6,#$0
	movea.l	$C(a6),a0
	move.b	#$1,$7B(a0)
	movea.l	$10(a6),a0
	ori.w	#$8000,(a0)
	unlk	a6
	rts
