public class AccountController {

    // Method to create a new Account
    public static void createAccount(String accountName, String accountType) {
        Account newAccount = new Account();
        newAccount.Name = accountName;
        newAccount.Type = accountType;
        
        try {
            insert newAccount;
            System.debug('Account created successfully: ' + newAccount.Id);
        } catch (Exception e) {
            System.debug('Error creating Account: ' + e.getMessage());
        }
    }

    // Method to update an existing Account
    public static void updateAccount(String accountId, String newAccountName) {
        Account accToUpdate = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        accToUpdate.Name = newAccountName;
        
        try {
            update accToUpdate;
            System.debug('Account updated successfully: ' + accToUpdate.Id);
        } catch (Exception e) {
            System.debug('Error updating Account: ' + e.getMessage());
        }
    }

    // Method to query Accounts based on a condition
    public static List<Account> getAccountsByType(String accountType) {
        List<Account> accountsList = new List<Account>();
        
        try {
            accountsList = [SELECT Id, Name, Type FROM Account WHERE Type = :accountType];
            System.debug('Query returned ' + accountsList.size() + ' accounts.');
        } catch (Exception e) {
            System.debug('Error querying Accounts: ' + e.getMessage());
        }
        
        return accountsList;
    }
}