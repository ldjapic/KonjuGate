Wallet = Object:extend()

function Wallet:new()
  -- initial expenses consumed every month
  self.expenses={rent=3000, electric=800 ,heat=200 ,salaries=1000}
  self.incomes={membership=0}
  self.balance=300000
end

function Wallet:changeExpense(category,newAmount)
  self.expenses[category] = newAmount
end

function Wallet:debit(amount)
  self.balance=self.balance - amount
end

function Wallet:credit(amount)
  self.balance=self.balance + amount
end

function Wallet:getBalance()
  return self.balance
end

function Wallet:isBankrupt()
  if self.balance < 0 then
    return true
  else
    return false
  end
end

function Wallet:endOfMonth()
  for i,v in ipairs(expenses) do
    self.balance=self.balance-v
  end
  for i,v in ipairs(incomes) do
    self.balance=self.balance-v
  end
end