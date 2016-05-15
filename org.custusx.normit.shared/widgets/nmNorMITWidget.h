#ifndef NMSHAREDWIDGET_H
#define NMSHAREDWIDGET_H

#include "cxBaseWidget.h"
#include "boost/shared_ptr.hpp"
#include "org_custusx_normit_shared_Export.h"
class QTabWidget;
class QAction;
class QSplitter;

namespace cx
{

/**
 * Top-level help widget
 *
 */
class org_custusx_normit_shared_EXPORT SharedWidget : public BaseWidget
{
	Q_OBJECT

public:
	explicit SharedWidget(QWidget* parent = NULL);
	virtual ~SharedWidget();
};

}//end namespace cx

#endif // NMSHAREDWIDGET_H
