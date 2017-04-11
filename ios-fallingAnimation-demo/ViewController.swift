//
//  ViewController.swift
//  ios-fallingAnimation-demo
//
//  Created by Kentaro on 2017/04/11.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var fallingImageView: FallingmageView!

    @IBAction private func didTapFallingButton(_ sender: UIButton) {
        fallingImageView.animate()
    }

}

final class FallingmageView: UIImageView, FallingAnimatable {}
