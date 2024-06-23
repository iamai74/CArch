//
//  MailAbility.swift
//

#if canImport(UIKit) && canImport(MessageUI)
import MessageUI
import UIKit
#endif

/// Возможность показать экран отправление E-Mail
@MainActor public protocol MailAbility {

    #if canImport(UIKit) && canImport(MessageUI)
    /// Показать стандартный интерфейс для управления, редактирования и отправки сообщений электронной почты.
    /// - Parameter mailComposer: Стандартный интерфейс для управления электронной почты.
    func displayMailComposer(mailComposer: MFMailComposeViewController)
    #endif
}

#if canImport(UIKit) && canImport(MessageUI)
// MARK: - UIViewController + MailAbility
extension UIViewController: MailAbility {

    public func displayMailComposer(mailComposer: MFMailComposeViewController) {
        present(mailComposer, animated: true)
    }
}
#endif
