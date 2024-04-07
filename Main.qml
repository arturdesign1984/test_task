import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Fusion
import QueueHandler 1.0
import MainWindowState 1.0



ApplicationWindow {
    id: _window

    QueueHandler{
        id: _queueHandler
        onQueueRequestsLengthChanged: _txtQueueReq.text = "Задачи: " + queueRequestsLength
        onQueueResultsChanged: _txtQueueRes.text = "Результаты: " + queueResultsLength
    }

    MainWindowState{
        id: _mainWindowState
    }

    width: _mainWindowState.getWindowWidth()
    height: _mainWindowState.getWindowHeight()
    x: _mainWindowState.getWindowPositionX()
    y: _mainWindowState.getWindowPositionY()
    visible: true
    title: qsTr("Калькулятор")
    onWidthChanged: _mainWindowState.setWindowWidth(_window.width)
    onHeaderChanged: _mainWindowState.setWindowHeight(_window.height)
    onXChanged: _mainWindowState.setWindowPositionX(_window.x)
    onYChanged: _mainWindowState.setWindowPositionY(_window.y)
    onClosing: _mainWindowState.saveState();

    property real buttonsTextSize: 16


    Rectangle {
        id: _rect1
        width: parent.width
        height: parent.height * 0.33
        color: "#202020"

        TextInput {
            id: _txtInput
            rightPadding: 10
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            text: ""
            color: "#ffffff"
            font.pointSize: 24
            validator: RegularExpressionValidator {
                regularExpression: /^[0-9]+[.]?[0-9]*([-+/*]?[0-9]+[.]?[0-9]*)+[=]$/
            }
        }

        Text {
            id: _txtQueueReq
            leftPadding: 5
            anchors.left: parent.left
            anchors.top: parent.top
            height: parent.height / 5
            color: "#ffffff"
            font.pointSize: 16
            text: qsTr("Задачи: ")
        }

        Text {
            id: _txtQueueRes
            leftPadding: 5
            anchors.left: parent.horizontalCenter
            anchors.top: parent.top
            height: parent.height / 5
            color: "#ffffff"
            font.pointSize: 16
            text: "Результаты: "
        }
    }

    Rectangle {
        id: _rect2
        anchors.top: _rect1.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        color: "#202020"

        GridLayout {
            columns: 4
            rows: 5
            width: parent.width
            height: parent.height

            Rectangle {
                implicitWidth: (_rect2.width / 4 - 10)
                implicitHeight: (_rect2.height / 5 - 10)
                color: _rButtonIntLib.down ? "#3b3b3b" : "#323232"
                border.color: "#202020"
                border.width: 2
                radius: 5

                RadioButton {
                    anchors.fill: parent
                    Layout.column: 0
                    Layout.row: 0
                    id: _rButtonIntLib
                    checked: true

                    Text {
                        text: "INT"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    onClicked: _rButtonExtLib.checked = false

                    indicator: Rectangle {
                        implicitWidth: 13
                        implicitHeight: 13
                        x: _rButtonIntLib.leftPadding
                        y: parent.height / 2 - height / 2
                        radius: 13
                        border.color: _rButtonIntLib.down ? "#17a81a" : "#21be2b"

                        Rectangle {
                            width: 7
                            height: 7
                            x: 3
                            y: 3
                            radius: 7
                            color: _rButtonIntLib.down ? "#17a81a" : "#21be2b"
                            visible: _rButtonIntLib.checked
                        }
                    }
                }
            }

            Rectangle {
                implicitWidth: (_rect2.width / 4 - 10)
                implicitHeight: (_rect2.height / 5 - 10)
                color: _rButtonExtLib.down ? "#3b3b3b" : "#323232"
                border.color: "#202020"
                border.width: 2
                radius: 5

                RadioButton {
                    anchors.fill: parent
                    Layout.column: 1
                    Layout.row: 0
                    id: _rButtonExtLib

                    Text {
                        text: "EXT"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    onClicked: _rButtonIntLib.checked = false

                    indicator: Rectangle {
                        implicitWidth: 13
                        implicitHeight: 13
                        x: _rButtonExtLib.leftPadding
                        y: parent.height / 2 - height / 2
                        radius: 13
                        border.color: _rButtonExtLib.down ? "#17a81a" : "#21be2b"

                        Rectangle {
                            width: 7
                            height: 7
                            x: 3
                            y: 3
                            radius: 7
                            color: _rButtonExtLib.down ? "#17a81a" : "#21be2b"
                            visible: _rButtonExtLib.checked
                        }
                    }
                }
            }
            Button {
                Layout.column: 2
                Layout.row: 0
                id: _buttonCancel
                onClicked: _txtInput.text = ""
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonCancel.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "CE"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 0
                id: _buttonDev
                onClicked: {
                    _txtInput.validator.changed()
                    _txtInput.text += "/"
                }
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonDev.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "/"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 0
                Layout.row: 1
                id: _button7
                onClicked: _txtInput.text += "7"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button7.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "7"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 1
                Layout.row: 1
                id: _button8
                onClicked: _txtInput.text += "8"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button8.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "8"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 2
                Layout.row: 1
                id: _button9
                onClicked: _txtInput.text += "9"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button9.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "9"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 1
                id: _buttonMul
                onClicked: _txtInput.text += "*"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonMul.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "*"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 0
                Layout.row: 2
                id: _button4
                onClicked: _txtInput.text += "4"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button4.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "4"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 1
                Layout.row: 2
                id: _button5
                onClicked: _txtInput.text += "5"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button5.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "5"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 2
                Layout.row: 2
                id: _button6
                onClicked: _txtInput.text += "6"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button6.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "6"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 2
                id: _buttonMin
                onClicked: _txtInput.text += "-"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonMin.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "-"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 0
                Layout.row: 3
                id: _button1
                onClicked: _txtInput.text += "1"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button1.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "1"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 1
                Layout.row: 3
                id: _button2
                onClicked: _txtInput.text += "2"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button2.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "2"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 2
                Layout.row: 3
                id: _button3
                onClicked: _txtInput.text += "3"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button3.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "3"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 3
                id: _buttonPlu
                onClicked: _txtInput.text += "+"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonPlu.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "+"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Rectangle {
                implicitWidth: (_rect2.width / 4 - 10)
                implicitHeight: (_rect2.height / 5 - 10)
                color: _button0.down ? "#3b3b3b" : "#323232"
                border.color: "#202020"
                border.width: 1
                radius: 5

                Text {
                    id: _delay
                    text: qsTr("ЗАДЕРЖКА")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    font.pixelSize: 10
                    color: "#ffffff"
                }
                SpinBox {
                    id: _spinBox
                    anchors.top: _delay.bottom
                    anchors.bottom: parent.bottom
                    width: parent.width
                }
            }

            Button {
                Layout.column: 1
                Layout.row: 4
                id: _button0
                onClicked: _txtInput.text += "0"
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button0.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "0"
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 2
                Layout.row: 4
                id: _buttonDot
                onClicked: _txtInput.text += "."
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonDot.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "."
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 4
                id: _buttonEqu
                onClicked: {
                    _txtInput.text += "="
                    _txtInput.text += _rButtonIntLib.checked ? "0" : "1"
                    _txtInput.text += _spinBox.value
                    _queueHandler.addToQueueRequests(_txtInput.text)
                    _txtInput.text = ""
                }
                hoverEnabled: false

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonEqu.down ? "#76b9ed" : "#6da9d8"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5

                    Text {
                        text: "="
                        color: "white"
                        font.pixelSize: buttonsTextSize
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
