//
//  UIColor+Custom.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 02/06/2021.
//

import UIKit

/** Extension to access to all the TL colors. */
extension UIColor {

    // swiftlint:disable:next type_name
    enum custom {

        /** The `positive` color, `.green` if nil. */
        static let positive: UIColor = UIColor(named: "positive") ?? .green
        
        /** The `negative` color, `.red` if nil. */
        static let negative: UIColor = UIColor(named: "negative") ?? .systemRed

        /** The `orange` color, `.orange` if nil. */
        static let orange: UIColor = UIColor(named: "orange") ?? .orange

        /** The `lime` color, `.systemGreen` if nil. */
        static let lime: UIColor = UIColor(named: "lime") ?? .systemGreen

        /** The `limeGradientStart` color, `.systemGreen` if nil. */
        static let limeGradientStart: UIColor = UIColor(named: "limeGradientStart") ?? .systemGreen
        
        /** The `limeTurquoise` color, `.systemBlue` if nil. */
        static let limeTurquoise: UIColor = UIColor(named: "limeTurquoise") ?? .systemBlue
        
        /** The `limeDisabled` color, `.systemGreen` if nil. */
        static let limeDisabled: UIColor = UIColor(named: "limeDisabled") ?? .systemGreen
        
        /** The `warning` color, `.systemRed` if nil. */
        static let warning: UIColor = UIColor(named: "warning") ?? .systemRed

        /** The `white` color, `.white` if nil. */
        static let white: UIColor = UIColor(named: "white") ?? .white
        
        /** The `black` color, `.black` if nil. */
        static let black: UIColor = UIColor(named: "black") ?? .black
        
        /** The `gray02` color, `.lightGray` if nil. */
        static let gray02: UIColor = UIColor(named: "gray02") ?? .lightGray

        /** The `gray03` color, `.lightGray` if nil. */
        static let gray03: UIColor = UIColor(named: "gray03") ?? .lightGray

        /** The `gray04` color, `.lightGray` if nil. */
        static let gray04: UIColor = UIColor(named: "gray04") ?? .lightGray

        /** The `gray05` color, `.gray` if nil. */
        static let gray05: UIColor = UIColor(named: "gray05") ?? .gray

        /** The `gray06` color, `.gray` if nil. */
        static let gray06: UIColor = UIColor(named: "gray06") ?? .gray

        /** The `gray07` color, `.darkGray` if nil. */
        static let gray07: UIColor = UIColor(named: "gray07") ?? .darkGray

        /** The `gray08` color, `.black` if nil. */
        static let gray08: UIColor = UIColor(named: "gray08") ?? .black
        
        /** The `gray08_70` color, `.black` if nil. */
        static let gray08_70: UIColor = UIColor(named: "gray08_70") ?? .black

        /** The `twitter` color, `.blue` if nil. */
        static let twitter: UIColor = UIColor(named: "twitter") ?? .blue

        /** The `tiktok` color, `.black` if nil. */
        static let tiktok: UIColor = UIColor(named: "tiktok") ?? .black

        /** The `snapchat` color, `.yellow` if nil. */
        static let snapchat: UIColor = UIColor(named: "snapchat") ?? .yellow
        
        /** The `mediumBlue` color, `.blue` if nil. */
        static let mediumBlue: UIColor = UIColor(named: "mediumBlue") ?? .blue
        
        /** The `instagramPink` color, `.systemPink` if nil. */
        static let instagramPink: UIColor = UIColor(named: "instagramPink") ?? .systemPink

        /** The `royalBlue` color, `.royalBlue` if nil. */
        static let royalBlue: UIColor = UIColor(named: "royalBlue") ?? .blue

        /** The `discord` color, `.purple` if nil. */
        static let discord: UIColor = UIColor(named: "discord") ?? .purple
        
        /** The `mintGreen` color, `.green` if nil. */
        static let mintGreen: UIColor = UIColor(named: "mintGreen") ?? .green

        /** The `cerise` color, `.red` if nil. */
        static let cerise: UIColor = UIColor(named: "cerise") ?? .red

        /** The `osloGray` color, `.gray` if nil. */
        static let osloGray: UIColor = UIColor(named: "osloGray") ?? .gray

        /** The `dodgerBlue` color, `.blue` if nil. */
        static let dodgerBlue: UIColor = UIColor(named: "dodgerBlue") ?? .blue
        
        /** The `tangerine` color, `.orange` if nil. */
        static let tangerine: UIColor = UIColor(named: "tangerine") ?? .orange
        
        /** The `electricPurple` color, `.purple` if nil. */
        static let electricPurple: UIColor = UIColor(named: "electricPurple") ?? .purple
        
        /** The `minty` color, `.green` if nil. */
        static let minty: UIColor = UIColor(named: "minty") ?? .green
        
        /** The `neonBlue` color, `.blue` if nil. */
        static let neonBlue: UIColor = UIColor(named: "neonBlue") ?? .blue
        
        /** The `hotPink` color, `.systemPink` if nil. */
        static let hotPink: UIColor = UIColor(named: "hotPink") ?? .systemPink
        
        /** The `supportingPurple` color, `.purple` if nil. */
        static let supportingPurple: UIColor = UIColor(named: "supportingPurple") ?? .purple

        /** The `tomato` color, `.red` if nil. */
        static let tomato: UIColor = UIColor(named: "tomato") ?? .red

        /** The `badgeTopFan` color, `.purple` if nil. */
        static let badgeTopFan: UIColor = UIColor(named: "badgeTopFan") ?? .red
        
        /** The `badgeMember` color, `.green` if nil. */
        static let badgeMember: UIColor = UIColor(named: "badgeMember") ?? .green
        
        /** The `badgeRisingStar` color, `.orange` if nil. */
        static let badgeRisingStar: UIColor = UIColor(named: "badgeRisingStar") ?? .orange
        
        /** The `badgeVipPartner` color, `.yellow` if nil. */
        static let badgeVipPartner: UIColor = UIColor(named: "badgeVipPartner") ?? .yellow
    }

}
