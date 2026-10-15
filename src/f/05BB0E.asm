; ---------------------------------------------------------------------------
; Boulder_ClassInit - vtable +$5E: per-level class setup for BOULDER (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor BOULDER slot +$5E (tools/classes.py); TAS frames 20323-20323 (1 active)
; ---------------------------------------------------------------------------
Boulder_ClassInit:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.l	$8(a6),-(a7)
	jsr	Boulder_Nop6A(pc)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$C12(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C6A(a5)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$C1A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C6C(a5)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$C22(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C62(a5)
	move.l	#$258,d7
	pea.l	Str_Empty_05BB84(pc)
	move.l	d7,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	addq.l	#$8,a7
	move.l	d0,-(a7)
	jsr	sub_05B016(pc)
	lea.l	$20(a7),a7
	clr.w	-$3B32(a5)
	clr.w	-$3B04(a5)
	move.l	-$4(a6),d7
	unlk	a6
	rts
