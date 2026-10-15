; ---------------------------------------------------------------------------
; loc_15C49E	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_15C49E:
	moveq	#$1B,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$1B,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	ori.w	#$10,-$3C5E(a5)
	addq.w	#$8,a7
	bra.w	loc_15C5D6
loc_15C4BA:
	moveq	#$22,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$22,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	ori.w	#$20,-$3C5E(a5)
	move.w	#$63,-$38A8(a5)
	move.w	#$63,-$38AA(a5)
	addq.w	#$8,a7
	bra.w	loc_15C5D6
loc_15C4E2:
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	ori.w	#$C0,-$3C5E(a5)
	addq.w	#$8,a7
	bra.w	loc_15C5D6
loc_15C4FE:
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	ori.w	#$C0,-$3C5E(a5)
	addq.w	#$8,a7
	bra.w	loc_15C5D6
loc_15C51A:
	moveq	#$37,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$37,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$8,a7
	bne.w	loc_15C5D6
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_15C5D6
	jsr	$3A(a5)	; -> sub_005F18
	bra.s	loc_15C5D6
loc_15C564:
	moveq	#$39,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$39,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	ori.w	#$2000,-$3C5E(a5)
	addq.w	#$8,a7
	bra.s	loc_15C5D6
loc_15C57E:
	moveq	#$26,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$26,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	ori.w	#$400,-$3C5E(a5)
	addq.w	#$8,a7
	bra.s	loc_15C5D6
loc_15C598:
	moveq	#$24,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$24,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	ori.w	#$200,-$3C5E(a5)
	addq.w	#$8,a7
	bra.s	loc_15C5D6
loc_15C5B2:
	moveq	#$4F,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$4F,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	move.w	#$63,-$38A8(a5)
	move.w	#$63,-$38AA(a5)
	ori.w	#$27F0,-$3C5E(a5)
	addq.w	#$8,a7
