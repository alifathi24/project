//
//  ContentView.swift
//  Ruh Builder
//
//  Created by Fathi Ali on 2025-09-01.
//

import SwiftUI

// --- CUSTOM COLORS ---
extension Color {
    // Define a custom gold color for reuse throughout the app
    static let gold = Color(red: 0.9, green: 0.7, blue: 0.2)
}


// --- DATA MODELS ---
// Struct to represent a single task
struct Task: Identifiable {
    let id: Int
    let title: String
    let description: String
    let xp: Int
    let type: String // "daily" or "weekly"
}

// Struct to represent a reward
struct Reward: Identifiable {
    var id: String { title }
    let levelUnlocked: Int
    let title: String
    let content: String
}

// Struct for a player on the leaderboard
struct Player: Identifiable {
    var id: String { name }
    let name: String
    let level: Int
    let xp: Int
    let isCurrentUser: Bool

    init(name: String, level: Int, xp: Int, isCurrentUser: Bool = false) {
        self.name = name
        self.level = level
        self.xp = xp
        self.isCurrentUser = isCurrentUser
    }
}

// --- VIEW MODEL (STATE MANAGEMENT) ---
// This class holds all the app's data and logic.
class GameViewModel: ObservableObject {
    @Published var username: String = "Player"
    @Published var level: Int = 1
    @Published var xp: Int = 0
    @Published var completedTaskIDs: Set<Int> = []
    
    // --- Mock Data (based on the web app) ---
    let levels = [
        (level: 1, name: "Fledgling Believer", xpRequired: 0),
        (level: 2, name: "Sincere Seeker", xpRequired: 100),
        (level: 3, name: "Mindful Worshipper", xpRequired: 250),
        (level: 4, name: "Generous Giver", xpRequired: 500),
        (level: 5, name: "Patient Soul", xpRequired: 1000),
        (level: 6, name: "Righteous Companion", xpRequired: 2000),
    ]
    
    let allTasks: [Task] = [
        Task(id: 1, title: "Perform the 5 daily prayers", description: "Salah is a pillar of Islam.", xp: 20, type: "daily"),
        Task(id: 2, title: "Read a page of the Quran", description: "With understanding of its meaning.", xp: 15, type: "daily"),
        Task(id: 3, title: "Give charity (Sadaqah)", description: "Even a smile is a form of charity.", xp: 10, type: "daily"),
        Task(id: 4, title: "Make Dhikr 100 times", description: "Remember Allah throughout your day.", xp: 10, type: "daily"),
        Task(id: 5, title: "Visit or call a family member", description: "Maintaining kinship is a blessing.", xp: 25, type: "weekly"),
        Task(id: 6, title: "Attend Jumu'ah prayer", description: "The congregational Friday prayer.", xp: 50, type: "weekly"),
        Task(id: 7, title: "Learn a new Hadith", description: "Seek knowledge from the Prophet's (PBUH) teachings.", xp: 30, type: "weekly"),
        Task(id: 8, title: "Fast on a Monday or Thursday", description: "Follow the Sunnah of voluntary fasting.", xp: 40, type: "weekly"),
    ]
    
    let allRewards: [Reward] = [
        Reward(levelUnlocked: 2, title: "The Power of Du'a", content: "The Prophet (PBUH) said, 'Du'a (supplication) is the essence of worship.' - Tirmidhi. Your connection with Allah is strongest when you ask of Him."),
        Reward(levelUnlocked: 3, title: "Wisdom on Charity", content: "The Prophet (PBUH) said, 'Charity does not decrease wealth.' - Muslim. Giving in the way of Allah only increases your blessings in this life and the next."),
        Reward(levelUnlocked: 4, title: "The Virtue of Patience", content: "Allah says in the Quran, 'Indeed, the patient will be given their reward without account.' (39:10). Sabr (patience) is a key to paradise."),
        Reward(levelUnlocked: 5, title: "Importance of Good Character", content: "The Prophet (PBUH) said, 'The heaviest of things that will be placed on the scale of a believer on the Day of Judgment is good character.' - Tirmidhi."),
    ]
    
