

public class BankAccount {

    int balance;
    boolean isOpen;

    public synchronized void deposit(int amount) throws BankAccountActionInvalidException {
        canChange();
        checkNegative(amount);
        balance += amount;
    }



    public synchronized void withdraw(int amount) throws BankAccountActionInvalidException {
        canChange();
        checkNegative(amount);
        if (balance == 0) {
            throw new BankAccountActionInvalidException("Cannot withdraw money from an empty account");
        } else if (balance - amount < 0) {
            throw new BankAccountActionInvalidException("Cannot withdraw more money than is currently in the account");
        }
        balance -= amount;
    }

    public int getBalance() throws BankAccountActionInvalidException {
        canChange();
        return this.balance;
    }

    public void open() {
        this.isOpen = true;
    }

    public void close() {
        this.isOpen = false;
    }

    private void canChange() throws BankAccountActionInvalidException {
        if(!isOpen) {
            throw new BankAccountActionInvalidException("Account closed");
        }
    }

    private static void checkNegative(int amount) throws BankAccountActionInvalidException {
        if (amount < 0) {
            throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
        }
    }
}
