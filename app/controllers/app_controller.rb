class AppController < ApplicationController
  def index
    if params[:category].nil? then
      @book_tables = BookTable.all.paginate(:page => params[:page], :per_page => 8)
    else
      begin
        @book_tables = BookTable.where(category_id: Category.find(params[:category]).id)
                                .paginate(:page => params[:page], :per_page => 8)
      rescue
        redirect_to root_url
      end
    end
  end

end
