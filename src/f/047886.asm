; ---------------------------------------------------------------------------
; BaniMazaA2_CallEmptyStub - first step of BaniMazaA2_RunScene: call BaniMazaA2_NopStatic
; In:  none
; Out: none
; Evidence: body is a single jsr
; ---------------------------------------------------------------------------
BaniMazaA2_CallEmptyStub:
	link.w	a6,#$0
	jsr	BaniMazaA2_NopStatic(pc)
	unlk	a6
	rts
