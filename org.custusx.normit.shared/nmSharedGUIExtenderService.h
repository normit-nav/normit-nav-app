
#ifndef NMSHAREDGUIEXTENDERSERVICE_H_
#define NMSHAREDGUIEXTENDERSERVICE_H_

#include "cxGUIExtenderService.h"
#include "org_custusx_normit_shared_Export.h"
class ctkPluginContext;

namespace cx
{
typedef boost::shared_ptr<class HelpEngine> HelpEnginePtr;

/** Example GUIExtender for normit
 *
 */
class org_custusx_normit_shared_EXPORT SharedGUIExtenderService : public GUIExtenderService
{
	Q_INTERFACES(cx::GUIExtenderService)
public:
		SharedGUIExtenderService(ctkPluginContext *context);
	virtual ~SharedGUIExtenderService();

	virtual std::vector<CategorizedWidget> createWidgets() const;

private:
  ctkPluginContext* mContext;
};
typedef boost::shared_ptr<SharedGUIExtenderService> SharedGUIExtenderServicePtr;

} /* namespace cx */

#endif /* NMSHAREDGUIEXTENDERSERVICE_H_ */
