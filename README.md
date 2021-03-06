bubble
===========

Takes the input file and produces HTML files for each camera make, camera model and also an index.

Features
--------

The index HTML page must contain:
- Thumbnail images for the first 10 work
- Navigation that allows the user to browse to all camera makes

Each Camera Make HTML page must contain:
- Thumbnail images of the first 10 works for that camera make
- Navigation that allows the user to browse to the index page and to all camera models of that make

Each Camera Model HTML page must contain:
- Thumbnail images of all works for that camera make and model
- Navigation that allows the user to browse to the index page and the camera make

The batch processor should take the location of the input file and the output directory as parameters.

The input file only contains a small sample set of works.

Examples
--------

- bin/bubble.rb 'data/works.xml' 'test_out'

Requirements
------------

Digital images are often stored with camera information in an xml format.
Using this xml feed, create a set of static HTML files to allow a user to browse these images.


The index HTML page must contain:
- Thumbnail images for the first 10 work
- Navigation that allows the user to browse to all camera makes

Each Camera Make HTML page must contain:
- Thumbnail images of the first 10 works for that camera make
- Navigation that allows the user to browse to the index page and to all camera models of that make

Each Camera Model HTML page must contain:
- Thumbnail images of all works for that camera make and model
- Navigation that allows the user to browse to the index page and the camera make

The batch processor should take the location of the input file and the output directory as parameters.

While the sample xml file is small, the solution is expected to handle files in excess of 500Mb.

Install
-------

- git clone git@github.com:neurofen/bubble.git
- cd bubble
- bundle install
- rake
- chmod a+x bin/bubble.rb

Author
------

Original author: James Pott

Contributors:


License
-------

Unlicensed
