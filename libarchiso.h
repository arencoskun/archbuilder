#ifndef LIBARCHISO_H
#define LIBARCHISO_H

#include <QObject>
#include "folderutil.h"

class LibArchiso : public QObject
{
    Q_OBJECT
public:
    explicit LibArchiso(QObject *parent = nullptr);
    Q_INVOKABLE void createNewProject(QString projectDir);

private:
    FolderUtil folderUtil;

signals:

};

#endif // LIBARCHISO_H
