; ---------------------------------------------------------------------------
; MagneticGlob_Deactivate - MAGNETICGLOB slot +$46: stop the timer and leave the draw list
; In:  8(a6) = bolt
; Out: none
; Evidence: +4 |= $4000, Timer_Stop, DrawList_Remove
; ---------------------------------------------------------------------------
MagneticGlob_Deactivate:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_157ECC
	ori.w	#$4000,$4(a4)
	andi.b	#$DF,$2E(a4)
	move.b	#$FF,$3B(a4)
	move.b	#$FF,$3A(a4)
	movea.l	$7C(a4),a3
	move.l	a3,d0
	beq.s	loc_157EB0
	move.l	a3,-(a7)
	jsr	$4FE2(a5)	; -> Timer_Stop
	addq.w	#$4,a7
loc_157EB0:
	moveq	#-$1,d0
	cmp.w	$88(a4),d0
	bge.s	loc_157ECC
	move.w	$88(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F72(a5)	; -> DrawList_Remove
	move.w	#$FFFF,$88(a4)
	addq.w	#$4,a7
loc_157ECC:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
