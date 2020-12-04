#lang sicp

; Pascal triangle is a binary tree.
; Common rule: to create new left node, check value of current node's left neighbour, if there is no node -- copy current node's value to a new left node.
; Same for a right.