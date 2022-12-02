import Sailfish.Silica 1.0
import QtQuick 2.0

Page {
    id: page
    allowedOrientations: Orientation.All
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            PageHeader { title: " " }
            CustomButton {
                anchors.horizontalCenter: parent.horizontalCenter
                color_button: "green"
                Text { text: "Custom Button" }
            }
        }
    }
}



