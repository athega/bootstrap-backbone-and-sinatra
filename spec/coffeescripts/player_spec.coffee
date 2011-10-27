describe "Player", ->
  beforeEach ->
    @player = new Player()

  it "should be able to play", ->
    @player.play()
    (expect @player.playing).toEqual true

  it "true to be true", ->
    (expect true).toEqual true
