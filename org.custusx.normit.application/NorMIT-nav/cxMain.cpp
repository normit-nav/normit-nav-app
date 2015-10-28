/*=========================================================================
This file is part of CustusX, an Image Guided Therapy Application.

Copyright (c) 2008-2014, SINTEF Department of Medical Technology
All rights reserved.

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, 
   this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, 
   this list of conditions and the following disclaimer in the documentation 
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors 
   may be used to endorse or promote products derived from this software 
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE 
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
=========================================================================*/

#include <iostream>
#include <QCommandLineParser>
#include "cxMainWindow.h"
#include "cxMainWindowApplicationComponent.h"
#include "cxLogicManager.h"
#include "cxApplication.h"
#include "cxConfig.h"

enum CommandLineParseResult
{
    CommandLineOk,
    CommandLineError,
    CommandLineVersionRequested,
    CommandLineHelpRequested
};

CommandLineParseResult parseCommandLine(QCommandLineParser &parser, QString *errorMessage)
{
    parser.setSingleDashWordOptionMode(QCommandLineParser::ParseAsLongOptions);
    const QCommandLineOption helpOption = parser.addHelpOption();
    const QCommandLineOption versionOption = parser.addVersionOption();
    const QCommandLineOption loadOption("load", "The patient to load on startup.", "patient");
    parser.addOption(loadOption);

    if (!parser.parse(QCoreApplication::arguments())) {
        *errorMessage = parser.errorText();
        return CommandLineError;
    }

    if (parser.isSet(versionOption))
        return CommandLineVersionRequested;

    if (parser.isSet(helpOption))
        return CommandLineHelpRequested;

    return CommandLineOk;
}


int main(int argc, char *argv[])
{

#if !defined(WIN32)
  //for some reason this does not work with dynamic linking on windows
  //instead we solve the problem by adding a handmade header for the cxResources.qrc file
  Q_INIT_RESOURCE(cxResources);
#endif

  cx::Application app(argc, argv);
  app.setOrganizationName("NorMIT");
  app.setOrganizationDomain("www.normit.no");
  app.setApplicationName("NorMIT-nav");
  app.setWindowIcon(QIcon(":/normit/icons/normit/NorMIT.png"));
  app.setAttribute(Qt::AA_DontShowIconsInMenus, false);
  app.setApplicationVersion(CustusX_VERSION_STRING);

  QCommandLineParser parser;
  parser.setApplicationDescription("NorMIT-nav. Norwegian Research Platform for Image-Guided Intervention.");

  int retval = 0;
  QString errorMessage;
  switch (parseCommandLine(parser, &errorMessage))
  {
      case CommandLineOk:
      {
          cx::ApplicationComponentPtr mainwindow(new cx::MainWindowApplicationComponent<cx::MainWindow>());
          cx::LogicManager::initialize(mainwindow);
          retval = app.exec();
          cx::LogicManager::shutdown(); // shutdown all global resources, _after_ gui is deleted.
          break;
      }
      case CommandLineError:
      {
          fputs(qPrintable(errorMessage), stderr);
          fputs("\n\n", stderr);
          fputs(qPrintable(parser.helpText()), stderr);
          break;
      }
      case CommandLineVersionRequested:
      {
          printf("%s %s\n", qPrintable(QCoreApplication::applicationName()), qPrintable(QCoreApplication::applicationVersion()));
          break;
      }
      case CommandLineHelpRequested:
      {
          parser.showHelp();
          Q_UNREACHABLE();
      }
  }

  return retval;
}
