class UsersController < ApplicationController
	def dashboard
		@recipe = current_user.recipes.build
		@recipes = current_user.recipes
		@profile = current_user.profile
	end

	def show
		@friends = current_user.friends
	end

	def index
		@users = User.all
	end

	def inbox
   		@users = User.all
  	end

  	

	def calendar
		@followed_recipes = current_user.following
		@user_recipes = current_user.recipes
		@recipes = @user_recipes + @followed_recipes
		@calendar_title = Time.now.strftime("%A")
		@events = current_user.events

		@snacks = @user_recipes.where(:meal_type => "1") + @followed_recipes.where(:meal_type => "1")
		@side_dishes = @user_recipes.where(:meal_type => "2") + @followed_recipes.where(:meal_type => "2")
		@main_dishes = @user_recipes.where(:meal_type => "3") + @followed_recipes.where(:meal_type => "3")
		@desserts = @user_recipes.where(:meal_type => "4") + @followed_recipes.where(:meal_type => "4")
		@drinks = @user_recipes.where(:meal_type => "5") + @followed_recipes.where(:meal_type => "5")

		d = Date.today
		@month = d.strftime("%B")
		@week_begin = d.at_beginning_of_week.strftime("%-d")
		@week_end = d.at_end_of_week.strftime("%-d")
		@date_string = @month + " " + @week_begin + " - " + @week_end

	end
end