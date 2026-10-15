; ---------------------------------------------------------------------------
; ExodusBlast_ClassInit - vtable +$5E: per-level class setup for EXODUSBLAST (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor EXODUSBLAST slot +$5E (tools/classes.py); TAS frames 17191-17191 (1 active)
; ---------------------------------------------------------------------------
ExodusBlast_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	sub_02E306(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$5FA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3CB2(a5)
	unlk	a6
	rts
