import QtQuick 2.15
import QtQuick.Controls.Basic
//import QtGraphicalEffects 1.15

Button{
    id: btnToggle
    // CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/menu_icon.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnToggle.down){
                                       btnToggle.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnToggle.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    implicitWidth: 70
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
            visible: false
        }

//        ColorOverlay{
//            anchors.fill: iconBtn
//            source: iconBtn
//            color: "#ffffff"
//            antialiasing: false
//        }

//        ShaderEffect {
//            anchors.fill: iconBtn
//            property variant src: iconBtn
//            property color overlayColor: "#ffffff"

//            fragmentShader: "
//                uniform lowp sampler2D src;
//                uniform lowp vec4 overlayColor;
//                varying lowp vec2 qt_TexCoord0;

//                void main() {
//                    lowp vec4 baseColor = texture2D(src, qt_TexCoord0);
//                    lowp vec4 finalColor = vec4(overlayColor.rgb, baseColor.a);
//                    gl_FragColor = mix(baseColor, finalColor, finalColor.a);
//                }"
//        }
    }
}
