; ---------------------------------------------------------------------------
; BanimazaDoor_ClassInit - vtable +$5E: per-level class setup for BANIMAZADOOR (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor BANIMAZADOOR slot +$5E (tools/classes.py); TAS frames 22429-22429 (1 active)
; ---------------------------------------------------------------------------
BanimazaDoor_ClassInit:
	link.w	a6,#$0
	move.l	#$1869F,-(a7)
	jsr	$4182(a5)	; -> sub_160512
	move.l	$8(a6),-(a7)
	jsr	BanimazaDoor_NopStatic(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$90A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C86(a5)
	lea.l	$10(a7),a7
	pea.l	Str_Empty_03A2F2(pc)
	pea.l	($120).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3C84(a5)
	lea.l	BanimazaDoor_PushCallback(pc),a0
	move.l	a0,-$33FA(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
