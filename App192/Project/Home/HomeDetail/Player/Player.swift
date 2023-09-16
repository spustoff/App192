//
//  Player.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI
import AVKit

final class PlayerModel: ObservableObject {
    
    @Published var progressWidth : CGFloat = 0
    
    @Published var isFinished: Bool = false
    @Published var isDragging = false
    
    @Published var player: AVPlayer!
    @Published var timeObserver: Any!
    
    @Published var isPlaying = false
    @Published var duration = 0.0
    @Published var currentTime = 0.0
    
    @AppStorage("wish_list") var wish_list: [String] = []
    
    func setupPlayer(podcast: HomeItem) {
        
        guard let url = URL(string: podcast.audio) else {
            
            print("url error - \(self)")
            
            return
        }
        
        self.player = AVPlayer(url: url)

        do {
            
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            print("Ошибка при настройке AudioSession: \(error.localizedDescription)")
        }

        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))

        timeObserver = self.player.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main) { [weak self] time in
            guard let self = self else { return }
            
            withAnimation(.spring()) {
                self.currentTime = time.seconds
                self.duration = self.player.currentItem?.duration.seconds ?? 0.0
            }
        }
    }
    
    func playPause() {
        
        guard let player = player else { return }
        
        isPlaying ? player.pause() : player.play()
        isPlaying.toggle()
    }
        
    func forward15Sec() {
        
        guard let player = player else { return }
        
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = currentTime + 15.0
        
        if newTime < (player.currentItem?.duration.seconds)! {
            
            let time2: CMTime = CMTimeMake(value: Int64(newTime*1000), timescale: 1000)
            
            player.seek(to: time2)
            
        }
    }
        
    func rewind15Sec() {
        
        guard let player = player else { return }
        
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = currentTime - 15.0
        
        if newTime > 0 {
            
            let time2: CMTime = CMTimeMake(value: Int64(newTime*1000), timescale: 1000)
            
            player.seek(to: time2)
        }
    }
    
    func setCurrentTime(time: Double) {
        
        guard let player = player else { return }
        
        let targetTime = CMTime(seconds: time, preferredTimescale: 600)
        
        player.seek(to: targetTime)
    }
}
