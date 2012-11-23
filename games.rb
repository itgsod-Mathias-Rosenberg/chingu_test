require 'chingu'

class Game < Chingu::Window

	#constructor
	def initialize
		super
		self.input = {esc: :exit}
		@Player = Player.create
	end
end

class Player < Chingu::GameObject

	#meta-constructor
	def setup
		@x, @y = 350, 400
		@image = Gosu::Image["camel.png"]
	end
end

Game.new.show