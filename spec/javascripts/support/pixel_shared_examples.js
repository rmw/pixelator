var Haw = Haw || {};
Haw.jasmine = Haw.jasmine || {};
Haw.jasmine.sharedExamples = Haw.jasmine.sharedExamples || {};

Haw.jasmine.sharedExamples["pixel_image"] = function() {
  describe('inserting pixel image into the dom', function() {
    var el;
    beforeEach(function() {
      el = $('body').children('img.pixel').last();
    });
    it("should have img appended to body", function() {
      expect(el).toExist();
    });
    it("should have the correct img src", function() {
      expect(el.attr('src'), 'http://www.something.com/pixel?id=safjdksljfklds&user=1234');
    });
    it("should have class of pixel", function() {
      expect(el).toHaveClass('pixel');
    });
  });
}

Haw.jasmine.sharedExamples["pixel_js"] = function() {
  describe('inserting pixel js into the dom', function() {
    it("should append a div to the dom", function() {
      expect($('div.user_1234')).toExist();
    });
  });
}
