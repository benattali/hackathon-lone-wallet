class Donors::UsersController < ApplicationController

	def dashboard
		@receipts  = TaxReceipt.all
		@donations_count= current_user.donations.count
		soldiers = current_user.donations.map(&:donated_soldiers)
		@total_soldiers = soldiers&.flatten.uniq.count
		@address = Address.find_by(user_id: current_user.id)
		@donations = Donation.where(user: current_user)
		@receipts = []
		@total_donation = 0
		@donations.each do |donation|
			@receipts << donation.tax_receipts
			@total_donation += donation.amount
		end
		@receipts = @receipts.flatten.uniq
	end

	def receipts
	end

	def download_pdf
		send_file "#{Rails.root}/app/assets/docs/receipt.pdf", type: "application/pdf", x_sendfile: true
	  end

end
