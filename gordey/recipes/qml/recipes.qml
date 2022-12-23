import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow {
    property string name_data: "null";
    property string ingr_data: "null";
    property string desc_data: "null";

    Dao { id: dao }
    SecondPage { id: recipe_page }
    DiagPage { id: diag_page }
    initialPage: Component { FirstPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
