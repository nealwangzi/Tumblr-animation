//
//  TransitionManager.swift
//  Tumblr
//
//  Created by neal on 2017/7/13.
//  Copyright © 2017年 Cloudoc. All rights reserved.
//

import UIKit

class TransitionManager: NSObject {

    fileprivate var presenting = false
    
}

extension TransitionManager: UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        //
        let screens: (from:UIViewController, to:UIViewController) = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!, transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!)
        
        let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        
        if self.presenting {
            offStageMenuController(menuViewController)
        }
        
        container.addSubview(bottomView!)
        container.addSubview(menuView!)
        
        let duration = self.transitionDuration(using: transitionContext)

        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: { 
            if self.presenting {
            self.onStageMenuController(menuViewController)
            }else {
                self.offStageMenuController(menuViewController)
            }
            
        }) { (finished) in
            transitionContext.completeTransition(true)
            UIApplication.shared.keyWindow?.addSubview(screens.to.view)
        }
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func offStage(_ amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: amount, y: 0)
    }
    
    func onStageMenuController(_ menuViewController:MenuViewController)  {
        menuViewController.view.alpha = 1
        
        menuViewController.textPostIcon.transform = CGAffineTransform.identity
        menuViewController.textPostIcon.transform = CGAffineTransform.identity
        menuViewController.textPostLabel.transform = CGAffineTransform.identity
        
        menuViewController.quotePostIcon.transform = CGAffineTransform.identity
        menuViewController.quotePostLabel.transform = CGAffineTransform.identity
        
        menuViewController.chatPostIcon.transform = CGAffineTransform.identity
        menuViewController.chatPostIcon.transform = CGAffineTransform.identity
        
        menuViewController.photoPostIcon.transform = CGAffineTransform.identity
        menuViewController.photoPostLabel.transform = CGAffineTransform.identity
        
        menuViewController.linkPostIcon.transform = CGAffineTransform.identity
        menuViewController.linkPostIcon.transform = CGAffineTransform.identity
            
        menuViewController.audioPostIcon.transform = CGAffineTransform.identity
        menuViewController.audioPostLabel.transform = CGAffineTransform.identity
        
    }
    
    func offStageMenuController(_ menuViewController: MenuViewController) {
        menuViewController.view.alpha = 0
        let topRowOffset: CGFloat = 300
        let middleRowOffset: CGFloat = 150
        let bottomRowOffset:CGFloat = 50
        
        
        menuViewController.textPostIcon.transform = self.offStage(-topRowOffset)
        menuViewController.textPostLabel.transform = self.offStage(-topRowOffset)
        
        menuViewController.quotePostIcon.transform = self.offStage(-middleRowOffset)
        menuViewController.quotePostLabel.transform = self.offStage(-middleRowOffset)
        
        menuViewController.chatPostIcon.transform = self.offStage(-bottomRowOffset)
        menuViewController.chatPostIcon.transform = self.offStage(-bottomRowOffset)
        
        menuViewController.photoPostIcon.transform = self.offStage(topRowOffset)
        menuViewController.photoPostLabel.transform = self.offStage(topRowOffset)
        
        menuViewController.linkPostIcon.transform = self.offStage(middleRowOffset)
        menuViewController.linkPostIcon.transform = self.offStage(middleRowOffset)
        
        menuViewController.audioPostIcon.transform = self.offStage(bottomRowOffset)
        menuViewController.audioPostLabel.transform = self.offStage(bottomRowOffset)
        
    }
}


extension TransitionManager:UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}
