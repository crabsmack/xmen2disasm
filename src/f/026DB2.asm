; ---------------------------------------------------------------------------
; RetractFloor_StateWait - RETRACTFLOOR: keep the camera fields at 100/$91 until a drop happened; when triggered raise the fall value -$3CD0 (+$10, max $500) and drop after 30 frames
; In:  8(a6) = this
; Out: d0
; Evidence: g_Camera +$40/+$42 while -$3AFA == 0; +$8C bit 0 = triggered; +6 |= $1000; next RetractFloor_StateDrop
; ---------------------------------------------------------------------------
RetractFloor_StateWait:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	-$3AFA(a5)
	bne.s	loc_026DD6
	movea.l	g_Camera(a5),a0
	move.w	#$64,$40(a0)
	movea.l	g_Camera(a5),a0
	move.w	#$91,$42(a0)
loc_026DD6:
	move.w	$8C(a4),d0
	btst	#$0,d0
	beq.s	loc_026E08
	ori.w	#$1000,$6(a4)
	cmpi.w	#$500,g_RetractFloorDepth(a5)
	bge.s	loc_026DF4
	addi.w	#$10,g_RetractFloorDepth(a5)
loc_026DF4:
	move.w	#$1E,$6C(a4)
	lea.l	RetractFloor_StateDrop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_026E08:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
