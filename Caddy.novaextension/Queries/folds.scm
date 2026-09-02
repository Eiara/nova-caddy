(
  [
    (site_block)
    (block)
    (named_matcher)
  ] @subtree
  (#set! role block)
  (#set! scope.byLine)
)
(
  (global_options)
  (#set! role block)
  (#set! scope.byLine)
) @subtree

;; Set top-level objects as foldable
; ((snippet_name) @subtree
; (#set! role block)
; (#set! scope.byLine)
; )

; ((named_route_identifier) @subtree
; (#set! role block)
; (#set! scope.byLine)
; )



;; directives should also fold
; ((directive (directive_name) @subtree)
; (#set! role block)
; (#set! scope.byLine)
; )
; 
; ((matcher (matcher_identifier (matcher_name)) @subtree)
; (#set! role block)
; (#set! scope.byLine)
; )
; 
; ((matcher_directive (matcher_directive_name) @subtree)
; (#set! role block)
; (#set! scope.byLine)
; )