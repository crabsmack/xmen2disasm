; ---------------------------------------------------------------------------
; SpaceB1_LoadLevel - SpaceB1: load the stage through the scene loader, set scroll ratios/offsets, install the type-28 segment handler
; In:  none
; Out: none
; Evidence: sub_1F98A8 with thunks $0FDE9C/$10624C/$0CA79C/$0FD7CA/$1061FA; $FFCE06 = SpaceB1_Seg28Handler
; ---------------------------------------------------------------------------
SpaceB1_LoadLevel:
	link.w	a6,#$0
	lea.l	$29C2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$F,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$29B2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2352(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$29CA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$29BA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$29BA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	move.w	#$A84,g_PalBase(a5)
	move.b	#$1,-$38B4(a5)
	lea.l	SpaceB1_Seg28Handler(pc),a0
	move.l	a0,-$33FA(a5)
	clr.b	-$3AB6(a5)
	move.w	#$4D,-$3498(a5)
	move.w	#$4D,-$3496(a5)
	move.w	#$1960,-$349E(a5)
	move.w	#$7A0,-$34A0(a5)
	clr.w	-$349A(a5)
	clr.w	-$349C(a5)
	move.w	#$82,-$3898(a5)
	move.w	#$BE,-$389A(a5)
	unlk	a6
	rts