    let leaderboard: [Player] = [
        Player(name: "Abdullah", level: 5, xp: 1500),
        Player(name: "Fatima", level: 4, xp: 850),
        Player(name: "Yusuf", level: 4, xp: 600),
        Player(name: "Aisha", level: 3, xp: 400),
    ]
    
    // Computed Properties
    var currentLevelInfo: (level: Int, name: String, xpRequired: Int) {
        return levels.filter { $0.level <= self.level }.last ?? levels[0]
    }
    
    var nextLevelInfo: (level: Int, name: String, xpRequired: Int)? {
        return levels.first { $0.level > self.level }
    }
    
    var xpForCurrentLevel: Int {
        return self.xp - currentLevelInfo.xpRequired
    }
    
    var xpToNextLevel: Int {
        return (nextLevelInfo?.xpRequired ?? currentLevelInfo.xpRequired) - currentLevelInfo.xpRequired
    }
    
    var xpProgress: Double {
        return xpToNextLevel > 0 ? Double(xpForCurrentLevel) / Double(xpToNextLevel) : 1.0
    }
    
    var unlockedRewards: [Reward] {
        allRewards.filter { $0.levelUnlocked <= self.level }
    }
    
    // --- LOGIC ---
    func completeTask(task: Task) {
        if !completedTaskIDs.contains(task.id) {
            completedTaskIDs.insert(task.id)
            xp += task.xp
            checkLevelUp()
        }
    }
    
    func checkLevelUp() {
        if let nextLevel = nextLevelInfo, xp >= nextLevel.xpRequired {
            level += 1
        }
    }
}

// --- VIEWS ---

// The main view with the Tab Bar
struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.xaxis")
                }
            
            LeaderboardView()
                .tabItem {
                    Label("Leaderboard", systemImage: "list.number")
                }
        }
        .environmentObject(viewModel)
        .accentColor(.gold) // Set the tint for the entire app, affecting tab items
    }
}

// 0. NEW Home Screen
struct HomeView: View {
    @EnvironmentObject var viewModel: GameViewModel

    var body: some View {
        ZStack {
            // Paradise-themed background
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.green.opacity(0.4), Color.gold.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            // Decorative blurred shapes for a dreamy effect
            Circle()
                .fill(Color.green.opacity(0.5))
                .blur(radius: 100)
                .offset(x: -150, y: -200)

            Circle()
                .fill(Color.gold.opacity(0.4))
                .blur(radius: 120)
                .offset(x: 150, y: 100)

            VStack(spacing: 20) {
                Text("Your Ruh")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                RuhSphereView()

                Text(viewModel.currentLevelInfo.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.9))
                    .shadow(radius: 3)
            }
            .padding()
        }
    }
}

// 1. Stats Screen (previously TasksView)
struct StatsView: View {
    @EnvironmentObject var viewModel: GameViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ProfileHeaderView()
                    
                    SectionHeaderView(title: "Unlocked Wisdom")
                    if viewModel.unlockedRewards.isEmpty {
                        Text("Complete tasks and level up to unlock more wisdom.")
                            .foregroundColor(.secondary)
                            .padding()
                            .background(Color(.secondarySystemGroupedBackground))
                            .cornerRadius(12)
                    } else {
                        ForEach(viewModel.unlockedRewards) { reward in
                            RewardCardView(reward: reward)
                        }
                    }
                    
                    SectionHeaderView(title: "Daily Deeds")
                    ForEach(viewModel.allTasks.filter { $0.type == "daily" }) { task in
                        TaskRowView(task: task)
                    }
                    
                    SectionHeaderView(title: "Weekly Deeds")
                    ForEach(viewModel.allTasks.filter { $0.type == "weekly" }) { task in
                        TaskRowView(task: task)
                    }
                }
                .padding()
            }
            .navigationTitle("Stats & Tasks")
            .background(Color(.systemGroupedBackground))
        }
    }
}

// 2. Leaderboard Screen
struct LeaderboardView: View {
    @EnvironmentObject var viewModel: GameViewModel

