# TestGen

A gem that contains generators that create things testers need.

Currently it only generates a cucumber project.  You can do this by executing:

    testgen project <project_name>
    
This command will create a project in the <em>project_name</em> directory with the files needed to begin
developing cucumber features.  There are options that can be provided to have the project configure to use different gems.  Here are a few:

## Web testing

If you are testing a web application, <em>testgen</em> can setup the project to use the PageObject gem.

    testgen project <project_name> --pageobject-driver=watir
    
Valid options for the <em>--pageobject-driver</em> option are 'watir' or 'selenium'

## Android testing

If you are testing an android application in the emulator or on a device, <em>testgen</em> can setup the project to use the Gametel gem.

    testgen project <project_name> --with-gametel

If you want to setup project to use the Appium library

    testgen project <project_name> --with-appium

## Native Windows testing

If you are testing a native windows application, <em>testgen</em> can setup the project to use the Mohawk gem.

    testgen project <project_name> --with-mohawk


## Moving page-objects or screen-objects to the lib directory

There is another option available with will create the page or screen directory in a base directoy named lib.  It will also setup the project so these files get loaded the same way they would if the directory was in the support directory.  Here's an example of creating a project for web testing using the lib option:

    testgen project <project_name> --pageobject-driver=watir --with-lib




