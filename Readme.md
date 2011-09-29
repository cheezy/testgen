# TestGen

A gem that contains generators that create things testers need.

Currently it only generates a cucumber project.  You can do this by executing:

    testgen project <project_name>
    
This command will create a project in the <em>project_name</em> directory with the files needed to begin
developing cucumber features.  If you are using the PageObject gem you can also provide an option to setup your project accordingly.

    testgen project <project_name> --pageobject-driver=watir
    
Valid options for the <em>--pageobject-driver</em> option are 'watir' or 'selenium'