    var body: some View {
        NavigationView {
            List {
                PlayerRowView(player: Player(name: viewModel.username, level: viewModel.level, xp: viewModel.xp, isCurrentUser: true), rank: "You")
                
                ForEach(Array(viewModel.leaderboard.enumerated()), id: \.element.id) { index, player in
                    PlayerRowView(player: player, rank: "\(index + 1)")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Top Believers")
        }
    }
}


// --- Reusable Component Views ---

// NEW: 3D-style sphere for the home page
struct RuhSphereView: View {
    @EnvironmentObject var viewModel: GameViewModel
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            // Outer shadow to lift the sphere
            Circle()
                .fill(Color.black.opacity(0.4))
                .blur(radius: 20)
                .frame(width: 250, height: 250)
                .offset(y: 20)
            
            // Main sphere body with a 3D gradient
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.green.opacity(0.4), Color.green.opacity(0.8)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            // Inner glowing core, representing faith. Its size grows with XP progress.
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [.white, .gold.opacity(0.8), .gold.opacity(0)]),
                        center: .center,
                        startRadius: 1,
                        endRadius: 120
                    )
                )
                .scaleEffect(CGFloat(0.2 + (viewModel.xpProgress * 0.8))) // Grows with progress
                .opacity(0.8)

            // Level Number
            Text("\(viewModel.level)")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(.white.opacity(0.9))
                .shadow(radius: 10)
            
            // Pulsing animation effect for 'aliveness'
            Circle()
                .stroke(Color.white.opacity(0.7), lineWidth: 2)
                .scaleEffect(isAnimating ? 1.1 : 1.0)
                .opacity(isAnimating ? 0 : 1)
        }
        .frame(width: 250, height: 250)
        .onAppear {
            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                isAnimating.toggle()
            }
        }
    }
}

// Header showing user profile and progress
struct ProfileHeaderView: View {
    @EnvironmentObject var viewModel: GameViewModel

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.username)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Level \(viewModel.currentLevelInfo.level): \(viewModel.currentLevelInfo.name)")
                        .font(.headline)
                        .foregroundColor(.green)
                }
                Spacer()
            }
            
            VStack(spacing: 5) {
                ProgressView(value: viewModel.xpProgress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .gold))
                HStack {
                    Text("\(viewModel.xp) XP")
                    Spacer()
                    Text("\(viewModel.nextLevelInfo?.xpRequired ?? viewModel.xp) XP")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(20)
    }
}

// A single row for a task
struct TaskRowView: View {
    @EnvironmentObject var viewModel: GameViewModel
    let task: Task
    
    var isCompleted: Bool {
        viewModel.completedTaskIDs.contains(task.id)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(task.title)
                    .font(.headline)
                Spacer()
                Text(task.type.capitalized)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(task.type == "daily" ? .green : .gold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background((task.type == "daily" ? Color.green : Color.gold).opacity(0.1))
                    .cornerRadius(8)
            }
            
            Text(task.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Text("\(task.xp) XP")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(Color.green)
                    .cornerRadius(8)
                
                Spacer()
                
                Button(action: {
                    viewModel.completeTask(task: task)
                }) {
                    HStack {
                        Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                        Text(isCompleted ? "Completed" : "Complete")
                    }
                }
                .buttonStyle(.bordered)
                .tint(isCompleted ? .gray : .green)
                .disabled(isCompleted)
            }
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

// A card to display a reward
struct RewardCardView: View {
    let reward: Reward
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(reward.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.gold)
            
            Text(reward.content)
                .font(.body)
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

// A row for the leaderboard
struct PlayerRowView: View {
    let player: Player
    let rank: String
    
    var body: some View {
        HStack {
            Text(rank)
                .font(.headline)
                .frame(width: 40)
            
            VStack(alignment: .leading) {
                Text(player.name)
                    .fontWeight(player.isCurrentUser ? .heavy : .regular)
                Text("Level \(player.level)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text("\(player.xp) XP")
                .font(.headline)
        }
        .padding(.vertical, 8)
        .listRowBackground(player.isCurrentUser ? Color.gold.opacity(0.2) : nil)
    }
}

// A simple section header
struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.green)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// This allows you to preview the UI in Xcode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

