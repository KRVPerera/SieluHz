
qt_add_library(timeout STATIC)
qt6_add_qml_module(timeout
    URI timeout
    VERSION 1.0
    SOURCES
        Timeout.cpp Timeout.h
        # Timeout.cpp
)
