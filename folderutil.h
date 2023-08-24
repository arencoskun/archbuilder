#ifndef FOLDERUTIL_H
#define FOLDERUTIL_H

#include <QObject>
#include <QDir>
#include <QProcess>
#include <QDebug>

class FolderUtil : public QObject
{
    Q_OBJECT
public:
    explicit FolderUtil(QObject *parent = nullptr);
    Q_INVOKABLE QString removePathPrefix(QString path);
    Q_INVOKABLE bool isFolderEmpty(QString path);
    Q_INVOKABLE void copyFolder(QString sourcePath, QString targetPath);

signals:

};

#endif // FOLDERUTIL_H
