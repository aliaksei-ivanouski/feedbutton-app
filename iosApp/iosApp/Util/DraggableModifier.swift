//
//  DraggableModifier.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 26/08/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct DraggableModifier : ViewModifier {

    enum Direction {
        case vertical
        case horizontal
    }
    
    enum Way {
        case up
        case down
        case left
        case right
    }
    
    var action: () -> Void

    let direction: Direction
    let way: Way
    let length: CGFloat

    @State private var draggedOffset: CGSize = .zero

    func body(content: Content) -> some View {
        content
            .offset(
                CGSize(width: direction == .horizontal ? allowedOffset : 0,
                       height: direction == .vertical ? allowedOffset : 0)
            )
            .gesture(
                DragGesture()
                    .onChanged { value in
                        
                        if direction == .horizontal {
                            if abs(value.translation.width) > length {
                                action()
                            }
                        }
                        if direction == .vertical {
                            if abs(value.translation.height) > length {
                                action()
                            }
                        }

                        self.draggedOffset = value.translation
                    }
                    .onEnded { value in
                        self.draggedOffset = .zero
                    }
            )
    }
    
    var allowedOffset: CGFloat {
        switch way {
        case .up:
            return min(draggedOffset.height, 0)
        case .down:
            return max(draggedOffset.height, 0)
        case .left:
            return min(draggedOffset.width, 0)
        case .right:
            return max(draggedOffset.width, 0)
        }
    }

}
