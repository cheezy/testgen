# TestGen

A gem that contains generators that create things testers need.

Firstly install the gem by running the following in the terminal:

    gem install testgen

By default it only generates a cucumber project. You can do this by executing:

    testgen project <project_name>

This command will create a project in the <em>project_name</em> directory with the files and directory structure needed
to begin developing cucumber features.

```
my_project_name
├── Gemfile
├── Rakefile
├── cucumber.yml
└── features
    ├── step_definitions
    └── support
        ├── env.rb
        ├── hooks.rb
        └── pages
```

There are options that can be provided to have the project configure to use different gems. Here are a few:

## Web testing

If you are testing a web application, <em>testgen</em> will by default setup the project to use
the [page-object](https://github.com/cheezy/page-object) gem with
[Watir](http://watir.com/).

    testgen project <project_name>

## Android testing

If you want to setup project to use the [Appium](https://github.com/appium/ruby_lib) library

    testgen project <project_name> --with-appium

## Native Windows testing

If you are testing a native windows application, <em>testgen</em> can setup the project to use
the [Mohawk](https://github.com/leviwilson/mohawk) gem.

    testgen project <project_name> --with-mohawk

## Moving page-objects or screen-objects to the lib directory

There is another option available which will create the page or screen directory in a base directory named <em>lib</em>.
It will also setup the project so that these files get loaded the same way they would if the directory was in the
<em>support</em> directory. Here's an example of creating a project for web testing using the lib option:

    testgen project <project_name> --with-lib

```
my_project_name
├── Gemfile
├── Rakefile
├── cucumber.yml
├── features
│   ├── step_definitions
│   └── support
│       ├── env.rb
│       └── hooks.rb
└── lib
    └── pages
```
