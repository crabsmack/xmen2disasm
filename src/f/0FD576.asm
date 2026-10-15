; ---------------------------------------------------------------------------
; SiberiaB1_LoadLevel - SiberiaB1: load the stage through the scene loader, 1:1 scroll ratios
; In:  none
; Out: none
; Evidence: sub_1F98A8 with thunks $0F4F00/$0F563A/$0F519A
; ---------------------------------------------------------------------------
SiberiaB1_LoadLevel:
	link.w	a6,#$0
	movem.l	d4-d7,-(a7)
	moveq	#$1,d4
	clr.b	d5
	moveq	#$1,d6
	clr.b	d7
	lea.l	$2972(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$0,d2
	move.b	d7,d2
	move.l	d2,-(a7)
	moveq	#$0,d2
	move.b	d6,d2
	move.l	d2,-(a7)
	moveq	#$0,d2
	move.b	d5,d2
	move.l	d2,-(a7)
	moveq	#$0,d2
	move.b	d4,d2
	move.l	d2,-(a7)
	lea.l	$2962(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$296A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$296A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$295A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$295A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	move.b	#$1,-$38B4(a5)
	move.w	#$100,-$3496(a5)
	move.w	#$100,-$3498(a5)
	clr.w	-$349E(a5)
	clr.w	-$34A0(a5)
	clr.w	-$349A(a5)
	clr.w	-$349C(a5)
	movem.l	-$10(a6),d4-d7
	unlk	a6
	rts
