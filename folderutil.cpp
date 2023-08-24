#include "folderutil.h"

FolderUtil::FolderUtil(QObject *parent)
    : QObject{parent}
{

}

QString FolderUtil::removePathPrefix(QString path)
{
    return path.right(path.length() - 7);
}

bool FolderUtil::isFolderEmpty(QString path)
{
    QDir directory = QDir(removePathPrefix(path));
    if(directory.entryInfoList(QDir::NoDotAndDotDot|QDir::AllEntries).count() == 0) {
        return true;
    } else {
        return false;
    }
}

void FolderUtil::copyFolder(QString sourcePath, QString targetPath)
{
    QString command = "cp";
    QStringList arguments;
    arguments << "-r" << sourcePath << targetPath;
    QProcess copyProcess;
    qDebug() << "Starting copy folder process...";
    copyProcess.start(command, arguments);
    copyProcess.waitForFinished();
}
