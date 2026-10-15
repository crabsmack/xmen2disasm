; ---------------------------------------------------------------------------
; Obj_StandOnSeg - put an object on a floor segment: remember it, clear airborne, take its layer, compute the position along it and place the object
; In:  8(a6) = object  $C(a6) = segment (0 = do nothing)
; Out: d0 = Obj_UpdateBoxes result or 0
; Evidence: +$76 = segment, +4 &= ~$1000, +$42 = segment +2, Seg_ComputeObjPos, Seg_ApplyObjPos, Obj_UpdateBoxes; 8 callers (XPlayer_PlaceAtSafePos, Ninja_Init, Tusk_StateIntro, ...)
; ---------------------------------------------------------------------------
Obj_StandOnSeg:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,d0
	beq.s	loc_1F6B92
	move.l	a3,$76(a4)
	andi.w	#$EFFF,$4(a4)
	move.b	$2(a3),$42(a4)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	$4EEA(a5)	; -> Seg_ComputeObjPos
	move.l	a4,-(a7)
	jsr	$4EDA(a5)	; -> Seg_ApplyObjPos
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	lea.l	$10(a7),a7
loc_1F6B92:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
