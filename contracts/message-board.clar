(define-map messages
  { id: uint }
  { text: (string-ascii 256) })

(define-data-var message-count uint u0)

(define-public (post-message (text (string-ascii 256)))
  (let (
        (id (+ (var-get message-count) u1))
       )
       (map-set messages
         { id: id }
         { text: text }
       )
       (var-set message-count id)
       (ok id)
  )
)

(define-read-only (get-message (id uint))
  (map-get? messages { id: id })
)
