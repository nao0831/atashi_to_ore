# coding: utf-8

class AchievesController < ApplicationController

	def index
		@achieves = Achieve.all(:order => "created_at DESC")
	end

	def show
		@achieve = Achieve.find(params[:id])
		@achieves = Achieve.all(:order => "created_at DESC")

	end

end
