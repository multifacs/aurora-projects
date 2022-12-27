import QtQuick 2.0
import Sailfish.Silica 1.0
import com.counter 1.0
import com.stringlist 1.0

ApplicationWindow {
    objectName: "applicationWindow"
    initialPage: Qt.resolvedUrl("pages/Page0.qml")
    cover: Qt.resolvedUrl("cover/DefaultCoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
