class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
  def create

  end
  def new
    @entry = Entry.new
  end
  def edit
  end
  def show
  end
  def update
  end
  def update
  end
  def destroy
  end

end
