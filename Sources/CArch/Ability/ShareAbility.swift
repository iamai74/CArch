//
//  ShareAbility.swift
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

#if canImport(UIKit) || canImport(AppKit)
/// Возможность поделиться разных материалов
@MainActor public protocol ShareAbility {

    /// Поделиться разных материалов
    /// - Parameters:
    ///   - text: Текст
    ///   - image: Изображение
    ///   - url: Ссылка
    ///   - completion: Замыкание вызывается при завершение диалога
    func share(_ text: String?, _ image: Image?, _ url: URL?, _ completion: (() -> Void)?)
}

// MARK: - ShareAbility + Extension
public extension ShareAbility {

    /// Поделиться разных материалов
    /// - Parameters:
    ///   - text: Текст
    ///   - completion: Замыкание вызывается при завершение диалога
    func share(_ text: String, _ completion: (() -> Void)? = nil) {
        share(text, nil, nil, completion)
    }

    /// Поделиться разных материалов
    /// - Parameters:
    ///   - text: Текст
    ///   - url: Ссылка
    ///   - completion: Замыкание вызывается при завершение диалога
    func share(_ text: String? = nil, _ image: Image, _ completion: (() -> Void)? = nil) {
        share(text, image, nil, completion)
    }

    /// Поделиться разных материалов
    /// - Parameters:
    ///   - text: Текст
    ///   - url: Ссылка
    ///   - completion: Замыкание вызывается при завершение диалога
    func share(_ text: String? = nil, _ url: URL, _ completion: (() -> Void)? = nil) {
        share(text, nil, url, completion)
    }
}
#endif

#if canImport(UIKit)
// MARK: - UIViewController + ShareAbility
extension ViewController: ShareAbility {

    public func share(_ text: String?, _ image: UIImage?, _ url: URL?, _ completion: (() -> Void)?) {
        var activityItems = [Any]()
        if let text = text {
            activityItems.append(text + " ")
        }
        if let image = image {
            activityItems.append(image)
        }
        if let url = url {
            activityItems.append(url)
        }
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = view
            popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        present(activityViewController, animated: true, completion: completion)
    }
}
#elseif canImport(AppKit)

extension ViewController: ShareAbility {
    public func share(_ text: String?, _ image: Image?, _ url: URL?, _ completion: (() -> Void)?) {}
}
#endif
