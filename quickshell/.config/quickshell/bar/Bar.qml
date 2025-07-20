import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "blocks" as Blocks
import "root:/"

Scope {
    IpcHandler {
        target: "bar"

        function toggleVis(): void {
            for (let i = 0; i < Quickshell.screens.length; i++) {
                barInstances[i].visible = !barInstances[i].visible;
            }
        }
    }

    property var barInstances: []

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            property var modelData
            screen: modelData

            Component.onCompleted: {
                barInstances.push(bar);
            }

            color: "transparent"

            Rectangle {
                id: highlight
                anchors.fill: parent
                color: Theme.get.barBgColor
            }

            height: 30

            visible: true

            anchors {
                top: Theme.get.onTop
                bottom: !Theme.get.onTop
                left: true
                right: true
            }

            RowLayout {
                id: allBlocks
                spacing: 0
                anchors.fill: parent

                RowLayout {
                    id: leftBlocks
                }
            }
        }
    }
}
