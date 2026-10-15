; ---------------------------------------------------------------------------
; SavageA3_FrameStub - empty per-frame stub of the SavageA3 frame hook
; Out: none
; Evidence: called from SavageA3_FrameHook unless fading; TAS 32259-33097
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA3_FrameStub:
	link.w	a6,#$0
	unlk	a6
	rts
