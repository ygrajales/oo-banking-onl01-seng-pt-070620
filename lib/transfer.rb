class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
 
 
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end  
  
  
  def valid?
    sender.valid?  && receiver.valid?
  end
 
  
  def execute_transaction
    
    if amount <= sender.balance && valid? && self.status == "pending"
      sender.withdrawal(amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    
  end
 
 
end
