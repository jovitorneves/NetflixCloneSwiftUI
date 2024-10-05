//
//  StringExtensionsTests.swift
//  NetflixCloneTests
//
//  Created by J. Vitor Neves on 05/10/24.
//

import Testing
@testable import NetflixClone

struct StringExtensionsTests {

    @Test("Check capitalizes First")
    @available(macOS 15, *)
    func testCapitalizesFirst() {
        let testCases: [(input: String, expected: String)] = [
            ("hello", "Hello"),
            ("world", "World"),
            ("swift", "Swift"),
            ("TEST", "Test"),
            ("", ""),
            ("hElLo WoRlD", "Hello world"),
            ("123hello", "123hello"),
            ("#hashtag", "#hashtag"),
            ("@user", "@user")
        ]
        
        for testCase in testCases {
            let result = testCase.input.capitalizesFirst()
            #expect(result == testCase.expected)
        }
    }

    @Test
    @available(macOS 15, *)
    func testCapitalizesFirstWithSingleCharacter() {
        #expect(String("a").capitalizesFirst() == "A")
        #expect("Z".capitalizesFirst() == "Z")
    }

    @Test
    @available(macOS 15, *)
    func testCapitalizesFirstWithNumbers() {
        #expect("123hello".capitalizesFirst() == "123hello")
    }

    @Test
    @available(macOS 15, *)
    func testCapitalizesFirstWithSpecialCharacters() {
        #expect("#hashtag".capitalizesFirst() == "#hashtag")
        #expect("@user".capitalizesFirst() == "@user")
    }
}
