; ---------------------------------------------------------------------------
; Obj_UpdateBoxes - recompute both object boxes (body +$4C..+$52 and second box +$54..+$5A) and, for objects owning a floor segment, the segment's endpoints
; In:  8(a6) = object
; Out: none
; Evidence: like Obj_UpdateBox plus frame offsets +8..+$B into +$54..+$5A; if flags +6 bit $200 and segment index +$7A != $FF: segment record (-$33D2 + idx*$14) +8..+$E = left, top+1, right, bottom, then sub_1F79A2(segment)
; ---------------------------------------------------------------------------
Obj_UpdateBoxes:
	movea.l	$4(a7),a0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	a0,a3
	move.l	$8(a3),d6
	asr.l	#$8,d6
	move.l	$C(a3),d5
	asr.l	#$8,d5
	movea.l	$30(a3),a4
	lea.l	$24(a4),a4
	moveq	#$0,d0
	move.b	$2F(a3),d0
	cmpi.b	#$FF,d0
	beq.s	loc_1F4A72
	asl.w	#$2,d0
	adda.w	d0,a4
	asl.w	#$2,d0
	adda.w	d0,a4
loc_1F4A72:
	moveq	#$10,d0
	and.b	$2E(a3),d0
	beq.s	loc_1F4AB4
	move.b	$6(a4),d0
	ext.w	d0
	move.w	d6,d1
	sub.w	d0,d1
	move.w	d1,$4E(a3)
	move.b	$4(a4),d0
	ext.w	d0
	move.w	d6,d1
	sub.w	d0,d1
	move.w	d1,$52(a3)
	move.b	$A(a4),d0
	ext.w	d0
	move.w	d6,d1
	sub.w	d0,d1
	move.w	d1,$56(a3)
	move.b	$8(a4),d0
	ext.w	d0
	move.w	d6,d1
	sub.w	d0,d1
	move.w	d1,$5A(a3)
	bra.s	loc_1F4AE4
loc_1F4AB4:
	move.b	$4(a4),d0
	ext.w	d0
	add.w	d6,d0
	move.w	d0,$4E(a3)
	move.b	$6(a4),d0
	ext.w	d0
	add.w	d6,d0
	move.w	d0,$52(a3)
	move.b	$8(a4),d0
	ext.w	d0
	add.w	d6,d0
	move.w	d0,$56(a3)
	move.b	$A(a4),d0
	ext.w	d0
	add.w	d6,d0
	move.w	d0,$5A(a3)
loc_1F4AE4:
	moveq	#$8,d0
	and.b	$2E(a3),d0
	beq.s	loc_1F4B26
	move.b	$5(a4),d0
	ext.w	d0
	move.w	d5,d1
	sub.w	d0,d1
	move.w	d1,$50(a3)
	move.b	$7(a4),d0
	ext.w	d0
	move.w	d5,d1
	sub.w	d0,d1
	move.w	d1,$4C(a3)
	move.b	$9(a4),d0
	ext.w	d0
	move.w	d5,d1
	sub.w	d0,d1
	move.w	d1,$58(a3)
	move.b	$B(a4),d0
	ext.w	d0
	move.w	d5,d1
	sub.w	d0,d1
	move.w	d1,$54(a3)
	bra.s	loc_1F4B56
loc_1F4B26:
	move.b	$7(a4),d0
	ext.w	d0
	add.w	d5,d0
	move.w	d0,$50(a3)
	move.b	$5(a4),d0
	ext.w	d0
	add.w	d5,d0
	move.w	d0,$4C(a3)
	move.b	$B(a4),d0
	ext.w	d0
	add.w	d5,d0
	move.w	d0,$58(a3)
	move.b	$9(a4),d0
	ext.w	d0
	add.w	d5,d0
	move.w	d0,$54(a3)
loc_1F4B56:
	move.w	#$200,d0
	and.w	$6(a3),d0
	beq.s	loc_1F4B9C
	moveq	#$0,d0
	move.b	$7A(a3),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F4B9C
	lea.l	-$33D2(a5),a4
	lsl.w	#$2,d0
	adda.w	d0,a4
	lsl.w	#$2,d0
	adda.w	d0,a4
	move.w	$4E(a3),$8(a4)
	move.w	$4C(a3),$A(a4)
	addq.w	#$1,$A(a4)
	move.w	$52(a3),$C(a4)
	move.w	$50(a3),$E(a4)
	move.l	a4,-(a7)
	jsr	$4F02(a5)	; -> sub_1F79A2
	addq.w	#$4,a7
loc_1F4B9C:
	movem.l	(a7)+,d5-d7/a3-a4
	rts
