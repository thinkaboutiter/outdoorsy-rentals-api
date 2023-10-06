//
//  UIViewController+extensions.swift
//  Rentals
//
//  Created by Boyan Yankov on 6.10.23.
//

import UIKit

// MARK: - Embedding
extension UIViewController {

    /// Embeds a child view controller.
    /// - Parameters:
    ///   - child: the child view controller that we want to embed.
    ///   - containerView: the container view into which `child` view controller's view will be added as subview.
    ///   - positionChildViewIntoContainerView: configuration function to position `child` view controller's view into passed `containerView`. Caller is also responsible to add `child` view controller's view as subview of passed `containerView`. Defaults to `nil` which will add `child` view controller's view fully constraint to passed `containerView`.
    func embed(_ child: UIViewController,
               containerView: UIView,
               positionChildViewIntoContainerView:((_ childView: UIView, _ containerView: UIView) -> Void)?) throws
    {
        guard child.parent == nil else {
            let error = EmbeddingError.parentNotNil
            throw error
        }
        self.addChild(child)
        if let _ = positionChildViewIntoContainerView {
            positionChildViewIntoContainerView!(child.view, containerView)
            guard child.view.superview === containerView else {
                child.willMove(toParent: nil)
                child.view.removeFromSuperview()
                let error = EmbeddingError.containerViewIsNotUsedAsSuperView
                throw error
            }
            child.didMove(toParent: self)
        }
        else {
            containerView.addSubview(child.view)
            child.view.translatesAutoresizingMaskIntoConstraints = false
            child.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            child.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            child.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            child.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
            child.didMove(toParent: self)
        }
    }

    /// Removes a child view controller.
    /// - Parameter child: the child view controller that we want to remove.
    func remove(_ child: UIViewController) throws {
        guard child.parent === self else {
            let error = EmbeddingError.childHasDifferentParent
            throw error
        }
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}

extension UIViewController {
    private enum EmbeddingError: Swift.Error, CustomStringConvertible {
        case parentNotNil
        case containerViewIsNotUsedAsSuperView
        case childHasDifferentParent

        var description: String {
            let result: String
            switch self {
            case .parentNotNil:
                result = "Trying to embed a view controller that already has its parent set!"
            case .containerViewIsNotUsedAsSuperView:
                result = "Passed container_view is not used as child's super_view!"
            case .childHasDifferentParent:
                result = "Passed child_view_controller is not child of this view controller, that is - it has different parent and can not be removed form this veiw controller!"
            }
            return result
        }
    }
}

// MARK: - Error alerts
extension UIViewController {
    /**
     Show alert for error object with custom button and handler. Default alert title is "Error"
     - parameter error: Error object we are displaying alert for
     - parameter actionTitle: custom title for the action button
     - parameter actionHandler: custom handler
     */
    func showAlert(for error: Swift.Error,
                   alertTitle: String = "Error",
                   actionTitle: String = "OK",
                   actionHandler: ((_ action: UIAlertAction) -> Void)? = nil)
    {
        let error = error as NSError
        let alertTitle: String = "\(alertTitle): \(error.code)"
        let alertMessage: String = error.localizedDescription
        self.showAlert(with: alertTitle, alertMessage: alertMessage, actionTitle: actionTitle, actionHandler: actionHandler)
    }

    /**
     Show alert with button and handler.
     - parameter alertTitle: Alert title
     - parameter alertMessage: Alert message we want to display
     - parameter actionTitle: custom title for the action button
     - parameter actionHandler: custom handler
     */
    func showAlert(with alertTitle: String? = nil,
                   alertMessage: String?,
                   actionTitle: String = "OK",
                   actionHandler: ((_ action: UIAlertAction) -> Void)? = nil)
    {
        // present alert to the user
        let alertController: UIAlertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: actionTitle, style: .default, handler: actionHandler)
        alertController.addAction(alertAction)

        self.present(alertController, animated: true, completion: nil)
    }
}



