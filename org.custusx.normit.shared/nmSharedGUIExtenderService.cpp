
#include "ctkPluginContext.h"
#include "nmSharedGUIExtenderService.h"

#include "widgets/nmNorMITWidget.h"

namespace cx
{


SharedGUIExtenderService::SharedGUIExtenderService(ctkPluginContext *context) :
  mContext(context)
{
}

SharedGUIExtenderService::~SharedGUIExtenderService()
{
}

std::vector<GUIExtenderService::CategorizedWidget> SharedGUIExtenderService::createWidgets() const
{
	std::vector<CategorizedWidget> retval;

	retval.push_back(GUIExtenderService::CategorizedWidget(
			new SharedWidget(),
			"Utilities"));

	return retval;
}


} /* namespace cx */
