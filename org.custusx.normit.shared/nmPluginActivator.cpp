
#include <QtPlugin>
#include <iostream>
#include "cxRegisteredService.h"
#include "nmPluginActivator.h"
#include "nmSharedGUIExtenderService.h"

namespace cx
{

PluginActivator::PluginActivator()
{
//	std::cout << "Created PluginActivator" << std::endl;
}

PluginActivator::~PluginActivator()
{}

void PluginActivator::start(ctkPluginContext* context)
{
	SharedGUIExtenderService* guiExtender = new SharedGUIExtenderService(context);
	mGUIExtender = RegisteredService::create<SharedGUIExtenderService>(context, guiExtender, GUIExtenderService_iid);
}

void PluginActivator::stop(ctkPluginContext* context)
{
	mGUIExtender.reset();
    Q_UNUSED(context);
}

} // namespace cx



