===========
Boilerplate
===========

Overview
--------

Service oriented architectures are composed of multiple isolated components that share cross-cutting concerns (CI, Logging, Image Builds, etc). Settling on uniform conventions for these concerns can help streamline the development process. As a system evolves, so too do these conventions. Updating boilerplate often requires manual copy/paste of boilerplate files across many repos.

``Boilerplate`` acts as a source-of-truth for boilerplate code. Using a config file, a service developer specifies which conventions they want for their service. The boilerplate tool reads this config, and copies the appropriate boilerplate files into the service repository. 

Why clone files?
----------------

Another common method for sharing scripts across repositories is to keep them in one place and run the scripts remotely when needed.

While cloning them into the destination repository takes more space, there are a few advantages.

1. Some files like ``.travis.yml`` _must_ exist inside the target repository. Running that remotely is not an option.

2. Calling remote scripts is less secure.

3. Remote scripts adds a dependency on remote services. Copying the files allows users to work offline.

4. Since all boilerplate files are checked into source code, you can easily view updates to the boilerplate files using your version control system.

Adding boilerplate to a repository
----------------------------------

1. Add ``export REPOSITORY=<YOUR_REPO_NAME>`` at the top of the ``Makefile`` in your repository (create a ``Makefile``, if needed)

2. Add the following to your ``Makefile``

::

  .PHONY: update_boilerplate
  update_boilerplate:
    @boilerplate/update.sh

3. Copy the `<https://github.com/nebulaclouds/boilerplate/blob/master/boilerplate/update.sh>`_ script and paste it to ``boilerplate/update.sh`` of your repository. Make it executable with ``chmod +x boilerplate/update.sh``

4. Add a file ``boilerplate/update.cfg`` and configure it with the options below.

5. Execute ``make update_boilerplate`` in the root of your repository to sync the boilerplate.

6. Execute ``make update_boilerplate`` periodically to pull in the latest boilerplate.


Configuration
-------------

Boilerplate files are organized into "conventions". Different services require different conventions. For example, python services might require a python Dockerfile, while golang services need a golang Dockerfile. The boilerplate config allows you to opt into only the conventions that suit your needs. 

To opt into a convention, configure ``boilerplate/update.cfg`` with the conventions that you'd like to opt in to. The convention files live in `<https://github.com/nebulaclouds/boilerplate/tree/master/boilerplate>`_ and are specified in the format ``{namespace}/{convention}``

For example, to opt-into nebulaclouds's ``docker_build`` and ``golangci_file`` conventions, your ``boilerplate/update.cfg`` file might look like this:

::

  # Use standard docker build targets
  nebulaclouds/docker_build
  
  # Common linting configuration for golang
  nebulaclouds/golangci_file

below is a full list of available conventions.

`nebulaclouds/docker_build <https://github.com/nebulaclouds/boilerplate/blob/master/boilerplate/nebula/docker_build/Readme.rst>`_

`nebulaclouds/golang_dockerfile <https://github.com/nebulaclouds/boilerplate/blob/master/boilerplate/nebula/golang_dockerfile/Readme.rst>`_

`nebulaclouds/golangci_file <https://github.com/nebulaclouds/boilerplate/blob/master/boilerplate/nebula/golangci_file/Readme.rst>`_

`nebulaclouds/golang_test_targets <https://github.com/nebulaclouds/boilerplate/blob/master/boilerplate/nebula/golang_dockerfile/Readme.rst>`_

`nebulaclouds/pull_request_template <https://github.com/nebulaclouds/boilerplate/blob/master/boilerplate/nebula/golang_test_targets/Readme.rst>`_

`nebulaclouds/nebula_golang_compile <https://github.com/nebulaclouds/boilerplate/blob/master/boilerplate/nebula/nebula_golang_compile/Readme.rst>`_

*Note*: some conventions require some minor configurations, the Readme of the convention should inform you of anything else you need to do.

