; ---------------------------------------------------------------------------
; BabySentinelA_Init - BabySentinelA: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $11B7D6 (name string "BABYSENTINELA", parent BABYBIO)
; ---------------------------------------------------------------------------
BabySentinelA_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3092(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	$3062(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	$2FE2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	movea.l	-$4(a6),a4
	unlk	a6
	rts
