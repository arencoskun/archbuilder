#include "appinfo.h"

AppInfo::AppInfo(QObject *parent)
    : QObject{parent}
{

}

QString AppInfo::getVersionString()
{
    return m_versionString;
}
