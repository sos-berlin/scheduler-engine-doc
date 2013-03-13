#!/bin/bash
# ---------------------------------------------------------------------------------------------------------------
# /brief Prepare the documentation of the scheduler engine
# /details
# This script is for downloading and preparing the documentation of the JobScheduler engine kernel.
# The version conforms always to the given version of the setup Artifakt.
#
# in a windows environment you can use 'bash -c "./prepare-setup.sh"' if cygwin is installed.
# ---------------------------------------------------------------------------------------------------------------
set -e
mvn clean -Ppurge-local-repo
mvn install -U
exit

