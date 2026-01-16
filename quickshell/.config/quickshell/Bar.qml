import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 40
    color: "#1a1b26"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 12

        Row {
            spacing: 8

            Repeater {
                model: Hyprland.workspaces

                Rectangle {
                    radius: 6
                    color: isActive ? "#0db9d7" : "transparent"
                    implicitWidth: 24
                    implicitHeight: 20

                    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                    property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

                    Text {
                        anchors.centerIn: parent
                        text: index + 1
                        color: isActive ? "#1a1b26" : (ws ? "#7aa2f7" : "#444b6a")
                        font.pixelSize: 13
                        font.bold: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Hyprland.dispatch("workspace " + (index + 1))
                    }
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }

        Text {
            id: clock
            color: "#ffffff"
            font.pixelSize: 13
            text: Time.format(Appearance.clockFormat)
        }
    }
}
