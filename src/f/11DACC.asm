; ---------------------------------------------------------------------------
; FloatBio_Init - BABYBIO Init, then stats jt $3272 (health = byte 2), +$B4 = $100, mode +$BE = variant & 3 with its AI script (0 jt $3232; 1 jt $3242 with vertical limits +$B2/+$B0 = y -/+ |p6|/|p8| (default 48); 2 jt $324A; 3 jt $323A with period +$BC = p6, default 60), start at the script's first step (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry
; Out: none
; Evidence: method 3 of class descriptor $11BA14 (name string "FLOATBIO", parent BABYBIO)
; ---------------------------------------------------------------------------
FloatBio_Init:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$30B2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$3072(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	move.w	#$100,$B4(a4)
	moveq	#$0,d0
	move.b	$BB(a4),d0
	moveq	#$3,d1
	and.b	d0,d1
	move.b	d1,$BE(a4)
	move.w	#$3C,$BC(a4)
	move.b	$BE(a4),d0
	cmpi.b	#$3,d0
	lea.l	$10(a7),a7
	bhi.s	FloatBio_Init_Case0
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_11DACC(pc,d1.w),d1
	jmp	Sw_11DACC-2(pc,d1.w)
