import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Canvas {
        width: parent.width
        height: parent.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "lightblue";
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

            ctx.beginPath();
            ctx.fillStyle = "grey"
            ctx.arc(200, 200, 50, 0, 2 * Math.PI);
            ctx.fill();
            ctx.closePath();

            ctx.beginPath();
            ctx.fillStyle = "grey"
            ctx.arc(230, 180, 50, 0, 2 * Math.PI);
            ctx.fill();
            ctx.closePath();

            ctx.beginPath();
            ctx.fillStyle = "grey"
            ctx.arc(260, 200, 50, 0, 2 * Math.PI);
            ctx.fill();
            ctx.closePath();
        }
    }

    AnimatedSprite {
        x: 100
        y: 220
        source: "rain.png"
        width: 250
        height: 250
        frameCount: 2
        frameWidth: 256 / 1
        frameHeight: 512 / 2
        frameRate: 2
        interpolate: false
    }
}
