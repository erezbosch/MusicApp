class NotesController < ApplicationController
  before_action :ensure_legal_destroy, only: :destroy

  def destroy
    @note = Note.find(params[:id])
    @track = @note.track
    @note.destroy!
    redirect_to track_url(@track)
  end

  def ensure_legal_destroy
    @note = Note.find(params[:id])
    unless @note.user == current_user || current_user.admin
      render text: "403 FORBIDDEN"
    end
  end
end
