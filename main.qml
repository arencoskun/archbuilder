import QtQuick 2.15
import QtQuick.Window 2.15
import ArchBuilder
import QtQuick.Controls.Fusion
import QtQuick.Dialogs

Window {
    id: welcomeScreenWindow
    width: 800
    height: 600
    visible: true
    title: qsTr("ArchBuilder - Welcome")
    color: "#e6e6e6"

    property bool isProjectDirectorySelected: false
    property string projectDir: ""

    AppInfo {
        id: appInfo
    }

    FolderUtil {
        id: folderUtil
    }

    LibArchiso {
        id: backend
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

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        y: descriptionText.y + 24
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: directoryText
                font.pixelSize: 18
                text: "Project directory: "
            }

            Button {
                text: "Browse"

                onClicked: projectDirectorySelectDialog.visible = true
            }

            FolderDialog {
                id: projectDirectorySelectDialog

                onAccepted: {
                    directoryText.text = "Project directory: " + folderUtil.removePathPrefix(selectedFolder) + "  "
                    projectDir = folderUtil.removePathPrefix(selectedFolder);
                    isProjectDirectorySelected = true;
                    console.log(folderUtil.isFolderEmpty(selectedFolder))
                    if(!folderUtil.isFolderEmpty(selectedFolder)) {
                        folderEmptyWarningText.visible = true
                    } else {
                        folderEmptyWarningText.visible = false;
                    }
                }

                Component.onCompleted: visible = false
            }

        }

        Text {
            id: folderEmptyWarningText
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
            text: "WARNING: The folder you have selected is NOT empty."
            color: "#a19e45"
        }
    }

    ActiveButton {
        enabled: isProjectDirectorySelected
        notEnabledReason: "You need to choose the project directory!"
        anchors {
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 5
            rightMargin: 5
        }

        onExecute: {
            backend.createNewProject(projectDir);
        }

        text: "Next"
    }
}
