class LandmarksController < ApplicationController
  get '/landmarks/new' do
    haml :'landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all.order(:name)
    haml :'landmarks/index'
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])
    redirect '/landmarks'
  end
end
