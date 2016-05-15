
#ifndef CXPluginActivator_H_
#define CXPluginActivator_H_

#include <ctkPluginActivator.h>
#include "boost/shared_ptr.hpp"

namespace cx
{
/**
 * \ingroup cx_plugins
 *
 *
 */

typedef boost::shared_ptr<class RegisteredService> RegisteredServicePtr;

/**
 * Activator for the normit shared plugin
 *
 */
class PluginActivator :  public QObject, public ctkPluginActivator
{
  Q_OBJECT
  Q_INTERFACES(ctkPluginActivator)
  Q_PLUGIN_METADATA(IID "org_custusx_normit_shared")

public:

  PluginActivator();
  ~PluginActivator();

  void start(ctkPluginContext* context);
  void stop(ctkPluginContext* context);

private:
  RegisteredServicePtr mGUIExtender;
};

} // namespace cx

#endif /* CXPluginActivator_H_ */
