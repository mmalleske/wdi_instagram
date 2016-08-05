class EntriesController < ApplicationController
  def index
    @entries = Entry.all.order(upvotes: :desc)
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.upvotes = 0
    if @entry.save
      redirect_to entries_path
    else
      raise "Cannot Save!"
    end
  end


  def update
    @entry = Entry.find(params[:id])
    if params[:upvote]
      @entry.upvotes += 1
    elsif params[:downvote]
      @entry.upvotes -= 1
    end
    respond_to do |format|
      if @entry.save
        format.html { redirect_to entries_path }
        format.js { }
      else
        raise "Cannot Save!"
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :link)
  end
end
