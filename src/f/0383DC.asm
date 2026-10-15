; ---------------------------------------------------------------------------
; BaniMazaA1_LoadLevel - load the BaniMazaA1 (Moving Blocks) level
; In:  none
; Out: none
; Evidence: sub_1F98A8 level load (class list jt $4383A); -$3298/-$3296 = $100/$100; byte -$3AB4 = 1
; ---------------------------------------------------------------------------
BaniMazaA1_LoadLevel:
	link.w	a6,#$0
	lea.l	$92A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$6,d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$91A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$932(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$932(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$922(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$922(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	move.w	#$100,-$3498(a5)
	move.w	#$100,-$3496(a5)
	move.b	#$1,-$3AB4(a5)
	move.b	#$1,-$38DE(a5)
	clr.b	-$38DE(a5)
	move.b	#$1,-$38B4(a5)
	unlk	a6
	rts
