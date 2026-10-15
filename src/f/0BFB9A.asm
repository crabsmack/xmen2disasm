; ---------------------------------------------------------------------------
; SwampBubbles_Draw_Multi - SwampBubbles_Draw cases 2-5: draw the extra bubbles
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
SwampBubbles_Draw_Multi:
	move.l	d5,-(a7)
	move.l	d4,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$C(a7),a7
	bra.w	SwampBubbles_Draw_Done
loc_0BFBAE:
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$10,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$18(a7),a7
	bra.w	SwampBubbles_Draw_Done
loc_0BFBDA:
	move.l	d5,-(a7)
	move.l	d4,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$20,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$20,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$24(a7),a7
	bra.w	SwampBubbles_Draw_Done
loc_0BFC12:
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$10,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$30,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$30,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$30(a7),a7
	bra.s	SwampBubbles_Draw_Done
loc_0BFC60:
	move.l	d5,-(a7)
	move.l	d4,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$40,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	d5,-(a7)
	move.l	d4,d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$24(a7),a7
