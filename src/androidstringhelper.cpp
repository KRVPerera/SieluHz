//#include "androidstringhelper.h"

//AndroidStringHelper::AndroidStringHelper(QObject *parent)
//    : QObject{parent}
//{

//}


//AndroidStringHelper::AndroidStringHelper(QObject *parent) : QObject(parent)
//{
//    // Retrieve the string resource from Android
//    QAndroidJniObject stringId = QAndroidJniObject::fromString("my_string_key");
//    QAndroidJniObject activity = QtAndroid::androidActivity();
//    QAndroidJniObject resources = activity.callObjectMethod("getResources", "()Landroid/content/res/Resources;");
//    QAndroidJniObject package = activity.callObjectMethod("getPackageName", "()Ljava/lang/String;");
//    jint id = resources.callMethod<jint>("getIdentifier", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I", stringId.object<jstring>(), "string", package.object<jstring>());
//    QAndroidJniObject jString = resources.callObjectMethod("getString", "(I)Ljava/lang/String;", id);

//    // Convert the retrieved string to QString
//    m_myString = jString.toString();
//}

//QString AndroidStringHelper::myString() const
//{
//    return m_myString;
//}
