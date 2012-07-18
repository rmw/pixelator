describe('generic pixel', function() {
  var pixel, gp, context;
  beforeEach(function() {
    context = this.fixtures.pixel_data.context;
    $('.pixel').remove();
  });
  describe("image pixel", function() {
    beforeEach(function() {
      pixel = this.fixtures.pixel_data.pixels.img;
      gp = new GenericPixel({ context: context, pixel: pixel });
      gp.insert();
    });
    it("should have the correct tag", function() {
      expect(gp.tag, "<script type='text/javascript'>$('<div />').addClass('user_1234').appendTo('body');</script>");
    });
    itShouldBehaveLike("pixel_image");
  });
  describe('js pixel', function() {
    beforeEach(function() {
      pixel = this.fixtures.pixel_data.pixels.js;
      gp = new GenericPixel({ context: this.fixtures.pixel_data.context, pixel: pixel});
      gp.insert();
    });
    it("should have the correct tag", function() {
      expect(gp.tag, "<script type='text/javascript'>$('<div />').addClass('user_1234').appendTo('body');</script>");
    });
    itShouldBehaveLike("pixel_js");
  });
});
