class NotesController < ApplicationController
  before_action :ensure_destroy_targets_own_note, only: :destroy
  def destroy
    @note = Note.find(params[:id])
    @track = @note.track
    @note.destroy!
    redirect_to track_url(@track)
  end

  def ensure_destroy_targets_own_note
    @note = Note.find(params[:id])
    render text: "403 FORBIDDEN" unless @note.user == current_user
  end
end
