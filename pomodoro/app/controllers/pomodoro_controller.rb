class PomodoroController < ApplicationController
  def new
    @time = Time.new
    @test = "test"
  end
end
