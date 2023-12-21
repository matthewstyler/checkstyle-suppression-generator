# Checkstyle Suppression Generator
[![Gem Version](https://badge.fury.io/rb/checkstyle-suppression-generator.svg)](https://badge.fury.io/rb/checkstyle-suppression-generator)
![CI Status](https://github.com/matthewstyler/ruby-perlin-2D-map-generator/actions/workflows/main.yml/badge.svg)
![CodeQL](https://github.com/matthewstyler/checkstyle-suppression-generator/workflows/CodeQL/badge.svg)
<a href="https://codeclimate.com/github/matthewstyler/checkstyle-suppression-generator/test_coverage"><img src="https://api.codeclimate.com/v1/badges/b63e2b943acbfd970fae/test_coverage" /></a>
<a href="https://codeclimate.com/github/matthewstyler/checkstyle-suppression-generator/maintainability"><img src="https://api.codeclimate.com/v1/badges/b63e2b943acbfd970fae/maintainability" /></a>

A gem that takes as input the output of a maven checkstyle plugin checkstyle:check goal and generates a suppressions.xml file.

# Installation

### Bundler

```ruby
gem 'ruby-perlin-2D-map-generator'
```

### Manual

```sh
gem install ruby-perlin-2D-map-generator
```

## Usage

Example Input:
```sh
[INFO] Scanning for projects...
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Build Order:
[INFO] 
[INFO] my-project                                                         [jar]
[INFO]  ------------------< com.my-project:my-project >------------------
[INFO] Building my-project 0.0.1-SNAPSHOT                          [1/1]
[INFO]   from my-project/pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- checkstyle:3.3.0:check (default-cli) @ my-project ---
[WARNING] src/main/java/com/test/DEF.java:[147,4] (coding) OverloadMethodsDeclarationOrder: All overloaded methods should be placed next to each other. Placing non-overloaded methods in between overloaded methods with the same type is a violation. Previous overloaded method located at line '119'.
[WARNING] src/main/java/com/test/ABC.java:[26,11] (sizes) ParameterNumber: More than 7 parameters (found 9).
[WARNING] src/main/java/com/test/ABC.java:[103,4] (coding) ReturnCount: Return count is 6 (max allowed for non-void methods/lambdas is 4).
[WARNING] src/main/java/com/test/ABC.java:[103,4] (metrics) NPathComplexity: NPath Complexity is 720 (max allowed is 200).
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for my-project 0.0.1-SNAPSHOT:
[INFO] 
[INFO] my-project .................................. FAILURE [  1.957 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  2.841 s
[INFO] Finished at: 2023-12-20T16:31:35-05:00
[INFO] ------------------------------------------------------------------------
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-checkstyle-plugin:3.3.0:check (default-cli) on project my-project: You have 4 Checkstyle violations. -> [Help 1]
[ERROR] 
[ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR] 
[ERROR] For more information about the errors and possible solutions, please read the following articles:
[ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoFailureException
[ERROR] 
[ERROR] After correcting the problems, you can resume the build with the command
[ERROR]   mvn <args> -rf :my-project

```

Output:

```xml
<?xml version="1.0"?>
<!DOCTYPE suppressions PUBLIC "-//Checkstyle//DTD SuppressionFilter Configuration 1.2//EN"
      "https://checkstyle.org/dtds/suppressions_1_2.dtd">

<suppressions>

	<suppress checks="OverloadMethodsDeclarationOrder" files="src/main/java/com/test/DEF.java"/>
	<suppress checks="ParameterNumber" files="src/main/java/com/test/ABC.java"/>
	<suppress checks="ReturnCount" files="src/main/java/com/test/ABC.java"/>
	<suppress checks="NPathComplexity" files="src/main/java/com/test/ABC.java"/>

</suppressions>

```


## Command Line Usage
```sh
Usage: checkstyle-suppression-generator command [OPTIONS]
       CHECKSTYLE_OUTPUT_FILE(STRING) [O=O]

Generate a Java checkstyle suppressions.xml file from a checkstyle:check output.


Arguments:
  CHECKSTYLE_OUTPUT_FILE(STRING)  Output from checkstyle:check goal

Keywords:
  O=O  Name of the suppressions file to be generated (default
       "suppressions.xml")

Options:
  -h, --help  Print usage
```
