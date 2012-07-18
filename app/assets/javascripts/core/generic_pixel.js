function GenericPixel(options) {
  options = options || {};
  this.snippet = options.pixel['snippet'];
  this.context = options.context;
  this.comment = 'Generic Pixel(' + options.pixel['type'] + '): ' + options.pixel['name'];
  this.template = _.template('<!-- ' + this.comment + ' -->' + decodeURIComponent(this.snippet));
  this.tag = this.template(this.context);
}

GenericPixel.prototype.insert = function() {
  $(this.tag).addClass('pixel').appendTo('body');
  $('body').append('<!-- END ' + this.comment + ' -->');
};
