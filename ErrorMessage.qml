import QtQuick 2.15
import QtQuick.Controls.Fusion

Window {

    property string msgTitle: ""
    property string msgText: ""

    id: errorMessageWindowRoot
    width: 400
    height: 200
    maximumWidth: 400
    maximumHeight: 200
    minimumWidth: 400
    minimumHeight: 200
    visible: false
    title: "You Shall Not Proceed!"
    color: "#e6e6e6"

    Text {
        anchors.centerIn: parent
        fontSizeMode: Text.HorizontalFit
        text: msgText
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        id: okButton
        text: "Ok"
    }
}
