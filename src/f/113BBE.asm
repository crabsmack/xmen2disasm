; ---------------------------------------------------------------------------
; XNpc_Init - XNPC constructor: parent Init, stats record +$8C = Tbl_XNpcTakeDamage_Hurt (the default), health +$68 = stats byte 2, clear +$90 and the hurt state +$60 (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry or 0
; Out: none
; Evidence: method 3 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BD2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$2C6A(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	clr.b	$90(a4)
	moveq	#$0,d0
	move.l	d0,$60(a4)
	lea.l	$10(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
