class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  before_action :set_journal

  # GET /reminders
  # GET /reminders.json
  def index
    @reminders = Reminder.all
  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
  end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
  end

  # GET /reminders/1/edit
  def edit
  end

  # POST /reminders
  # POST /reminders.json
  def create
    respond_to do |format|
      day_params[:days].each do |day, checked|
        next unless checked.to_i == 1

        @journal.reminders.build(reminder_params.merge({ day: day }))
      end
      if @journal.save
        format.html { redirect_to @journal, notice: 'Reminder was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { redirect_to @journal, alert: 'Reminder creation failed.' }
        format.json { render :show, status: :created }
      end
    end
  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to [@journal, @reminder], notice: 'Reminder was successfully updated.' }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    @reminder.destroy
    respond_to do |format|
      format.html { redirect_to journal_reminders_url(@journal, @reminder), notice: 'Reminder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  def set_journal
    @journal = Journal.find(params[:journal_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reminder_params
    params.require(:reminder).permit(:local_time, :time_zone)
  end

  def day_params
    params.require(:reminder).permit(days: {})
  end
end
