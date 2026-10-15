; ---------------------------------------------------------------------------
; SentinelsB2_CallStubs - SentinelsB2: call two Sentinels helpers and an empty stub
; In:  none
; Out: none
; Evidence: sub_0DC2C6, sub_0DC38C, SentinelsB2_EmptyStub
; ---------------------------------------------------------------------------
SentinelsB2_CallStubs:
	link.w	a6,#$0
	jsr	$23EA(a5)	; -> sub_0DC2C6
	jsr	$2402(a5)	; -> sub_0DC38C
	jsr	SentinelsB2_EmptyStub(pc)
	unlk	a6
	rts
