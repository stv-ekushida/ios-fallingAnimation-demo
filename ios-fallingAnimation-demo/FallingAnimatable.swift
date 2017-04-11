//
//  FallingAnimatable.swift
//  ios-fallingAnimation-demo
//
//  Created by Kentaro on 2017/04/11.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

protocol FallingAnimatable {
    func animate()
}

fileprivate enum Const {
    static let fallingDuration: TimeInterval = 2.5
    static let rotateDuration: TimeInterval = 0.3
    static let repeatCount: Float = 1
    static let animationKey = "fallingAnimation"
}

extension FallingAnimatable where Self: UIView {

    /// アニメーションを実行する
    func animate() {
        layer.add(animationGroup, forKey: Const.animationKey)
    }

    /// アニメーショングループ
    private var animationGroup: CAAnimationGroup {
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = Const.fallingDuration
        animationGroup.repeatCount = Const.repeatCount
        animationGroup.animations = [moveAnimation, rotateAnimation, zAnimation]

        return animationGroup
    }

    /// 回転のアニメーション
    private var rotateAnimation: CABasicAnimation {
        let rotateAnimation = CABasicAnimation(keyPath: "transform")
        rotateAnimation.duration = Const.rotateDuration
        rotateAnimation.repeatCount = Float.infinity
        let transform = CATransform3DMakeRotation(.pi, 0, 1.0, 0)
        rotateAnimation.toValue = NSValue(caTransform3D: transform)

        return rotateAnimation
    }

    /// 移動のアニメーション
    private var moveAnimation: CABasicAnimation {
        let fromPoint = CGPoint(x: layer.position.x, y: 0)
        let toPoint = CGPoint(x: layer.position.x, y: UIScreen.main.bounds.height)
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.duration = Const.fallingDuration
        moveAnimation.fromValue = NSValue(cgPoint: fromPoint)
        moveAnimation.toValue = NSValue(cgPoint: toPoint)

        return moveAnimation
    }

    /// zPosition(最前面に表示し続けるための処理
    private var zAnimation: CABasicAnimation {
        let zAnimation = CABasicAnimation(keyPath: "transform.translation.z")
        zAnimation.fromValue = layer.bounds.width
        zAnimation.repeatCount = Float.infinity
        zAnimation.toValue = zAnimation.fromValue

        return zAnimation
    }
}
