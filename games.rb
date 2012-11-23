require 'chingu'

class Games < Chingu::Window

	#constructor
	def initialize
		super
		self.input = {esc: :exit}
	end
end

Games.new.show