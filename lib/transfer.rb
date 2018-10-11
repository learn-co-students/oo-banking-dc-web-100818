require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == 'complete'
      "This cannot happen"
    elsif self.valid? == false || sender.balance <= amount || self.status != 'pending'
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    else
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = 'complete'
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = 'reversed'
    end
  end
end
