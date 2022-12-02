import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        Column {
            id: column
            width: page.width
            PageHeader { title: " " }
            Timer {
                id: timer
                property var ticks: 0
                interval: 1.0 //1000
                repeat: true
                onTriggered: time.text = dispaly_time(++ticks);
            }

            Text {
                id: time
                //text: dispaly_time(timer.ticks)
                text: "00:00:00" //mil()
                font.pixelSize: 46
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: button

                    text: timer.running ? "Остановить" : "Запустить"

                    onClicked: {
                        timer.running ? timer.stop() : timer.start();
                    }
                }
                Button {
                    id: buttonRemember
                    text: "Запомнить"

                    onClicked: {
                        console.log(time.text)
                        listModel.append({
                                             txt: time.text,
                                         })
                        console.log(listModel.rowCount())
                    }
                }
            }

            Item {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 500
                width: 300
                height: 1000
                SilicaListView {
                    anchors.fill: parent
                    ListModel {
                        id: listModel
                    }

                    model: listModel
                    delegate: Label {
                        text: txt
                    }
                }
            }
        }
    }

    function dispaly_time(ticks) {
        var hh = Math.floor(ticks / 3600);
        var mm = Math.floor((ticks % 3600) / 60);
        var ss = ticks % 60

        return pad(hh, 2) + ":" + pad(mm, 2) + ":" + pad(ss, 2);
    }

    function pad(n, width) { n = n + "";
        return n.length >= width ? n : new Array(width - n.length + 1).join("0") + n;
    }

    function mil() {
        var startDate = new Date();
        var thisDate = new Date();
        var t = thisDate.getTime() - startDate.getTime();
        var ms = t%1000; t-=ms; ms=Math.floor(ms/10);
        t = Math.floor(t / 1000);
        var s = t%60; t-=s;
        t = Math.floor(t / 60);
        var m = t%60; t-=m;
        t = Math.floor(t / 60);
        var h = t%60;

        return pad(m, 2) + ":" + pad(s, 2) + ":" + pad(ms, 2);
    }

    function fin_time() {
        var init = 0;
        if(init==0) {
            startDate = new Date();
            mil();
            init = 1;
        }
    }

    function vpered(ticks) {
        var timer_ = 0;
        //var timerInterval = setInterval(function() {
        timer_ += 1/60;
        var msVal = Math.floor((timer_ - Math.floor(timer_))*100);
        var secondVal = Math.floor(timer_) - Math.floor(timer_/60) * 60;
        var minuteVal = Math.floor(timer_/60);

        return pad(m, 2) + ":" + pad(s, 2) + ":" + pad(ms, 2);
    }
}

