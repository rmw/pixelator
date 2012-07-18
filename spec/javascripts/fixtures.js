beforeEach(function() {
  this.fixtures = {};

  /*** PIXELS ***/
  this.fixtures.pixel_data = {
    pixels: {
      img: {
        type: 'image',
        snippet: '%3Cimg%20src%3D%22http%3A%2F%2Fwww.something.com%2Fpixel%3Fid%3Dsafjdksljfklds%26user%3D%3C%25%3D%20user.id%20%25%3E%22%20width%3D1%20height%3D0%20%2F%3E'
      },
      other_img: {
        type: 'image',
        partner: 'a_white_label',
        snippet: '%3Cimg%20src%3D%22http%3A%2F%2Fwww.something.com%2Fpixel%3Fid%3Dsafjdksljfklds%26user%3D%3C%25%3D%20user.id%20%25%3E%22%20width%3D1%20height%3D0%20%2F%3E'
      },
      js: {
        type: 'javascript',
        snippet: "%3Cscript%3E%24('body').append(%24('%3Cdiv%20%2F%3E').addClass('user_%3C%25%3D%20user.id%20%25%3E').addClass('pixel'))%3B%3C%2Fscript%3E"
      },
      iframe: {
        type: 'javascript',
        snippet: "%3Ciframe%20src%3D%22http%3A%2F%2Fwww.iframething.com%2Fpixel%3Fid%3Dfjdlsj%26id%3D%3C%25%3D%20user.id%20%25%3E%22%20%2F%3E"
      },
      interpolated_img: {
        type: 'image',
        snippet: '%3Cimg%20src%3D%22http%3A%2F%2Fwww.something.com%2Fpixel%3Fid%3Dsafjdksljfklds%26user%3D%3C%25%3D%20user.id%20%25%3E%22%20width%3D1%20height%3D0%20%2F%3E'
      },
    },
    context: { user: { id: 1234 } }
  }

  this.fixtures.pixel_data.main = { pixels: {
    all: [this.fixtures.pixel_data.pixels.img, this.fixtures.pixel_data.pixels.other_img],
    landing: [this.fixtures.pixel_data.pixels.iframe, this.fixtures.pixel_data.pixels.js]
  }}
});
