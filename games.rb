require 'chingu'

class Game < Chingu::Window

	#constructor
	def initialize
		super
		self.input = {esc: :exit}
		@player = Player.create
		5.times { Target.create}
	end

	def update
		super
		Laser.each_bounding_circle_collision(Target) do |laser, target|
      		laser.destroy
      		target.destroy
    	end
	end

end

class Player < Chingu::GameObject

	#meta-constructor
	def setup
		@x, @y = 750, 400
		@image = Gosu::Image["camel.png"]
		@speed = 4
		self.input = {
			holding_left: :left,
			holding_right: :right,
			holding_up: :up,
			holding_down: :down,
			holding_space: :fire
		}
	end

	def left
		unless @x - 70 <= 0
			@x -= @speed
		end
	end

	def right
		unless @x + 85 >= 800
			@x += @speed
		end
	end

	def up 
		unless @y - 70 <= 0
			@y -= @speed
		end
	end

	def down
		unless @y + 70 >= 600
			@y += @speed
		end
	end

	def fire
		Laser.create(x: self.x, y: self.y)
	end
end

class Laser < Chingu::GameObject
	has_traits :velocity, :collision_detection, :bounding_circle

	def setup
		@image = Gosu::Image["laserfull.png"]
		self.velocity_y = -10
		Gosu::Sound["beep.wav"].play
	end
end

class Target < Chingu::GameObject
	has_traits :collision_detection, :bounding_circle

	def setup
		@x = rand(800)
		@y = 100
		@image = Gosu::Image["target.png"]
	end
end

Game.new.show