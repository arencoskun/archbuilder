#include "libarchiso.h"

LibArchiso::LibArchiso(QObject *parent)
    : QObject{parent}
{

}

void LibArchiso::createNewProject(QString projectDir)
{
    folderUtil.copyFolder("/usr/share/archiso/configs/releng/.", projectDir);
}
