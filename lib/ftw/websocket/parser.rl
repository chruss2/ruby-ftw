require "ftw/namespace"
require "ftw/websocket"

#
#     0                   1                   2                   3
#     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
#    +-+-+-+-+-------+-+-------------+-------------------------------+
#    |F|R|R|R| opcode|M| Payload len |    Extended payload length    |
#    |I|S|S|S|  (4)  |A|     (7)     |             (16/64)           |
#    |N|V|V|V|       |S|             |   (if payload len==126/127)   |
#    | |1|2|3|       |K|             |                               |
#    +-+-+-+-+-------+-+-------------+ - - - - - - - - - - - - - - - +
#    |     Extended payload length continued, if payload len == 127  |
#    + - - - - - - - - - - - - - - - +-------------------------------+
#    |                               |Masking-key, if MASK set to 1  |
#    +-------------------------------+-------------------------------+
#    | Masking-key (continued)       |          Payload Data         |
#    +-------------------------------- - - - - - - - - - - - - - - - +
#    :                     Payload Data continued ...                :
#    + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +
#    |                     Payload Data continued ...                |
#    +---------------------------------------------------------------+

%%{
  opcode = any
  mask_and_payload = 127
  message = opcode mask_and_payload payload
  op = any %op

  main := message+
}%%