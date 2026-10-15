; ---------------------------------------------------------------------------
; Seg_ApplyPushOut - default floor-contact resolver: zero the velocity components pushing into the segment, apply the push-out to the position, flag which axis was hit
; In:  8(a6) = segment  $C(a6) = object  $10(a6) = contact record (+2 byte, +3/+4 push-out x/y)
; Out: none
; Evidence: installed in g_SegResolveHook by Level_Load (jt[2523]); types $E/$1D ignored; solid blocks $13-$1C stop motion toward the push; steep slopes (|slope| >= $60) redirect motion along them; walls 1/2/$1F/$20 and ceiling 4; position += push << 8; Seg_ComputeObjPos when grounded; +4 |= $100 (x) / $80 (y), +$7B = contact +2
; ---------------------------------------------------------------------------
Seg_ApplyPushOut:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.w	$16(a4),d6
	move.w	$18(a4),d7
	move.b	$1(a3),d0
	subi.b	#$E,d0
	bmi.w	Seg_ApplyPushOut_Default
	cmpi.b	#$F,d0
	bgt.w	Seg_ApplyPushOut_Default
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1F7628(pc,d1.w),d1
	jmp	Sw_1F7628-2(pc,d1.w)
