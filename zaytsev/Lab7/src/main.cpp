#include <QScopedPointer>
#include <QGuiApplication>
#include <QQuickView>
#include "Counter.h"
#include "StringList.h"

#include <sailfishapp.h>

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(SailfishApp::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.auroraos"));
    application->setApplicationName(QStringLiteral("Lab7"));

    qmlRegisterType<Counter>("com.counter", 1, 0, "Counter");
    qmlRegisterType<StringList>("com.stringlist", 1, 0, "StringList");
    qmlRegisterType<Calculator>("com.calculator", 1, 0, "Calculator");

    QScopedPointer<QQuickView> view(SailfishApp::createView());
    view->setSource(SailfishApp::pathTo(QStringLiteral("qml/Lab7.qml")));
    view->show();

    return application->exec();
}
