---
title: Maven for beginners
date: 2016-06-06 03:35 UTC
tags: Maven, JAVA
category: Technology
---

What is Maven
============
Maven is a build automation tool. 

**What does build automation mean?** - It means compiling and packaging your JAVA code in such a way that is consistent across machines. Maven also makes the build process really easy. 

Consider this: with no build system, you have to take care of several particulars like:

* Is the build consistent across different JDKs (Oracle JDK, OpenJDK).
* Does it use the same JDK across machines (JDK7 vs JDK8).
* Dependency management - Without a build system, it can lead to [jar hell](https://dzone.com/articles/what-is-jar-hell).

There are several more advantages like:

* Providing project information.
* Help with migration to new features.

Maven and dependency management
===============================
The biggest advantage of using Maven is dependency management. Prior to Maven, there was [Ant](http://ant.apache.org/). However, Ant didn't have in built dependency management and used Ivy for it. Maven improves on that by having in-built dependency management features.

How Maven handles dependencies
------------------------------
There are two kinds of dependencies: **direct** and **transitive**. As the names suggest direct dependencies are ones that the project depends on directly. Transitive dependencies are ones that direct dependencies and transitive dependencies depend on. The tricky part is, as you might have guessed, transitive dependencies. Why? Transitive dependencies of your project can depend on other projects that may depend on others and so on. As your project becomes heavy on dependencies, so does your dependency graph of transitive dependencies. The second issue is a dependency cycle. If say, module A -> module B -> module C -> module B (-> represents depends on), we have a dependency cycle. This is a problem because the build would go into an infinite loop with module B trying to get module C and module C trying to get module B. 

Maven solves these problems using concepts like **dependency mediation**, **management**, **scope**, etc. The [Maven site](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html) has a good tutorial on it.

### Dependency scopes
Scopes define at what point of the build cycle is a dependency available. The important types are:

* **compile** - The default scope. Available in the classpath of a project. Dependencies with this scope is propagated to dependent projects.
* **provided** - Same as compile but available only during compilation and in the test classpath. In other words, it won't be available in the packaged jar or war.
* **runtime** - Available during runtime and test classpath only.
* **test**- Available in the test classpath.

The almighty POM
================
A **Project Object Model (POM)** provides all the configuration for a single project. It usually consists of these major declarations:

* Project ownership information.
* Dependency information.
* Build information.
* Documentation information.

Maven is very modular in the sense every bit of configuration can be handled with plugins. Maven plugins can be configured to run specific goals/phases with certain configuration parameters. Let's take the example of the maven-surefire-plugin.

<pre><code class="language-xml"><?php getCodeSnippet(18,5); ?></code></pre>

Take for instance, the phase `integration-test`. The goal for it is `test` which tells Maven to run it as a `test` phases aka it tells Maven, run them as tests. It also says Maven should include all files that matches the regex `**/*IntegrationTest.java`.

This will let you run phases like `mvn surefire:integration-test`. As the configuration suggests, it will pull all files that matches the regex, and run them as tests. A few important phases are:

 1. validate - Validate dependencies and the project.
 2. generate-sources - Generate sources from a model.
 3. process-sources - Process the source code, e.g., filter any values.
 4. generate-resources - Same as generate-sources but for resources (.xml files, etc).
 5. process-resources - Same as process-sources but for resources.
 6. compile - Compile the source code.
 7. process-test-sources - Same as process-sources but for the test phase.
 8. process-test-resources - Same process-resources but for the test phase.
 9. test-compile - Compile test classes.
10. test - Run the test phase a.k.a, run the unit tests.
11. package - Package into a jar, war, etc.
12. install - Install the package jar locally so other projects could consume it.
13. deploy - Deploy the package to a remote maven repository (like the Maven Central Repository), so other people could consume it.

