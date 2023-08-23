#ifndef APPINFO_H
#define APPINFO_H

#include <QObject>

class AppInfo : public QObject
{
    Q_OBJECT
public:
    explicit AppInfo(QObject *parent = nullptr);
    Q_INVOKABLE QString getVersionString();

private:
    QString m_versionString = "Dev 0.0";

signals:

};

#endif // APPINFO_H
