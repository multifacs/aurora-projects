TARGET = ru.tyrina.Lab8

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    qml/pages/AudioPlayer.qml \
    qml/pages/CanvasHouse.qml \
    qml/pages/Fountain.qml \
    qml/pages/Sprite.qml \
    qml/pages/Tap.qml \
    qml/pages/VideoPlayer.qml \
    rpm/ru.tyrina.Lab8.spec \
    AUTHORS.md \
    CODE_OF_CONDUCT.md \
    CONTRIBUTING.md \
    LICENSE.BSD-3-CLAUSE.md \
    README.md \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.tyrina.Lab8.ts \
    translations/ru.tyrina.Lab8-ru.ts \

QT += multimedia
