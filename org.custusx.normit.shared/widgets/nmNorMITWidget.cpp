
#include "boost/bind.hpp"
#include "boost/function.hpp"
#include <QLabel>

#include "cxTypeConversions.h"
#include "cxSettings.h"
#include "cxLogger.h"
#include "cxDataLocations.h"
#include <QDesktopServices>

#include "nmNorMITWidget.h"

namespace cx
{

SharedWidget::SharedWidget(QWidget* parent) :
    BaseWidget(parent, "NorMITSharedWidget", "NorMIT Shared")
{
	QVBoxLayout* layout;
	layout = new QVBoxLayout(this);
	layout->addWidget(new QLabel("Hello NorMIT"));
}


SharedWidget::~SharedWidget()
{}


}//end namespace cx
