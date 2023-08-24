import QtQuick 2.15
import QtQuick.Controls.Fusion
import QtQuick.Dialogs

Button {
    id: activeButtonRoot
    property bool enabled
    property string notEnabledReason
    signal execute

    palette {
        button: enabled ? "lightgray" : "gray"
    }

    onClicked: {
        if(!enabled && notEnabledReason != "") {
            notEnabledReasonMessageBox.visible = true
        } else if(enabled) {
            activeButtonRoot.execute();
        }
    }


    ErrorMessage {
        id: notEnabledReasonMessageBox
        msgText: notEnabledReason
    }
}
