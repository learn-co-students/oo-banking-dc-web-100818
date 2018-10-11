class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  attr_accessor :sender, :receiver, :amount, :status

  def valid?
    self.sender.valid? == true && self.receiver.valid? == true
  end

  def execute_transaction
    if (@status == "pending" && (self.sender.balance >= @amount && self.sender.valid?))
      # binding.pry
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
