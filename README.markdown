Pixelator
=======

Pixelator is a Ruby on Rails plugin that allows you to easily and
asyncronously add tracking pixels (and other bits of html) to your code.

- requires jquery-rails
- requires underscore.js


## Prerequisites

* requires jquery-rails
* requires underscore.js

## Usage

Install the gem:

`gem 'pixelator', :git => git@github.com:rmw/pixelator.git`

Run the generator:

`rails g pixelator`

The generator will create 2 files for you:
* config/initializers/pixelator.rb
* config/pixels.yml
It will also add pixelator_core to your application.js file:

`//= require 'pixelator_core'`

Add to you code:
Add your pixels to config/pixels.yml

pixels.yml contains a hash with the top level keys being types of
pixels, such as 'all', 'landing','sign_up', etc.

You define the keys.

Each key, has an array of pixels, which specify:

name - name of pixel for auditing purposes <br>
type - img, js, iframe <br>
snippet -<br>

These must be in the format
`    snippet: |
    <script>
        //code goes here
    </script>      `
optionally, you can include a 'partner'


In the head of your layout, add:
`<%= javascript_include_tag "/pixelator/data" %>`
In the bottom of your layout, add:
`= render partial: 'shared/pixelator', pixel_types: ['all']`

To add the Pixelator to different page, such as landing, do:
`= render partial: 'shared/pixelator', pixel_types: ['all']`
or
    var pixelator = new Pixelator(PIXEL_DATA, '#{@scope}');
    _.each(#{@pixel_types}, function(p) {
    pixelator.run(p);
    });

## TODO

* change partner to scope
* pixelator/data.js should just add data to Pixelator
* explain partner/scope
* Add Travis CI

## Maintainers

Created by the HowAboutWe.com dev team.

* [Rebecca Miller-Webster](mailto:dev@howaboutwe.com), HowAboutWe.com
* [Marco Carag](mailto:dev@howaboutwe.com), HowAboutWe.com     
* [Brendan Barr](mailto:dev@howaboutwe.com), HowAboutWe.com

Copyright (c) 2008-2012 This Life, Inc. This software is licensed under
the MIT License
