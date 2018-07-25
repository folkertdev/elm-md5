module Tests exposing (..)

import Expect
import MD5 exposing (hex)
import Test exposing (Test, describe)


test : String -> String -> String -> Test
test description expected input =
    Test.test description <|
        \() ->
            Expect.equal (hex input) expected


other : Test
other =
    describe "random input"
        [ test "foobar" "6df23dc03f9b54cc38a0fc1483df6e21" "foobarbaz"
        , test "lorem" "db89bb5ceab87f9c0fcc2ab36c189c2c" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        , test "latin1" "38e3f1e10c0b5072c874a72c3c6493d8" "æ ø å ñ"
        , test "unicode" "2adb08ac813a93665950fe9203faca10" "€ ♝ ♧ ☐"
        , test "newlines" "e1c06d85ae7b8b032bef47e42e4c08f9" "\n\n"
        ]


rfc1321 : Test
rfc1321 =
    describe "testcases listed in rfc1321"
        [ test "empty" "d41d8cd98f00b204e9800998ecf8427e" ""
        , test "a" "0cc175b9c0f1b6a831c399e269772661" "a"
        , test "abc" "900150983cd24fb0d6963f7d28e17f72" "abc"
        , test "message digest" "f96b697d7cb7938d525a2f31aaf161d0" "message digest"
        , test "lowercase alpha" "c3fcd3d76192e4007dfb496cca67e13b" "abcdefghijklmnopqrstuvwxyz"
        , test "alphanum" "d174ab98d277d9f5a5611c2c9f419d9f" "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        , test "numnumnum" "57edf4a22be3c955ac49da2e2107b67a" "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
        ]
