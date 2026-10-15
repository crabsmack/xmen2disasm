; ---------------------------------------------------------------------------
; DropRocket_Init - DropRocket: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $133D76 (name string "DROPROCKET", parent BRAINROCKET)
; ---------------------------------------------------------------------------
DropRocket_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3622(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	sub_133BB2(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
