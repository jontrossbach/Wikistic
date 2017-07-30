class SchoolsController < ApplicationController
  before_action :set_schools, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  def index
    @schools = School.all
  end

  def show

  end

  def new
    @school = current_user.schools.build
  end

  def create
    @school = current_user.schools.build(school_params)
    if @school.save
      redirect_to @school, notice: "Saved..."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @school.update(school_params)
      redirect_to @school, notice: "Updated..."
    else
      render :edit
    end
  end

  private
    def set_schools
      @schools = Schools.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:school_name, :school_address, :website, :phone_number, :age_range, :institutional_type, :denomination, :diploma, :founded, :summary, :mission_statement, :admissions, :activities, :male_sports, :female_sports, :school_day_hours, :extended_hours, :financial_aid, :setting, :boarding, :endowment)
    end
end
