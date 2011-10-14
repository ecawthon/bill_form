class CreditCard < ActiveRecord::Base
	validates :cardholder, :presence => true
	validates :number, :presence => true, :number => true
	validates :expiration, :presence => true, :expiration => true
	validates :email, :presence => true, :email => true
	validates :code, :presence => true
	validates :company, :presence => true
end
