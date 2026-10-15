; ---------------------------------------------------------------------------
; VDP_ResetDmaQueue - empty the V-blank DMA queue
; In:  none
; Out: none
; Evidence: clears word -$7B4(a5) (queue count used by VDP_QueueDma/VDP_FlushDmaQueue); called by Sys_InitHardware
; ---------------------------------------------------------------------------
VDP_ResetDmaQueue:
	link.w	a6,#$0
	clr.w	-$7B4(a5)
	unlk	a6
	rts
