; ---------------------------------------------------------------------------
; LittleLeg_Destroy - LITTLELEG slot +$16: destroy - free the update timer and the draw-list entry
; In:  8(a6) = this
; Out: none
; Evidence: Timer_Stop/Timer_Free(+$62), DrawList_Remove(+$66); TAS 51072
; Found: jt 615
; ---------------------------------------------------------------------------
LittleLeg_Destroy:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$62(a4)
	beq.s	loc_085FAA
	move.l	$62(a4),-(a7)
	jsr	$4FE2(a5)	; -> Timer_Stop
	move.l	$62(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$62(a4)
	addq.w	#$8,a7
loc_085FAA:
	moveq	#-$1,d0
	cmp.w	$66(a4),d0
	bge.s	loc_085FC6
	move.w	$66(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F72(a5)	; -> DrawList_Remove
	move.w	#$FFFF,$66(a4)
	addq.w	#$4,a7
loc_085FC6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
