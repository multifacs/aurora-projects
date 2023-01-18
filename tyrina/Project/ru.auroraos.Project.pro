TARGET = ru.auroraos.Project

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    qml/pages/Color.qml \
    qml/pages/Design.qml \
    qml/pages/Final.qml \
    qml/pages/Finish.qml \
    qml/pages/Type.qml \
    qml/pages/types/classic.qml \
    rpm/ru.auroraos.Project.spec \
    AUTHORS.md \
    CODE_OF_CONDUCT.md \
    CONTRIBUTING.md \
    LICENSE.BSD-3-CLAUSE.md \
    README.md \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.auroraos.Project.ts \
    translations/ru.auroraos.Project-ru.ts \
