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
    if @amount >= @sender.
    @sender.withdrawal(@amount)
    @receiver.deposit(@amount)
  end
 
 
end
