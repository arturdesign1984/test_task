#ifndef DOITEXT_GLOBAL_H
#define DOITEXT_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(DOITEXT_LIBRARY)
#define DOITEXT_EXPORT Q_DECL_EXPORT
#else
#define DOITEXT_EXPORT Q_DECL_IMPORT
#endif

#endif // DOITEXT_GLOBAL_H
