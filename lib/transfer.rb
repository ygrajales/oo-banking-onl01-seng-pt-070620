class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
 
 
  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end  
  
  
  def valid?
    sender.valid?  && receiver.valid?
  end
 
  
  def execute_transaction
    
    if amount < sender.balance && valid? && self.status == "pending"
      sender.withdrawal(self.amount)
      receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    
  end
  
  
  def reverse_transfer
    if amount < receiver.balance && valid? && self.status == "complete"
      sender.deposit(self.amount)
      receiver.withdrawal(self.amount)
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transation rejected.  Please check your account balance."
    end
  end
 
 
end
