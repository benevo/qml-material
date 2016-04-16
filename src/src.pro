TEMPLATE = lib
TARGET = material

CONFIG += c++11
QT += qml quick


android {
    QT += androidextras svg xml
}

HEADERS += plugin.h \
           core/device.h \
           core/units.h

SOURCES += plugin.cpp \
           core/device.cpp \
           core/units.cpp

RESOURCES += ../icons/core_icons.qrc

QML_INSTALL_PATH=$$(QML2_IMPORT_PATH)#$$[QT_INSTALL_QML]
target.path = $$QML_INSTALL_PATH/Material

material.files += qmldir \
                    components/* \
                    controls/* \
                    core/* \
                    popups/* \
                    window/*
material.path = $$QML_INSTALL_PATH/Material

extras.files += extras/*
extras.path = $$QML_INSTALL_PATH/Material/Extras

listitems.files += listitems/*
listitems.path = $$QML_INSTALL_PATH/Material/ListItems

styles.files += styles/*
styles.path = $$QML_INSTALL_PATH/QtQuick/Controls/Styles/Material

qmldir.target = $$QML_INSTALL_PATH/Material/qmldir
qmldir.commands = sed \"s/$$LITERAL_HASH plugin material/plugin material/\" $$PWD/qmldir > $$qmldir.target
qmldir.depends = $$PWD/qmldir
qmldir.path = $$QML_INSTALL_PATH/Material

INSTALLS += target material extras listitems styles qmldir

OTHER_FILES += $$material.files $$extras.files $$listitems.files $$styles.files
