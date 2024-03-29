#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

#include "appinfo.h"
#include "folderutil.h"
#include "libarchiso.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/assets/archbuilder.png"));

    QQmlApplicationEngine engine;

    qmlRegisterType<AppInfo>("ArchBuilder", 1, 0, "AppInfo");
    qmlRegisterType<FolderUtil>("ArchBuilder", 1, 0, "FolderUtil");
    qmlRegisterType<LibArchiso>("ArchBuilder", 1, 0, "LibArchiso");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
