#include "Counter.h"
#include "StringList.h"
#include <auroraapp.h>
#include <QtQuick>

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.auroraos"));
    application->setApplicationName(QStringLiteral("123"));

    qmlRegisterType<Counter>("com.counter", 1, 0, "Counter");
    qmlRegisterType<StringList>("com.stringlist", 1, 0, "StringList");

    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/MobileLabs.qml")));
    view->show();

    return application->exec();
}
