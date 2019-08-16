puts 'Destroying old database...'
TaxReceipt.destroy_all
SoldiersDonation.destroy_all
Donation.destroy_all
Address.destroy_all
User.destroy_all

puts "Generating donors"

bill = User.create!(email: "bill_gates@gmail.com",
									 password: "123456",
									 role: 1,
									 first_name: "Bill",
									 last_name: "Gates")

elon = User.create!(email: "elon_musk@gmail.com",
									 password: "123456",
									 role: 1,
									 first_name: "Elon",
									 last_name: "Musk")

abutbul = User.create!(email: "ben_abutbul@gmail.com",
									 password: "123456",
									 role: 0,
									 first_name: "Ben",
									 last_name: "Abutbul")

leighton = User.create!(email: "bryan_leighton@gmail.com",
									 password: "123456",
									 role: 0,
									 first_name: "Bryan",
									 last_name: "Leighton")

resnik = User.create!(email: "axel_resnik@gmail.com",
									 password: "123456",
									 role: 0,
									 first_name: "Axel",
									 last_name: "Resnik")

attali = User.create!(email: "ben_attali@gmail.com",
									 password: "123456",
									 role: 0,
									 first_name: "Ben",
									 last_name: "Attali")

puts "Finished generating donors"

puts "Generating addresses"

medina = Address.create!(name: "business",
													zip: "98039",
													city: "Medina",
													state: "Washington",
													longitude: "-122.235071",
													latitude: "47.624315",
													address: "1599 79th Pl NE",
													user: bill)

bel_air = Address.create!(name: "business",
													zip: "90077",
													city: "Bel Air",
													state: "Los Angeles",
													longitude: "-118.458456",
													latitude: "34.098196",													
													address: "10898 Vicenza Way",
													user: elon)

puts "Finished generating addresses"

puts "Generating donations"

bill_ten_thou = Donation.create!(amount: 10000,
														 user: bill)

bill_five_thou = Donation.create!(amount: 5000,
														 user: bill)

bill_one_thou = Donation.create!(amount: 1000,
														 user: bill)

bill_one_thou_2 = Donation.create!(amount: 1000,
														 user: bill)

elon_five_thou = Donation.create!(amount: 5000,
														user: elon)

elon_two_thou = Donation.create!(amount: 2000,
														user: elon)

puts "Finished generating donations"

puts "Generating tax receipts"

bill_receipt = TaxReceipt.create!(number: 101,
																	donation: bill_ten_thou)

elon_receipt = TaxReceipt.create!(number: 102,
																	donation: elon_five_thou)

bill_receipt2 = TaxReceipt.create!(number: 103,
																	donation: bill_five_thou)

bill_receipt3 = TaxReceipt.create!(number: 104,
																	donation: bill_one_thou)

bill_receipt4 = TaxReceipt.create!(number: 105,
																	donation: bill_one_thou_2)

elon_receipt2 = TaxReceipt.create!(number: 106,
																	donation: elon_two_thou)

puts "Finished generating tax receipts"

puts "Generating soldier donations"

total_donations = Donation.all
soldiers = User.where(role: 0)
soldiers_count = User.where(role: 0).count

total_donations.each do |single_donation|
	soldiers.each do |soldier|
		SoldiersDonation.create!(donation: single_donation,
														 amount_per_soldier: (single_donation.amount / soldiers_count).round(2),								
														 user: soldier)
	end
end

puts "Finished generating soldier donations"
