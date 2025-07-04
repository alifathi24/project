//
//  QuizViewModel.swift
//  PacketWise
//
//  Created by Fathi Ali on 2025-06-22.
//

import Foundation
import Combine

class QuizViewModel: ObservableObject {
    @Published var questions: [QuizQuestion] = []

    init() {
        loadQuestions()
    }

    func loadQuestions() {
        questions = Bundle.main.decode([QuizQuestion].self, from: "questions_ch1.json")
    }
}
