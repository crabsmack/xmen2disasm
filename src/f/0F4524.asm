; ---------------------------------------------------------------------------
; SentinelsB_SegIsMode3 - Sentinels segment handler: return 1 in mode 3, 0 otherwise
; In:  $A(a6) = word mode
; Out: d0.b
; Evidence: installed for segment types 26/27 by the SentinelsB1/B2 InstallSegHooks
; ---------------------------------------------------------------------------
SentinelsB_SegIsMode3:
	link.w	a6,#$0
	move.l	d3,-(a7)
	moveq	#$3,d1
	cmp.w	$A(a6),d1
	seq.b	d3
	neg.b	d3
	sne.b	d0
	andi.w	#$1,d0
	move.l	-$4(a6),d3
	unlk	a6
	rts
