public class ContactController {

    // Method to create a new Contact
    public static void createContact(String firstName, String lastName, String email) {
        Contact newContact = new Contact();
        newContact.FirstName = firstName;
        newContact.LastName = lastName;
        newContact.Email = email;
        
        try {
            insert newContact;
            System.debug('Contact created successfully: ' + newContact.Id);
        } catch (Exception e) {
            System.debug('Error creating Contact: ' + e.getMessage());
        }
    }

    // Method to update an existing Contact
    public static void updateContact(String contactId, String newEmail) {
        Contact contactToUpdate = [SELECT Id, Email FROM Contact WHERE Id = :contactId LIMIT 1];
        contactToUpdate.Email = newEmail;
        
        try {
            update contactToUpdate;
            System.debug('Contact updated successfully: ' + contactToUpdate.Id);
        } catch (Exception e) {
            System.debug('Error updating Contact: ' + e.getMessage());
        }
    }

    // Method to query Contacts based on a condition
    public static List<Contact> getContactsByLastName(String lastName) {
        List<Contact> contactsList = new List<Contact>();
        
        try {
            contactsList = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE LastName = :lastName];
            System.debug('Query returned ' + contactsList.size() + ' contacts.');
        } catch (Exception e) {
            System.debug('Error querying Contacts: ' + e.getMessage());
        }
        
        return contactsList;
    }
}