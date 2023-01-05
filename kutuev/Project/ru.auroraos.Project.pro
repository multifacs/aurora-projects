TARGET = ru.auroraos.Project

CONFIG += \
    sailfishapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \
    src/Counter.h \
    src/StringList.h

DISTFILES += \
    rpm/ru.auroraos.Project.spec \
    rpm/ru.auroraos.Project.yaml \
    AUTHORS.md \
    CODE_OF_CONDUCT.md \
    CONTRIBUTING.md \
    LICENSE.BSD-3-CLAUSE.md \
    README.md \

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += sailfishapp_i18n

TRANSLATIONS += \
    translations/ru.auroraos.Project.ts \
    translations/ru.auroraos.Project-ru.ts \
