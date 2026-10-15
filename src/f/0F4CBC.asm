; ---------------------------------------------------------------------------
; SentinelsB2_CallStubs - SentinelsB2: call two Sentinels helpers and an empty stub
; In:  none
; Out: none
; Evidence: SentinelsD1_EmptyStub, SentinelsB2_EmptyStub2, SentinelsB2_EmptyStub
; ---------------------------------------------------------------------------
SentinelsB2_CallStubs:
	link.w	a6,#$0
	jsr	$23EA(a5)	; -> SentinelsD1_EmptyStub
	jsr	$2402(a5)	; -> SentinelsB2_EmptyStub2
	jsr	SentinelsB2_EmptyStub(pc)
	unlk	a6
	rts
