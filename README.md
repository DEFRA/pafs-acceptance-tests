# Project application and funding (PAFS) tests

The Project Application and Funding Service (PAFS) is used by regional management authorities to apply for funding for flood and coastal risk management projects.

This project contains the acceptance tests for the service. It is built around [Quke](https://github.com/DEFRA/quke), a Ruby gem that simplifies the process of writing and running Cucumber acceptance tests.

## Pre-requisites

This project is setup to run against version 3.2.2 of Ruby.

The rest of the pre-requisites are the same as those for [Quke](https://github.com/DEFRA/quke#pre-requisites).

## Installation

First clone the repository and then drop into your new local repo

```bash
git clone https://github.com/DEFRA/pafs-acceptance-tests.git && cd pafs-acceptance-tests
```

Next download and install the dependencies

```bash
bundle install
```

## Configuration

You can figure how the project runs using [Quke config files](https://github.com/DEFRA/quke#configuration). Before executing this project for the first time you'll need to create an initial `.config.yml` file.

```bash
touch .config.yml
```

Into that file you'll need to add the `app_host:` entry, with the url of the environment you wish to test against.

If left as that by default when **Quke** is executed it will run against your selected environment using the headless browser **PhantomJS**.

### Custom PAFS config

Recently we have needed to add special logic for running the tests in Linux environments. When run on Linux tests are failing if the an element is 'off the page' i.e. you would need to scroll to interact with it. Because of this when running tests in a Linux environment e.g. Ubuntu you'll need to add the following to the `.config.yml` (the sizes can vary, but ensure its large enough for all elements on all pages to be visible).

```yaml
custom:
  window_size:
    width: 1000
    height: 2000
```

The project now includes logic to look for this and if present will resize the window accordingly. Ideally this situation should be periodically tested to see if this workaround is still required.

### Back office

The project contains logic to automatically determine the URL to the back office, by assuming `app_host:` is the front office URL for one of our standard environments (development, QA, pre-prod or production).

This means you can run all the tests, even though you have only given **Quke** details for the front office.

However if you're not running the project against one of these standard environments (for example you are running against a deployment in [Heroku](https://heroku.com), or something you have running locally) you can override this logic and simply tell **Quke** the back office URL via an environment variable.

```bash
WEX_BO_URL="http://localhost:3001" bundle exec quke --tags ~@ci
```

## Execution

Simply call

```bash
bundle exec quke
```

You can create [multiple config files](https://github.com/DEFRA/quke#multiple-configs), for example you may wish to have one setup for running against **Chrome**, and another to run against a different environment. You can tell **Quke** which config file to use by adding an environment variable argument to the command.

```bash
QUKE_CONFIG='chrome.config.yml' bundle exec quke
```

## Use of tags

[Cucumber](https://cucumber.io/) has an inbuilt feature called [tags](https://github.com/cucumber/cucumber/wiki/Tags).

These can be added to a [feature](https://github.com/cucumber/cucumber/wiki/Feature-Introduction) or individual **scenarios**.

```gherkin
@functional
Feature: Validations within the digital service
```

```gherkin
@frontoffice @TRA_SmokeTests @QA_RegressionTests
Scenario: Registration by an individual
```

When applied you then have the ability to filter which tests will be used during any given run

```bash
bundle exec quke --tags@QA_SmokeTests # Run only things tagged with this
bundle exec quke --tags @frontoffice,@TRA_SmokeTests # Run all things with these tags
bundle exec quke --tags ~@functional # Don't run anything with this tag (run everything else)

To run tests against a specific create a yml file and add it to your run line
QUKE_CONFIG=remoteTrain.config.yml bundle exec quke --tag @TRA_SmokeTests
```

### In this project

To have consistency across the project the following tags are defined and should be used in the following ways

|Tag|Description|
|---|---|
|@frontoffice|Any feature or scenario expected to be run against the front office application|
|@QA_SmokeTests, @TRA_SmokeTests or @PreProd_SmokeTest|Any feature or scenario expected to be run against the application based on the test enviroment i.e. QA, Training, PreProd|
|@QA_RegressionTests, @TRA_RegressionTests or @PreProd_RegressionTests|Any feature or scenario expected to be run against the application based on the test enviroment i.e. QA, Training, PreProd|
|@fix|A feature or scenario that highlights an error or issue with the service that needs to be fixed|

It's also common practice to use a custom tag whilst working on a new feature or scenario e.g. `@QA_R1` or `@wip` etc. That is perfectly acceptable but please ensure they are removed before your change is merged.

## Tips

In our experience one of the most complex and time consuming aspects of creating new features is identifying the right [CSS selector](http://www.w3schools.com/cssref/css_selectors.asp) to use, to pick the HTML element you need to work with.

A tool we have found useful is a Chrome addin called [SelectorGadget](http://selectorgadget.com/).

You can also test them using the Chrome developer tools. Open them up, select the elements tab and then `ctrl/cmd+f`. You should get an input field into which you can enter your selector and confirm/test its working. See <https://developers.google.com/web/updates/2015/05/search-dom-tree-by-css-selector>

## Contributing to this project

If you have an idea you'd like to contribute please log an issue.

All contributions should be submitted via a pull request.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

<http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3>

The following attribution statement MUST be cited in your products and applications when using this information.

> Contains public sector information licensed under the Open Government license v3

### About the license

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable information providers in the public sector to license the use and re-use of their information under a common open licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.
