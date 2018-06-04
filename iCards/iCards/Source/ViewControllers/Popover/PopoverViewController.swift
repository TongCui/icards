//
//  PopoverViewController.swift
//  PMP
//
//  Created by tcui on 21/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit
import SnapKit

struct PopoverTheme {
    enum PresentationStyle {
        case fade
        case slideFromTop
        case slideFromBottom
        case slideFromLeft
        case slideFromRight
    }

    var maskAlpha: CGFloat
    var backgroundColor: UIColor
    var cornerRadius: CGFloat
    var popupContentInsets: UIEdgeInsets
    var presentationStyle: PresentationStyle
    var animationDuration: TimeInterval
    var supportedOrientation: UIInterfaceOrientationMask

    init() {
        maskAlpha = 0.7
        backgroundColor = UIColor(white: 0, alpha: maskAlpha)
        cornerRadius = 8
        popupContentInsets = UIEdgeInsets(top: 150, left: 20, bottom: 150, right: 20)
        presentationStyle = .slideFromBottom
        animationDuration = 0.3
        supportedOrientation = .all
    }

    static var `default`: PopoverTheme { return PopoverTheme() }
}

@objc protocol PopoverViewControllerDelegate {
    @objc func popover(willDismiss popoverViewController: PopoverViewController)
    @objc func popover(didDismiss popoverViewController: PopoverViewController)
}

class PopoverViewController: UIViewController {

    var theme: PopoverTheme = .default
    weak var delegate: PopoverViewControllerDelegate?

    private lazy var contentView = UIView()
    private lazy var maskView = UIView()

    convenience init(rootViewControler: UIViewController) {
        self.init(nibName: nil, bundle: nil)

        contentView.addSubview(rootViewControler.view)
        rootViewControler.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        addChildViewController(rootViewControler)
        rootViewControler.didMove(toParentViewController: self)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        view.addSubview(maskView)
        maskView.addSubview(contentView)

        maskView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { (make) in
            switch UIDevice.current.userInterfaceIdiom {
            case .pad:
                make.top.equalToSuperview().offset(theme.popupContentInsets.top)
                make.bottom.equalToSuperview().offset(-theme.popupContentInsets.top)
                make.centerX.equalToSuperview()
                make.width.equalTo(500)
            default:
                make.edges.equalToSuperview().inset(theme.popupContentInsets)
            }
        }

        addGestures()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        maskView.alpha = 0
        contentView.alpha = 0
        applyTheme()
    }

    func applyTheme() {
        contentView.clipsToBounds = true
        maskView.backgroundColor = theme.backgroundColor
        contentView.layer.cornerRadius = theme.cornerRadius
    }

}

extension PopoverViewController: UIGestureRecognizerDelegate {
    func addGestures() {
        let backgroundTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTapGesture(gesture:)))
        backgroundTapRecognizer.delegate = self
        maskView.addGestureRecognizer(backgroundTapRecognizer)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleConfirmPanAction(gesture:)))
        contentView.addGestureRecognizer(panGesture)
    }

    @objc func handleBackgroundTapGesture(gesture: UITapGestureRecognizer) {
        contentView.endEditing(true)
        dismiss(animated: true, callDelegate: false)
    }

    @objc func handleConfirmPanAction(gesture: UIPanGestureRecognizer) {
        let translatedPoint = gesture.translation(in: view)
        switch gesture.state {
        case .began:
            break
        case .possible:
            break
        case .changed:
            let originCenter = self.endPoint()
            contentView.center = CGPoint(x: originCenter.x, y: originCenter.y + translatedPoint.y)
            if translatedPoint.y > 0 {
                let maskAlpha = translatedPoint.y / maskView.frame.size.height
                maskView.backgroundColor = maskView.backgroundColor?.withAlphaComponent(theme.maskAlpha - min(maskAlpha, theme.maskAlpha))
            }
            break
        case .ended:
            if translatedPoint.y > maskView.frame.size.height / 5 {
                dismiss(animated: true, callDelegate: true)
            } else {
                backToOriginalPosition(aniamted: true)
            }
        case .cancelled:
            backToOriginalPosition(aniamted: true)
        case .failed:
            backToOriginalPosition(aniamted: true)
        }
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view else {
            return false
        }

        return !view.isDescendant(of: contentView)
    }
}

extension PopoverViewController {
    func present(from parent: UIViewController?, animated: Bool) {
        guard let parent = parent else {
            return
        }
        parent.definesPresentationContext = true
        modalPresentationStyle = .overCurrentContext
        contentView.isUserInteractionEnabled = false
        parent.present(self, animated: false) {
            self.contentView.alpha = 1
            self.contentView.center = self.originPoint()
            UIView.animate(withDuration: animated ? self.theme.animationDuration : 0, animations: {
                self.maskView.alpha = 1
                self.contentView.center = self.endPoint()
            }, completion: { (finished) in
                self.contentView.isUserInteractionEnabled = true
            })
        }
    }

    func dismiss(animated: Bool, callDelegate: Bool) {
        if callDelegate {
            delegate?.popover(willDismiss: self)
        }

        UIView.animate(withDuration: animated ? theme.animationDuration : 0, animations: {
            self.maskView.alpha = 0
            self.contentView.center = self.originPoint()
        }) { (finished) in
            self.presentingViewController?.dismiss(animated: false) {
                if callDelegate {
                    self.delegate?.popover(didDismiss: self)
                }
            }
        }
    }

    func backToOriginalPosition(aniamted: Bool) {
        UIView.animate(withDuration: aniamted ? theme.animationDuration : 0) {
            self.maskView.alpha = 1
            self.maskView.backgroundColor = self.theme.backgroundColor
            self.contentView.center = self.endPoint()
        }
    }

    func originPoint() -> CGPoint {
        switch theme.presentationStyle {
        case .fade:
            return maskView.center
        case .slideFromTop:
            return CGPoint(x: maskView.center.x, y: -contentView.bounds.size.height)
        case .slideFromBottom:
            return CGPoint(x: maskView.center.x, y: maskView.bounds.size.height + contentView.bounds.size.height)
        case .slideFromLeft:
            return CGPoint(x: -contentView.bounds.size.width, y: maskView.center.y)
        case .slideFromRight:
            return CGPoint(x: maskView.bounds.size.width + contentView.bounds.size.width, y: maskView.center.y)
        }
    }

    func endPoint() -> CGPoint {
        return maskView.center
    }
}

extension UIViewController {
    var popoverViewController: PopoverViewController? {

        var parent = self.parent

        while let current = parent {
            if let popover = current as? PopoverViewController {
                return popover
            }
            parent = current.parent
        }

        return nil
    }
}
