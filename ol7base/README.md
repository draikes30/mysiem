ol7base
=======

This image based on oraclelinux:7-slim will serve as a base image
for all my security testing images.

The image is configured with jdk 1.8.0_144, maven 3.5.2, and both
firefox and google chrome with their appropriate drivers.

The test user "tester" is configured with my userid and groupid so that I can
both read and write to mounted volumes

release-ol7base-1.0
===================

Initial release of this image to be merged into master.
