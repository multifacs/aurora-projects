import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Canvas {
        width: parent.width
        height: parent.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "dodgerblue";
            ctx.fillRect(0, 0, width, height/1.5);
            ctx.fillStyle = "yellowgreen"
            ctx.fillRect(0, height/1.5, width, height-height/1.5)
            ctx.fillStyle = "orange";
            ctx.fillRect(width/2-230, height/3+310, 460, 360)
            ctx.fillStyle = 'brown'
            ctx.fillRect(width/2+100, height/3+70, 50, 150)
            ctx.fillStyle = 'tomato'
            ctx.beginPath()
            ctx.moveTo(width/2, height/3+100);
            ctx.lineTo(width/2+300, height/2+100);
            ctx.lineTo(width/2-300, height/2+100);
            ctx.fill();
            ctx.closePath();
        }
    }
}
