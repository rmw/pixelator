Pixelator
=======

Pixelator is a Ruby on Rails plugin that allows you to easily and
asyncronously add tracking pixels (and other bits of html) to your code.


## Prerequisites

* requires jquery-rails
* requires underscore.js

## Usage

### Install the gem

`gem 'pixelator', :git => git@github.com:rmw/pixelator.git`

### Run the generator

`rails g pixelator`

The generator will create 2 files for you:
* config/initializers/pixelator.rb
* config/pixels.yml
It will also add pixelator_core to your application.js file:

`//= require 'pixelator_core'`

### Add to you code

#### config/pixels.yml

pixels.yml contains a hash with the top level keys being types of
pixels, such as 'all', 'landing','sign_up', etc.

You define the keys.

Each key, has an array of pixels, which specify:

* name - name of pixel for auditing purposes
* type - img, js, iframe
* snippet - snippet of html that will be run through an underscore template

For example, a google analytics snippet that is to be shown on all pages
 and uses the google_analytics key in Pixelator.context to set the GA account number
 would look like:
```
all:
  - name: google_analytics
    type: javascript
    snippet: |
      <script type="text/javascript">
      try {
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '<%= google_analytics %>']);
        _gaq.push(['_trackPageview']);

        (function() {
         var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
         ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
         var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
         })();
      } catch(err) {}
      </script>
```
optionally, you can include a 'partner'


#### Layout/Views
In the head of your layout, add:

`<%= javascript_include_tag "/pixelator/data" %>`

In the bottom of your layout, add:

`= render partial: 'shared/pixelator', pixel_types: ['all']`

To add the Pixelator to different page, such as landing, do:

`= render partial: 'shared/pixelator', pixel_types: ['all']`
or
```
    var pixelator = new Pixelator(PIXEL_DATA, '#{@scope}');
    _.each(#{@pixel_types}, function(p) {
    pixelator.run(p);
    });
```

## TODO

* change partner to scope
* pixelator/data.js should just add data to Pixelator
* explain partner/scope
* Add Travis CI
* Explain context

## Maintainers

Created by the HowAboutWe.com dev team.

* [Rebecca Miller-Webster](http://www.github.com/rmw), HowAboutWe.com
* [Marco Carag](http://www.github.com/jazzcrazed), HowAboutWe.com
* [Brendan Barr](http://www.github.com/bbarr), HowAboutWe.com

Copyright (c) 2008-2012 This Life, Inc. This software is licensed under
the MIT License
