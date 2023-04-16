//
//  SwiftUiBullseyeTests.swift
//  SwiftUiBullseyeTests
//
//  Created by Tauan Camargo on 16/04/23.
//

import XCTest
@testable import SwiftUiBullseye

final class SwiftUiBullseyeTests: XCTestCase {
  var game: Game!
  
  override func setUpWithError() throws {
      game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() {
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
}
