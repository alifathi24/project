//
//  QuizView.swift
//  PacketWise
//
//  Created by Fathi Ali on 2025-06-22.
//
import Foundation
import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel: QuizViewModel

    @State private var selectedAnswerIndex: Int? = nil
    @State private var showExplanation = false

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            // Progress
            Text("Question \(viewModel.currentQuestionIndex + 1) of \(viewModel.questions.count)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top)

            // Question text
            Text(viewModel.questions[viewModel.currentQuestionIndex].question)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)

            // Options list
            VStack(spacing: 15) {
                ForEach(0..<viewModel.questions[viewModel.currentQuestionIndex].options.count, id: \.self) { index in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selectedAnswerIndex = index
                            showExplanation = true
                        }
                    }) {
                        HStack {
                            Text(viewModel.questions[viewModel.currentQuestionIndex].options[index])
                                .font(.body)
                                .foregroundColor(.white)
                            Spacer()
                            if showExplanation {
                                Image(systemName: feedbackIcon(for: index))
                                    .foregroundColor(feedbackColor(for: index))
                                    .font(.headline)
                                    .transition(.scale)
                            }
                        }
                        .padding()
                        .background(buttonBackgroundColor(for: index))
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 2)
                    }
                    .disabled(showExplanation)  // Disable once answered
                }
            }

            // Explanation Box
            if showExplanation {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Explanation")
                        .font(.headline)
                        .padding(.bottom, 2)

                    Text(viewModel.questions[viewModel.currentQuestionIndex].explanation)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(15)
                .shadow(radius: 4)
                .transition(.opacity)
            }

            Spacer()

            // Next Button
            Button(action: {
                withAnimation(.spring()) {
                    viewModel.nextQuestion()
                    selectedAnswerIndex = nil
                    showExplanation = false
                }
            }) {
                Text(viewModel.currentQuestionIndex + 1 == viewModel.questions.count ? "Finish" : "Next Question")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
            .disabled(!showExplanation)
        }
        .padding()
        .animation(.default, value: showExplanation)
    }

    // MARK: - Helper Functions

    func buttonBackgroundColor(for index: Int) -> Color {
        guard showExplanation, let selected = selectedAnswerIndex else {
            return Color.blue.opacity(0.75)
        }
        if index == viewModel.questions[viewModel.currentQuestionIndex].correctAnswer {
            return Color.green
        }
        if index == selected && index != viewModel.questions[viewModel.currentQuestionIndex].correctAnswer {
            return Color.red
        }
        return Color.gray.opacity(0.5)
    }

    func feedbackIcon(for index: Int) -> String {
        if index == viewModel.questions[viewModel.currentQuestionIndex].correctAnswer {
            return "checkmark.circle.fill"
        }
        if let selected = selectedAnswerIndex, index == selected && index != viewModel.questions[viewModel.currentQuestionIndex].correctAnswer {
            return "xmark.circle.fill"
        }
        return ""
    }

    func feedbackColor(for index: Int) -> Color {
        if index == viewModel.questions[viewModel.currentQuestionIndex].correctAnswer {
            return .green
        }
        if let selected = selectedAnswerIndex, index == selected && index != viewModel.questions[viewModel.currentQuestionIndex].correctAnswer {
            return .red
        }
        return .clear
    }
}

