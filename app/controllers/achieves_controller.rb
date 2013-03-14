# coding: utf-8

class AchievesController < ApplicationController

	def index
		@achieves = Achieve.all(:order => "created_at DESC")
	end

	def show
		@achieve = Achieve.find(params[:id])
		@achieves = Achieve.all(:order => "created_at DESC")

	end


	def new
		@achieve = Achieve.new
	end

	def create
		@achieve = Achieve.new(params[:achieve])
		if @achieve.save
			redirect_to achieves_path, notice: "成功したよん"
		else
			#newのviewをもう一回書きなおす
			render action: "new"
		end

	end

	def edit
		@achieve = Achieve.find(params[:id])
	end

	def update
		@achieve = Achieve.find(params[:id])
		if @achieve.update_attributes(params[:achieve])
			redirect_to achieves_path, notice: "更新されました！"
		else
			render action: "edit"
		end

	end

	def destroy
		@achieve = Achieve.find(params[:id])
		@achieve.destroy
		redirect_to achieves_path, notice:"削除されたよん！"
	end

end
