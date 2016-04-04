class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:show, :edit, :update, :destroy]

  # GET /exchanges
  # GET /exchanges.json
  def index
    @exchanges = Exchange.all
  end

  # GET /exchanges/1
  # GET /exchanges/1.json
  def show
  end

  # GET /exchanges/new/1
  def new
    verify_if_book_is_already_in_exchange
    @exchange = Exchange.new(receiver_book: BookTable.find(params[:book_id]))
    @availableBooks = BookTable.where(user_id: current_user.id).where(removed: 0).where.not(id: params[:book_id])
  end

  # GET /exchanges/1/edit
  def edit
  end

  # POST /exchanges
  # POST /exchanges.json
  def create
    @exchange = Exchange.new
    @receiver_book = BookTable.find(params[:book_id])
    @sender_book = BookTable.find(params[:exchange][:sender_book])
    update_books(@receiver_book,@sender_book)
    @exchange.receiver_book = @receiver_book
    @exchange.sender_book = @sender_book
    @exchange.status = :waiting
    if @exchange.save
      flash[:sucess] = t('views.exchange.new.success.create')
      redirect_to '/dashboard/exchanges_sent'
    else

    end
  end

  # PATCH/PUT /exchanges/1
  # PATCH/PUT /exchanges/1.json
  def update
    respond_to do |format|
      if @exchange.update(exchange_params)
        format.html { redirect_to @exchange, notice: 'Exchange was successfully updated.' }
        format.json { render :show, status: :ok, location: @exchange }
      else
        format.html { render :edit }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exchanges/1
  # DELETE /exchanges/1.json
  def destroy
    @exchange.destroy
    respond_to do |format|
      format.html { redirect_to exchanges_url, notice: 'Exchange was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange
      @exchange = Exchange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_params
        params.require(:exchange).permit(:sender_book)

    end

    def update_books(rcv,snd)
      rcv.update removed:1
      snd.update removed:1
    end

    def verify_if_book_is_already_in_exchange
      @book = BookTable.find(params[:book_id])
      if @book.removed? then
        flash[:danger] = t('views.exchange.errors.unavailable_book')
        redirect_to root_url
      end
    end
end
