assert = require "assert"

describe 'CSV2JSON', ->
  it 'should strip the file', ->
    input = "one\ntwo\nthree"

    assert.equal -1, [1,2,3].indexOf(0)