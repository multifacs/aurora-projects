#include "Counter.h"
#include "StringList.h"
#include "Calculator.h"
#include <sailfishapp.h>
#include <QtQuick>

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(SailfishApp::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.auroraos"));
    application->setApplicationName(QStringLiteral("123"));

    qmlRegisterType<Counter>("com.counter", 1, 0, "Counter");
    qmlRegisterType<StringList>("com.stringlist", 1, 0, "StringList");
    qmlRegisterType<Calculator>("com.calculator", 1, 0, "Calculator");

    QScopedPointer<QQuickView> view(SailfishApp::createView());
    view->setSource(SailfishApp::pathTo(QStringLiteral("qml/MobileLabs.qml")));
    view->show();

    return application->exec();
}
