#############################################################
# Models
#############################################################

describe "Item", ->
  beforeEach ->
    @item = new Item()

  it "should have defaults", ->
    (expect @item.get 'part1').toEqual 'Hello'
    (expect @item.get 'part2').toEqual 'Backbone'

#############################################################
# Collections
#############################################################

describe "List", ->
  beforeEach ->
    @item1 = new Item({ part1: 'Foo' })
    @item2 = new Item({ part1: 'Bar' })
    @list  = new List([@item1, @item2])

  it "should contain two items", ->
    (expect @list.size()).toEqual 2

  it "should be able to output JSON", ->
    expected_json = [
      { part1 : 'Foo', part2 : 'Backbone' },
      { part1 : 'Bar', part2 : 'Backbone' }
    ]

    (expect @list.toJSON()).toEqual expected_json

#############################################################
# Views
#############################################################

describe "ListView", ->
  beforeEach ->
    @list_view = new ListView

  it "should be able to add items", ->
    @list_view.addItem()
    @list_view.addItem()
    @list_view.addItem()

    (expect @list_view.collection.length).toEqual 3
