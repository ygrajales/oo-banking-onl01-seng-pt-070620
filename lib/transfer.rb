class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
 
 
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end  
  
  
  def valid?
    @sender.valid?  && @receiver.valid?
  end
 
  
  def execute_transaction
    
    if @amount >= @sender.balance
      @sender.withdrawal(@amount)
      @receiver.deposit(@amount)
    else
      "Transaction rejected. Please check your account balance."
    end
    
  end
 
 
end
