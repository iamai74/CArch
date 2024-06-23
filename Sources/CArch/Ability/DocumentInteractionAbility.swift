//
//  DocumentInteractionAbility.swift
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

/// Протокол работы с документами
@MainActor public protocol DocumentInteractionAbility: CArchProtocol {

    #if canImport(UIKit)
    /// Показать содержание документа
    /// - Parameters:
    ///   - url: Ссылка к документу на диске
    ///   - delegate: Набор методов, которые вы можете реализовать для ответа на сообщения от контроллера взаимодействия документов.
    func showPreview(for url: URL, delegate: UIDocumentInteractionControllerDelegate) -> Bool
    #endif
}

#if canImport(UIKit)
// MARK: UIDocumentInteractionController + Init
private extension UIDocumentInteractionController {

    /// Инициализация
    /// - Parameters:
    ///   - url:  Ссылка к документу на диске
    ///   - delegate: Набор методов, которые вы можете реализовать для ответа на сообщения от контроллера взаимодействия документов.
    convenience init(url: URL, delegate: UIDocumentInteractionControllerDelegate) {
        self.init(url: url)
        self.delegate = delegate
    }
}

// MARK: - DocumentInteractionAbility + UIViewController
extension UIViewController: DocumentInteractionAbility {

    public func showPreview(for url: URL, delegate: UIDocumentInteractionControllerDelegate) -> Bool {
        UIDocumentInteractionController(url: url, delegate: delegate).presentPreview(animated: true)
    }
}
#endif

// MARK: - URL + UIDocumentInteractionController
public extension URL {

    var typeIdentifier: String {
        let identifier: String
        do {
            if let typeIdentifier = try resourceValues(forKeys: [.typeIdentifierKey]).typeIdentifier {
                identifier = typeIdentifier
            } else {
                identifier = "public.data"
            }
        } catch {
            identifier = "public.data"
        }
        return identifier
    }

    var localizedName: String? {
        let name: String
        do {
            if let localizedName = try resourceValues(forKeys: [.localizedNameKey]).localizedName {
                name = localizedName
            } else {
                name = lastPathComponent
            }
        } catch {
            name = lastPathComponent
        }
        return name
    }
}
