//
//  QuizQuestions.swift
//  PacketWise
//
//  Created by Fathi Ali on 2025-06-22.
//

import Foundation

struct QuizQuestion: Identifiable, Codable {
    let id: UUID
    let question: String
    let options: [String]
    let correctAnswer: Int
    let explanation: String
    let chapter: String
    var isBookmarked: Bool = false
}
