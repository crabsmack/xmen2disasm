; ---------------------------------------------------------------------------
; BabyBio_Query7A - BabyBio: XNPC hook (class slot 29, +$7A): base writes 2 to *arg3 and returns 0; meaning unknown
; In:  8(a6) = this  $C(a6) = ?  $10(a6) = byte* out
; Out: d0
; Evidence: method 29 of class descriptor $11B74C (name string "BABYBIO", parent BIONPC)
; ---------------------------------------------------------------------------
BabyBio_Query7A:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$10(a6),a3
	movea.l	$8(a6),a4
	move.b	$F(a6),d0
	bmi.s	loc_11C6C4
	cmpi.b	#$3,d0
	bgt.s	loc_11C6C4
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_11C662(pc,d1.w),d1
	jmp	Sw_11C662-2(pc,d1.w)
