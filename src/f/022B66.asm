; ---------------------------------------------------------------------------
; AvalonA2_CallEmptyStubs - first step of AvalonA2_RunScene: call two empty stubs
; In:  none
; Out: none
; Evidence: AvalonA2_EmptyStub1 + AvalonA2_EmptyStub2 (same pattern as CloneA2_CallEmptyStubs)
; ---------------------------------------------------------------------------
AvalonA2_CallEmptyStubs:
	link.w	a6,#$0
	jsr	AvalonA2_EmptyStub1(pc)
	jsr	AvalonA2_EmptyStub2(pc)
	unlk	a6
	rts
