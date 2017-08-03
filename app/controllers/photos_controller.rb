class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		school = @photo.school

		@photo.destroy
		@photos = Photo.where(school_id: school.id)

		respond_to :js
	end
end
