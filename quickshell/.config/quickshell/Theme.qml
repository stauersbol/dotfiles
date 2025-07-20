pragma Singleton

import QtQuick
import Quickshell

Singleton {
    property Item get: catppuccin
    Item {
        id: catppuccin

        // Catppuccin Mocha color palette
        property string barBgColor: "#aa1E1E2E"  // Base
        property string buttonBorderColor: "#313244"  // Surface0
        property string buttonBackgroundColor: "#313244"  // Surface0
        property bool buttonBorderShadow: true
        property bool onTop: true
        property string iconColor: "#89B4FA"  // Blue
        property string iconPressedColor: "#74C7EC"  // Sapphire
    }
}
