(function() {
  var assert;

  assert = require("assert");

  describe('Array', function() {
    return describe('#indexOf()', function() {
      return it('should return -1 when the value is not present', function() {
        assert.equal(-1, [1, 2, 3].indexOf(5));
        return assert.equal(-1, [1, 2, 3].indexOf(0));
      });
    });
  });

}).call(this);
