var Pixelator = function(data, partner) {
  this.data = data;
  this.partner = partner;
};

Pixelator.prototype = {
  defaults: function() {
    var default_context = this.data.context || {};
    default_context.timestamp = new Date().getTime();
    return default_context;
  },
  picker: function(key, options) {
    var self = this;
    _.each(this.data.pixels[key], function(pixel) {

      if (pixel.partner && self.partner !== pixel.partner) {
        return;
      }

      var gp = new GenericPixel({ context: options, pixel: pixel });
      gp.insert();
    });
  },
  run: function(key, options) {
    options = _(options || {}).extend(this.defaults());
    this.picker(key, options);
  }
}
