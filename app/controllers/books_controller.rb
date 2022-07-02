class BooksController < ApplicationController
    def index
		@books = Book.all
	end

	def create
		@book = Book.new(book_params)

		@book.save
		redirect_to books_url, notice: "Saved!"

	end

	def new
	end

	def edit
		@book = Book.find params[:id]
	end

	def show
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to books_url, notice: "Updated!"
		else
			render "edit", notice: "ERROR!"
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy

		respond_to do |format|
			format.html { redirect_to books_url, notice: "Book deleted!" }
			format.json { head :no_content }
		end
	end

	private
  def book_params
    params.require(:book).permit(:name, :author)
  end
end