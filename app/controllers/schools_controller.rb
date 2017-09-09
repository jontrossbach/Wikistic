class SchoolsController < ApplicationController
  before_action :set_schools, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  def index
    @schools = current_user.schools
  end

  def show
    @photos = @school.photos
  end

  def new
    @school = current_user.schools.build
  end

  def create
    @school = current_user.schools.build(school_params)
    if @school.save
      if params[:images]
        params[:images].each do |image|
          @school.photos.create(image: image)
        end
      end
      @photos = @school.photos
      redirect_to edit_school_path(@school), notice: "Saved..."
    else
      flash[:alert] = "Please provide all information for this school."
      render :new
    end
  end

  def edit
    if current_user.id == @school.user.id
    @photos = @school.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @school.update(school_params)
      if params[:images]
        params[:images].each do |image|
          @school.photos.create(image: image)
        end
      end
      redirect_to edit_school_path(@school), notice: "Updated..."
    else
      flash[:alert] = "Please provide all information for this school."
      render :edit
    end
  end

  private
    def set_schools
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:school_name, :school_address, :website, :phone_number, :age_range, :institutional_type, :denomination, :diploma, :founded, :summary, :mission_statement, :admissions, :activities, :male_sports, :female_sports, :school_day_hours, :extended_hours, :financial_aid, :setting, :boarding, :endowment)
    end
end
