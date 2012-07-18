describe("pixelator", function() {

  var current_user,
      pixelator,
      pixelator2;

  beforeEach(function() {
    $('.pixel').remove();
    current_user = {};
    pixelator = new Pixelator(this.fixtures.pixel_data.main);
  });

  describe("picker", function() {
    describe("all", function() {
      beforeEach(function() {
        pixelator.picker('all', this.fixtures.pixel_data.context);
      });
      itShouldBehaveLike("pixel_image");
    });
  });
  describe("run", function() {
    beforeEach(function() {
      pixelator.run('all', this.fixtures.pixel_data.context);
      pixelator.run('landing', this.fixtures.pixel_data.context);
    });
    itShouldBehaveLike("pixel_image");
    itShouldBehaveLike("pixel_js");
  });

  describe("using pre-set context", function() {
    beforeEach(function() {
      var pixel_data = this.fixtures.pixel_data.main;
      pixel_data.context = this.fixtures.pixel_data.context;
      console.log(pixel_data);
      pixelator2 = new Pixelator(pixel_data);
      console.log(pixelator2);
    });
    describe("run", function() {
      beforeEach(function() {
        pixelator2.run('all');
        pixelator2.run('landing');
      });
      itShouldBehaveLike("pixel_image");
      itShouldBehaveLike("pixel_js");
    });
  });

  describe('whitelabel limitations', function() {

    it ('should include pixels that have the current partner property or no partner property', function() {
      pixelator = new Pixelator(this.fixtures.pixel_data.main, 'a_white_label');
      pixelator.run('all', this.fixtures.pixel_data.context);
      expect($('img.pixel').length).toBe(2);
    });

    it ('should skip pixels with the wrong partner property', function() {
      pixelator = new Pixelator(this.fixtures.pixel_data.main, 'another_white_label');
      pixelator.run('all', this.fixtures.pixel_data.context);
      expect($('img.pixel').length).toBe(1);
    });
  });
});
