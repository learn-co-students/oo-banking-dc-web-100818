class BankAccount

	attr_reader :name, :balance, :status, :deposit

	def initialize(name, balance = 1000, status = "open")
		@name = name
		@balance = balance
		@status = status
	end

	def balance=(balance)
		@balance = balance
	end

	def status=(status)
		@status = status
	end

	def deposit(num)
		self.balance += num 
	end

	def display_balance
		return "Your balance is $#{self.balance}."
	end

	def valid?
		if (self.status == "open" && self.balance > 0)
			true
		else 
			false
		end
	end

	def close_account
		self.status = "closed"
	end 
	# def name=(name)
	# 	@name = name
	# end
end
