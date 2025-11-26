import Foundation
import Combine

class RecipeTimerViewModel: ObservableObject {
    @Published var timeRemaining: Int
    @Published var isRunning = false
    private var timer: Timer?
    private let totalTime: Int
    
    init(cookingTimeMinutes: Int) {
        self.totalTime = cookingTimeMinutes * 60
        self.timeRemaining = cookingTimeMinutes * 60
    }
    
    func startTimer() {
        guard !isRunning else { return }
        
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    func resetTimer() {
        stopTimer()
        timeRemaining = totalTime
    }
    
    var timeString: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    deinit {
        timer?.invalidate()
    }
}
