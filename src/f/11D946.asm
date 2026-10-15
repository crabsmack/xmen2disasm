; ---------------------------------------------------------------------------
; BabyMoleMan_Init - BABYBIO Init, then palette 1, stats Tbl_BabyMoleManStats (health = byte 2), AI script by variant +$BB (0-4: jt $320A/$3212/$321A, Tbl_BabyMoleManAiScript2/3), start at the script's first step (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry or 0
; Out: none
; Evidence: method 3 of class descriptor $11B986 (name string "BABYMOLEMAN", parent BABYBIO)
; ---------------------------------------------------------------------------
BabyMoleMan_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$30AA(a5),a0
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
	move.b	$BB(a4),d0
	subq.b	#$1,d0
	lea.l	$10(a7),a7
	bcs.s	BabyMoleMan_Init_Default
	cmpi.b	#$3,d0
	bhi.s	BabyMoleMan_Init_Default
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_11D946(pc,d1.w),d1
	jmp	Sw_11D946-2(pc,d1.w)
