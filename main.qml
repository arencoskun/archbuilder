import QtQuick 2.15
import QtQuick.Window 2.15
import ArchBuilder

Window {
    id: welcomeScreenWindow
    width: 800
    height: 600
    visible: true
    title: qsTr("ArchBuilder - Welcome")
    color: "#e6e6e6"

    AppInfo {
        id: appInfo
    }

    Text {
        id: versionText
        anchors {
            top: parent.top
        }

        text: appInfo.getVersionString()
    }

    Column {
        id: mainColumn
        spacing: 30
        anchors.horizontalCenter: parent.horizontalCenter
        y: 40

        Image {
            id: archbuilderLogo
            anchors.horizontalCenter: parent.horizontalCenter
            width: 256
            height: 256
            source: "assets/archbuilder.png"
        }

        Text {
            id: welcomeText
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 28
            text: "Welcome to ArchBuilder!"
        }
    }

    Text {
        id: descriptionText
        anchors.horizontalCenter: parent.horizontalCenter
        y: welcomeText.y + 78
        font.pixelSize: 14
        text: "This program will help you create an Arch ISO using the archiso tool."
    }
}
