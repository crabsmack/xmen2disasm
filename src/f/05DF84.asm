; ---------------------------------------------------------------------------
; loc_05DF84	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_05DF84:
	lea.l	sub_05D11C(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	bra.w	$5E044
loc_05DF94:
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	sub_05D0BC(pc)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_05DFB6
	move.l	a3,$A0(a4)
	move.l	a4,$A0(a3)
loc_05DFB6:
	ori.w	#$4000,$6(a4)
	ori.w	#$1000,$6(a4)
	subi.l	#$8000,$8(a4)
	move.w	#$64,$16(a4)
	move.w	#$28,$1E(a4)
	lea.l	$C5A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	sub_05D5FC(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	addq.w	#$8,a7
	bra.s	$5E044
loc_05DFF4:
	ori.b	#$10,$2E(a4)
	ori.w	#$4000,$6(a4)
	ori.w	#$1000,$6(a4)
	addi.l	#$8000,$8(a4)
	move.w	#$FF9C,$16(a4)
	move.w	#$FFD8,$1E(a4)
	lea.l	$C5A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	sub_05D5FC(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	addq.w	#$8,a7
	bra.s	$5E044
