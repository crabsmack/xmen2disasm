; ---------------------------------------------------------------------------
; BubbleManager_SpawnCluster - BUBBLEMANAGER: release +$9E bubbles around itself (random +-8 px, direction 4) and restart the timer
; In:  8(a6) = this
; Out: none
; Evidence: sub_1600AA random offsets; FloatBubble_Spawn(..., +$98, +$9A, 4); +$6E = +$9C; 2 callers; TAS 29719-31581
; Found: link-after-rts
; ---------------------------------------------------------------------------
BubbleManager_SpawnCluster:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4,d4
	moveq	#$0,d7
	bra.s	loc_0AB2B2
loc_0AB260:
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	lsl.l	#$1,d1
	sub.l	#$800,d1
	move.l	d1,d5
	add.l	$8(a4),d5
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	lsl.l	#$1,d1
	sub.l	#$800,d1
	move.l	d1,d6
	add.l	$C(a4),d6
	ext.l	d4
	move.l	d4,-(a7)
	move.w	$9A(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$98(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	d6,-(a7)
	move.l	d5,-(a7)
	jsr	$1B22(a5)	; -> FloatBubble_Spawn
	movea.l	d0,a3
	lea.l	$14(a7),a7
	move.l	d7,d0
	addq.l	#$1,d7
loc_0AB2B2:
	move.w	$9E(a4),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_0AB260
	move.w	$9C(a4),$6E(a4)
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
