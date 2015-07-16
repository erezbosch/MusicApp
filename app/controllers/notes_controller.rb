class NotesController < ApplicationController
  def destroy
    @note = Note.find(params[:id])
    @track = @note.track
    @note.destroy!
    redirect_to track_url(@track)
  end
end
